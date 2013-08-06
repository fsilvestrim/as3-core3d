package {
import com.adobe.utils.PerspectiveMatrix3D;

import flash.display.Sprite;
import flash.display.StageAlign;
import flash.display.StageScaleMode;
import flash.display3D.Context3D;
import flash.events.Event;

public class Stage3DApplication extends Sprite {
    protected var context3D:Context3D;
    protected var projectionMatrix:PerspectiveMatrix3D = new PerspectiveMatrix3D();
    private var _meshes:Vector.<Mesh> = new Vector.<Mesh>();

    public function Stage3DApplication() {
        addEventListener(Event.ADDED_TO_STAGE, added);
    }

    private function added(event:Event):void {
        removeEventListener(Event.ADDED_TO_STAGE, added);
        stage.scaleMode = StageScaleMode.NO_SCALE;
        stage.align = StageAlign.TOP_LEFT;
        stage.stage3Ds[0].addEventListener(Event.CONTEXT3D_CREATE, onContext3DCreated);
        stage.stage3Ds[0].requestContext3D();
    }

    private function onContext3DCreated(event:Event):void {
        stage.stage3Ds[0].removeEventListener(Event.CONTEXT3D_CREATE, onContext3DCreated);
        stage.addEventListener(Event.ENTER_FRAME, draw);
        context3D = (event.currentTarget as flash.display.Stage3D).context3D;
        context3D.enableErrorChecking = true;
        context3D.configureBackBuffer(stage.stageWidth, stage.stageHeight, 0, false);
        projectionMatrix.perspectiveFieldOfViewLH(45.0*Math.PI/180,stage.stageWidth/stage.stageHeight,0.1,1000.0);
        init();
    }

    protected function init () : void {

    }

    protected function destroy () : void {

    }

    protected function draw (event:Event=null) : void {
        context3D.clear(0,0,0);
        for each (var mesh : Mesh in _meshes) mesh.draw();
        context3D.present();
    }

    public function addMesh (mesh:Mesh) : void {
        _meshes.push(mesh);
    }

}
}
