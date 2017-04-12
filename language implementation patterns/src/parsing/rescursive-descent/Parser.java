public abstract class Parser {
    Lexer input;
    Token lookahead;
    public void match(int x) {
        if (lookahead.type == x) {
            consume();
        } else {
            throw new Error("expecting " + input.getTokenName(x) +
                            "; found " + lookahead);
        }
    }

    public void consume() {
        lookahead = input.nextToken();
    }
}
