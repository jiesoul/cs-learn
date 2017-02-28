package stone.ast;

import stone.Token;

import java.util.List;

/**
 * Created by zhangyunjie on 2017/2/27.
 */
public class StringLiteral extends ASTLeaf {

    public StringLiteral(Token t) {
        super(t);
    }

    public String value() {
        return token().getText();
    }
}
