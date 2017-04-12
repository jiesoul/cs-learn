public class ListLexer extends Lexer {
    public static int NAME = 2;
    public static int COMMA = 3;
    public static int LBRACK = 4;
    public static int RBRACK = 5;
    public static String[] tokenNames =
        {"n/a", "<EOF>", "NAME", "COMMA", "LBRACK", "RBRACK"};
    public String getTokenName(int x) {
        return tokenNames[x];
    }
    public ListLexer(String input) {
        super(input);
    }

    boolean isLETTER() {
        return c >= "a" && c <= 'z' || c >= 'A' && c <= 'Z';
    }

    public Token nextToken() {
        while (c != EOF) {
            switch (c) {
            case ' ': WS();
            case '\t': WS();
            case '\n': WS();
            case '\r': WS();
            case ',':
                consume();
                return new Token(COMMA, ",");
            case '[':
                consume();
                return new Token(LBRACK, "[");
            case ']':
                consume();
                return new Token(RBRACK, "]");
            default:
                if (isLETTER()) {
                    return NAME();
                }
                throw new Error("invalid character: " + c);
            }
        }

        return new Token(EOF_TYPE, "<EOF>");
    }

    Token NAME() {
        StringBuilder buf = new StringBuilder();
        do {
            buf.append(c);
            consume();

        } while (isLETTER());
        return new Token(NAME, buf.toString());
    }
    

}
