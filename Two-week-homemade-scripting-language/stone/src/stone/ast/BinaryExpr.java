package stone.ast;

import java.util.List;

/**
 * Created by zhangyunjie on 2017/2/27.
 */
public class BinaryExpr extends ASTList {

    public BinaryExpr(List<ASTree> c) {
        super(c);
    }

    public ASTree left() {
       return child(0);
    }

    public String operator() {
        return ((ASTLeaf)child(1)).token().getText();
    }

    public ASTree right() {
        return child(2);
    }
}
