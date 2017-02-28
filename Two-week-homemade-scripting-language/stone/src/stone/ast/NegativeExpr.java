package stone.ast;

import java.util.List;

/**
 * Created by zhangyunjie on 2017/2/27.
 */
public class NegativeExpr extends ASTList {

    public NegativeExpr(List<ASTree> c) {
        super(c);
    }

    public ASTree operand() {
        return child(0);
    }

    public String toString() {
        return "-" + operand();
    }
}
