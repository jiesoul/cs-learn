package parsing.backtrack;

import java.util.ArrayList;
import java.util.List;

public class Parser {
    Lexer input;
    List<Integer> markers;
    List<Token> lookahead;
    int k;
    int p  = 0;

    public Parser(Lexer input, int k) {
        this.input = input;
        this.k = k;
        lookahead = new ArrayList<>();
        for (int i=1; i<=k; i++) {
            consume();
        }

    }

    public void consume() {
        lookahead[p] = input.nextToken();
        p = (p + 1) % k;
    }
    public Token LT(int i) {
        sync(i);
        return lookahead[(p+i-1) % k];
    }

    public int LA(int i) {

        return LT(i).type;
    }

    public void match(int x) throws MismatchedTokenException {
        if (LA(1) == x) {
            consume();
        } else {
            throw new MismatchedTokenException("expecting " +
                    input.getTokenName(x) + "; found " + LT(1));
        }
    }

    public void sync(int i) {
        if (p+i-1 > (lookahead.size()-1)) {
            int n = (p+i-1) - (lookahead.size()-1);
            fill(n);
        }
    }

    public void fill(int n) {
        for (int i=1; i<=n; i++) {
            lookahead.add(input.nextToken());
        }
    }
}
