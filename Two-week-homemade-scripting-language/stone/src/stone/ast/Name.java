package stone.ast;

import stone.Token;

/**
 * Created by zhangyunjie on 2017/2/27.
 */
public class Name extends ASTLeaf {

    public Name(Token t) {
        super(t);
    }

    public String name() {
        return token().getText();
    }
}
