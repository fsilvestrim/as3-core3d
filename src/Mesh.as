package {
import flash.display3D.Context3D;
import flash.display3D.Context3DVertexBufferFormat;
import flash.display3D.IndexBuffer3D;
import flash.display3D.Program3D;
import flash.display3D.VertexBuffer3D;
import flash.geom.Matrix3D;

public class Mesh {
    protected var context3D:Context3D;
    protected var shaderProgram:Program3D;
    protected var vertexBuffer:VertexBuffer3D;
    protected var indexBuffer:IndexBuffer3D;

    protected var modelMatrix:Matrix3D = new Matrix3D();
    private var _vertices :Vector.<Number>;
    private var _indices :Vector.<uint>;

    public function Mesh(context3d:Context3D) {
        this.context3D = context3d;
    }

    public function setVertexBuffer (vertices:Vector.<Number>) : void {
        _vertices = vertices;
        vertexBuffer = context3D.createVertexBuffer( _vertices.length/3, 3);
        vertexBuffer.uploadFromVector(_vertices, 0, _vertices.length/3);
        context3D.setVertexBufferAt( 0, vertexBuffer,  0, Context3DVertexBufferFormat.FLOAT_3 ); //va0
    }

    public function setIndexBuffer (indices :Vector.<uint>) : void {
        _indices = indices;
        indexBuffer = context3D.createIndexBuffer( _indices.length );
        indexBuffer.uploadFromVector(_indices, 0, _indices.length );
    }

    public function set shader (shader:Shader): void {
        shaderProgram = context3D.createProgram();
        shader.assemble(context3D);
        shaderProgram.upload( shader.vertexAssembler.agalcode, shader.fragmentAssembler.agalcode);
        context3D.setProgram ( shaderProgram );
    }

    public function draw () : void {
        modelMatrix.append()
        context3D.drawTriangles( indexBuffer );
    }
}
}
