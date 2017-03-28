package me.jiesoul.cflat.compiler;

/**
 * Created by zhangyunjie on 2017/3/27.
 */
public class Compiler {

    public static final String ProgramName = "cbc";
    public static final String Version = "1.0.0";

    public static void main(String[] args) {
        new Compiler(ProgramName).commmandMain(args);
    }

    private final ErrorHandler errorHandler;

    public Compiler(String programName) {
        this.errorHandler = new ErrorHandler(programName);
    }

    public void commandMain(String[] args) {
        Options opts = Options.parse(args);
        List<SourceFile> srcs = opts.sourceFiles();
        build(srcs, opts);
    }

    public void build(List<SourceFile> srcs, Options opts) {
        for (SourceFile src : srcs) {
            compile(src.path(), opts.asmFileNameOf(src), opts);
            assemble(src.path(), opts.objFileNameOf(src), opts);
        }

        link(opts);
    }

    public void compile(String srcPath, String destPath, Options opts) throws CompileException {
        AST ast = parseFile(srcPath, opts);
        TypeTable types = opts.typeTable();
        AST sem = semanticAnalye(ast, types, opts);
        IR ir = new IRGenerator()(errorHandler).genrate(sem, types);
        String asm = generateAssmbly(ir, opts);
        writeFile(destPath, asm);
    }
}
