package stone.ast;

import stone.Token;

/**
 * Created by zhangyunjie on 2017/2/27.
 */
public class NumberLiteral extends ASTLeaf {
    public NumberLiteral(Token t) {
        super(t);
    }

    public int value() {
        return token().getNumber();
    }
}
