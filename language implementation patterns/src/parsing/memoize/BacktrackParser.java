public class BacktrackParser extends Parser {

    public void stat() throws RecognitionException {
        if (speculate_stat_alt1()) {
            list();
            match(Lexer.EOF_TYPE);
        } else if (speculate_stat_alt2()) {
            assign();
            match(Lexer.EOF_TYPE);
        } else {
            throw new NoViableAltException("expecting stat found " + LT(1));
        }
    }
    public boolean speculate_stat_alt1() {
        boolean success = true;
        mark();
        try {
            list();
            match(Lexer.EOF_TYPE);
        }
        catch (RecognitionException e) {
            success = false;
        }
        release();
        return success;
    }
    public boolean speculate_stat_alt2 () {
        boolean success = true;
        mark();
        try {
            assign();
            match(Lexer.EOF_TYPE);
        } catch (RecognitionException e) {
            success = false;
        }
        release();
        return success;
    }

    public void _list () throws RecognitionException {
        System.out.println("parse list rule at token index " + index());
        match(BacktrackParser.LBRACK);
        elements();
        match(BacktrackParser.RBRACK);
    }

    public void list() throws RecognitionException {
        boolean failed = false;
        int startTokenIndex = index();
        if (isSpeculating() && alreadyParsedRule(list_memo)) {
            return;
        }
        try {
            _list();
        } catch (RecognitionException re) {
            failed = true;
            throw re;
        } finally {
            if (isSpeculating()) {
                memoize(list_memo, startTokenIndex, failed);
            }
        }
    }
}