package {

public class Stage3D extends Stage3DApplication {
    override protected function init () : void {
        var shader : Shader = new Shader();
        var mesh0 : Mesh = new Mesh(context3D);
        mesh0.setVertexBuffer(Vector.<Number>([
                -0.5,   -0.5,   0.0,
                0.5,    -0.5,   0.0,
                0.5,    0.5,    0.0,
                -0.5,   0.5,    0.0,]));
        mesh0.setIndexBuffer(Vector.<uint> ([ 0, 1, 2,        0, 2, 3 ]));
        mesh0.shader = shader;
        addMesh(mesh0);
    }
}
}