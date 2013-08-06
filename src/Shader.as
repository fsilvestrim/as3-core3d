package {
import com.adobe.utils.AGALMiniAssembler;

import flash.display3D.Context3D;
import flash.display3D.Context3DProgramType;

public class Shader {
    internal var vertexAssembler:AGALMiniAssembler = new AGALMiniAssembler();
    internal var fragmentAssembler:AGALMiniAssembler = new AGALMiniAssembler();

    internal function assemble(context3D:Context3D): void {
        vertexAssembler.assemble( Context3DProgramType.VERTEX,vertexShader);
        fragmentAssembler.assemble( Context3DProgramType.FRAGMENT,fragmentShader);
        context3D.setProgramConstantsFromVector(Context3DProgramType.VERTEX, 0,vertexConstants);
        context3D.setProgramConstantsFromVector(Context3DProgramType.FRAGMENT, 0,fragmentConstants);
    }

    protected function get vertexShader(): String {
        return "mov op, va0";
    }

    protected function get vertexConstants(): Vector.<Number> {
        return  Vector.<Number>([ 1.0, 1.0, 0.0, 1.0]);
    }

    protected function get fragmentShader(): String {
        return  "mov oc, fc0";
    }

    protected function get fragmentConstants(): Vector.<Number> {
        return  Vector.<Number>([ 1.0, 1.0, 0.0, 1.0]);
    }


}
}

