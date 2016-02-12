// $ANTLR 3.5 /Users/zhi/Documents/workspace/bakar/sireum-bakar-jago/src/main/scala/org/sireum/bakar/policy/parser/Policy.g 2016-02-11 23:25:17

package org.sireum.bakar.policy.parser;
import java.util.ArrayList;
import java.util.HashMap;


import org.antlr.runtime.*;
import java.util.Stack;
import java.util.List;
import java.util.ArrayList;

@SuppressWarnings("all")
public class PolicyLexer extends Lexer {
	public static final int EOF=-1;
	public static final int T__8=8;
	public static final int T__9=9;
	public static final int T__10=10;
	public static final int T__11=11;
	public static final int T__12=12;
	public static final int T__13=13;
	public static final int T__14=14;
	public static final int T__15=15;
	public static final int T__16=16;
	public static final int T__17=17;
	public static final int T__18=18;
	public static final int T__19=19;
	public static final int T__20=20;
	public static final int T__21=21;
	public static final int T__22=22;
	public static final int T__23=23;
	public static final int T__24=24;
	public static final int T__25=25;
	public static final int T__26=26;
	public static final int T__27=27;
	public static final int COMMENT=4;
	public static final int ID=5;
	public static final int NUM_INT=6;
	public static final int WS=7;

	// delegates
	// delegators
	public Lexer[] getDelegates() {
		return new Lexer[] {};
	}

	public PolicyLexer() {} 
	public PolicyLexer(CharStream input) {
		this(input, new RecognizerSharedState());
	}
	public PolicyLexer(CharStream input, RecognizerSharedState state) {
		super(input,state);
	}
	@Override public String getGrammarFileName() { return "/Users/zhi/Documents/workspace/bakar/sireum-bakar-jago/src/main/scala/org/sireum/bakar/policy/parser/Policy.g"; }

	// $ANTLR start "T__8"
	public final void mT__8() throws RecognitionException {
		try {
			int _type = T__8;
			int _channel = DEFAULT_TOKEN_CHANNEL;
			// /Users/zhi/Documents/workspace/bakar/sireum-bakar-jago/src/main/scala/org/sireum/bakar/policy/parser/Policy.g:8:6: ( '(' )
			// /Users/zhi/Documents/workspace/bakar/sireum-bakar-jago/src/main/scala/org/sireum/bakar/policy/parser/Policy.g:8:8: '('
			{
			match('('); 
			}

			state.type = _type;
			state.channel = _channel;
		}
		finally {
			// do for sure before leaving
		}
	}
	// $ANTLR end "T__8"

	// $ANTLR start "T__9"
	public final void mT__9() throws RecognitionException {
		try {
			int _type = T__9;
			int _channel = DEFAULT_TOKEN_CHANNEL;
			// /Users/zhi/Documents/workspace/bakar/sireum-bakar-jago/src/main/scala/org/sireum/bakar/policy/parser/Policy.g:9:6: ( ')' )
			// /Users/zhi/Documents/workspace/bakar/sireum-bakar-jago/src/main/scala/org/sireum/bakar/policy/parser/Policy.g:9:8: ')'
			{
			match(')'); 
			}

			state.type = _type;
			state.channel = _channel;
		}
		finally {
			// do for sure before leaving
		}
	}
	// $ANTLR end "T__9"

	// $ANTLR start "T__10"
	public final void mT__10() throws RecognitionException {
		try {
			int _type = T__10;
			int _channel = DEFAULT_TOKEN_CHANNEL;
			// /Users/zhi/Documents/workspace/bakar/sireum-bakar-jago/src/main/scala/org/sireum/bakar/policy/parser/Policy.g:10:7: ( ',' )
			// /Users/zhi/Documents/workspace/bakar/sireum-bakar-jago/src/main/scala/org/sireum/bakar/policy/parser/Policy.g:10:9: ','
			{
			match(','); 
			}

			state.type = _type;
			state.channel = _channel;
		}
		finally {
			// do for sure before leaving
		}
	}
	// $ANTLR end "T__10"

	// $ANTLR start "T__11"
	public final void mT__11() throws RecognitionException {
		try {
			int _type = T__11;
			int _channel = DEFAULT_TOKEN_CHANNEL;
			// /Users/zhi/Documents/workspace/bakar/sireum-bakar-jago/src/main/scala/org/sireum/bakar/policy/parser/Policy.g:11:7: ( ':' )
			// /Users/zhi/Documents/workspace/bakar/sireum-bakar-jago/src/main/scala/org/sireum/bakar/policy/parser/Policy.g:11:9: ':'
			{
			match(':'); 
			}

			state.type = _type;
			state.channel = _channel;
		}
		finally {
			// do for sure before leaving
		}
	}
	// $ANTLR end "T__11"

	// $ANTLR start "T__12"
	public final void mT__12() throws RecognitionException {
		try {
			int _type = T__12;
			int _channel = DEFAULT_TOKEN_CHANNEL;
			// /Users/zhi/Documents/workspace/bakar/sireum-bakar-jago/src/main/scala/org/sireum/bakar/policy/parser/Policy.g:12:7: ( ':=' )
			// /Users/zhi/Documents/workspace/bakar/sireum-bakar-jago/src/main/scala/org/sireum/bakar/policy/parser/Policy.g:12:9: ':='
			{
			match(":="); 

			}

			state.type = _type;
			state.channel = _channel;
		}
		finally {
			// do for sure before leaving
		}
	}
	// $ANTLR end "T__12"

	// $ANTLR start "T__13"
	public final void mT__13() throws RecognitionException {
		try {
			int _type = T__13;
			int _channel = DEFAULT_TOKEN_CHANNEL;
			// /Users/zhi/Documents/workspace/bakar/sireum-bakar-jago/src/main/scala/org/sireum/bakar/policy/parser/Policy.g:13:7: ( ';' )
			// /Users/zhi/Documents/workspace/bakar/sireum-bakar-jago/src/main/scala/org/sireum/bakar/policy/parser/Policy.g:13:9: ';'
			{
			match(';'); 
			}

			state.type = _type;
			state.channel = _channel;
		}
		finally {
			// do for sure before leaving
		}
	}
	// $ANTLR end "T__13"

	// $ANTLR start "T__14"
	public final void mT__14() throws RecognitionException {
		try {
			int _type = T__14;
			int _channel = DEFAULT_TOKEN_CHANNEL;
			// /Users/zhi/Documents/workspace/bakar/sireum-bakar-jago/src/main/scala/org/sireum/bakar/policy/parser/Policy.g:14:7: ( '<=' )
			// /Users/zhi/Documents/workspace/bakar/sireum-bakar-jago/src/main/scala/org/sireum/bakar/policy/parser/Policy.g:14:9: '<='
			{
			match("<="); 

			}

			state.type = _type;
			state.channel = _channel;
		}
		finally {
			// do for sure before leaving
		}
	}
	// $ANTLR end "T__14"

	// $ANTLR start "T__15"
	public final void mT__15() throws RecognitionException {
		try {
			int _type = T__15;
			int _channel = DEFAULT_TOKEN_CHANNEL;
			// /Users/zhi/Documents/workspace/bakar/sireum-bakar-jago/src/main/scala/org/sireum/bakar/policy/parser/Policy.g:15:7: ( '=>' )
			// /Users/zhi/Documents/workspace/bakar/sireum-bakar-jago/src/main/scala/org/sireum/bakar/policy/parser/Policy.g:15:9: '=>'
			{
			match("=>"); 

			}

			state.type = _type;
			state.channel = _channel;
		}
		finally {
			// do for sure before leaving
		}
	}
	// $ANTLR end "T__15"

	// $ANTLR start "T__16"
	public final void mT__16() throws RecognitionException {
		try {
			int _type = T__16;
			int _channel = DEFAULT_TOKEN_CHANNEL;
			// /Users/zhi/Documents/workspace/bakar/sireum-bakar-jago/src/main/scala/org/sireum/bakar/policy/parser/Policy.g:16:7: ( 'Declassifier' )
			// /Users/zhi/Documents/workspace/bakar/sireum-bakar-jago/src/main/scala/org/sireum/bakar/policy/parser/Policy.g:16:9: 'Declassifier'
			{
			match("Declassifier"); 

			}

			state.type = _type;
			state.channel = _channel;
		}
		finally {
			// do for sure before leaving
		}
	}
	// $ANTLR end "T__16"

	// $ANTLR start "T__17"
	public final void mT__17() throws RecognitionException {
		try {
			int _type = T__17;
			int _channel = DEFAULT_TOKEN_CHANNEL;
			// /Users/zhi/Documents/workspace/bakar/sireum-bakar-jago/src/main/scala/org/sireum/bakar/policy/parser/Policy.g:17:7: ( 'Domain' )
			// /Users/zhi/Documents/workspace/bakar/sireum-bakar-jago/src/main/scala/org/sireum/bakar/policy/parser/Policy.g:17:9: 'Domain'
			{
			match("Domain"); 

			}

			state.type = _type;
			state.channel = _channel;
		}
		finally {
			// do for sure before leaving
		}
	}
	// $ANTLR end "T__17"

	// $ANTLR start "T__18"
	public final void mT__18() throws RecognitionException {
		try {
			int _type = T__18;
			int _channel = DEFAULT_TOKEN_CHANNEL;
			// /Users/zhi/Documents/workspace/bakar/sireum-bakar-jago/src/main/scala/org/sireum/bakar/policy/parser/Policy.g:18:7: ( 'Ordered' )
			// /Users/zhi/Documents/workspace/bakar/sireum-bakar-jago/src/main/scala/org/sireum/bakar/policy/parser/Policy.g:18:9: 'Ordered'
			{
			match("Ordered"); 

			}

			state.type = _type;
			state.channel = _channel;
		}
		finally {
			// do for sure before leaving
		}
	}
	// $ANTLR end "T__18"

	// $ANTLR start "T__19"
	public final void mT__19() throws RecognitionException {
		try {
			int _type = T__19;
			int _channel = DEFAULT_TOKEN_CHANNEL;
			// /Users/zhi/Documents/workspace/bakar/sireum-bakar-jago/src/main/scala/org/sireum/bakar/policy/parser/Policy.g:19:7: ( 'in' )
			// /Users/zhi/Documents/workspace/bakar/sireum-bakar-jago/src/main/scala/org/sireum/bakar/policy/parser/Policy.g:19:9: 'in'
			{
			match("in"); 

			}

			state.type = _type;
			state.channel = _channel;
		}
		finally {
			// do for sure before leaving
		}
	}
	// $ANTLR end "T__19"

	// $ANTLR start "T__20"
	public final void mT__20() throws RecognitionException {
		try {
			int _type = T__20;
			int _channel = DEFAULT_TOKEN_CHANNEL;
			// /Users/zhi/Documents/workspace/bakar/sireum-bakar-jago/src/main/scala/org/sireum/bakar/policy/parser/Policy.g:20:7: ( 'is' )
			// /Users/zhi/Documents/workspace/bakar/sireum-bakar-jago/src/main/scala/org/sireum/bakar/policy/parser/Policy.g:20:9: 'is'
			{
			match("is"); 

			}

			state.type = _type;
			state.channel = _channel;
		}
		finally {
			// do for sure before leaving
		}
	}
	// $ANTLR end "T__20"

	// $ANTLR start "T__21"
	public final void mT__21() throws RecognitionException {
		try {
			int _type = T__21;
			int _channel = DEFAULT_TOKEN_CHANNEL;
			// /Users/zhi/Documents/workspace/bakar/sireum-bakar-jago/src/main/scala/org/sireum/bakar/policy/parser/Policy.g:21:7: ( 'null' )
			// /Users/zhi/Documents/workspace/bakar/sireum-bakar-jago/src/main/scala/org/sireum/bakar/policy/parser/Policy.g:21:9: 'null'
			{
			match("null"); 

			}

			state.type = _type;
			state.channel = _channel;
		}
		finally {
			// do for sure before leaving
		}
	}
	// $ANTLR end "T__21"

	// $ANTLR start "T__22"
	public final void mT__22() throws RecognitionException {
		try {
			int _type = T__22;
			int _channel = DEFAULT_TOKEN_CHANNEL;
			// /Users/zhi/Documents/workspace/bakar/sireum-bakar-jago/src/main/scala/org/sireum/bakar/policy/parser/Policy.g:22:7: ( 'out' )
			// /Users/zhi/Documents/workspace/bakar/sireum-bakar-jago/src/main/scala/org/sireum/bakar/policy/parser/Policy.g:22:9: 'out'
			{
			match("out"); 

			}

			state.type = _type;
			state.channel = _channel;
		}
		finally {
			// do for sure before leaving
		}
	}
	// $ANTLR end "T__22"

	// $ANTLR start "T__23"
	public final void mT__23() throws RecognitionException {
		try {
			int _type = T__23;
			int _channel = DEFAULT_TOKEN_CHANNEL;
			// /Users/zhi/Documents/workspace/bakar/sireum-bakar-jago/src/main/scala/org/sireum/bakar/policy/parser/Policy.g:23:7: ( 'procedure' )
			// /Users/zhi/Documents/workspace/bakar/sireum-bakar-jago/src/main/scala/org/sireum/bakar/policy/parser/Policy.g:23:9: 'procedure'
			{
			match("procedure"); 

			}

			state.type = _type;
			state.channel = _channel;
		}
		finally {
			// do for sure before leaving
		}
	}
	// $ANTLR end "T__23"

	// $ANTLR start "T__24"
	public final void mT__24() throws RecognitionException {
		try {
			int _type = T__24;
			int _channel = DEFAULT_TOKEN_CHANNEL;
			// /Users/zhi/Documents/workspace/bakar/sireum-bakar-jago/src/main/scala/org/sireum/bakar/policy/parser/Policy.g:24:7: ( 'type' )
			// /Users/zhi/Documents/workspace/bakar/sireum-bakar-jago/src/main/scala/org/sireum/bakar/policy/parser/Policy.g:24:9: 'type'
			{
			match("type"); 

			}

			state.type = _type;
			state.channel = _channel;
		}
		finally {
			// do for sure before leaving
		}
	}
	// $ANTLR end "T__24"

	// $ANTLR start "T__25"
	public final void mT__25() throws RecognitionException {
		try {
			int _type = T__25;
			int _channel = DEFAULT_TOKEN_CHANNEL;
			// /Users/zhi/Documents/workspace/bakar/sireum-bakar-jago/src/main/scala/org/sireum/bakar/policy/parser/Policy.g:25:7: ( 'with' )
			// /Users/zhi/Documents/workspace/bakar/sireum-bakar-jago/src/main/scala/org/sireum/bakar/policy/parser/Policy.g:25:9: 'with'
			{
			match("with"); 

			}

			state.type = _type;
			state.channel = _channel;
		}
		finally {
			// do for sure before leaving
		}
	}
	// $ANTLR end "T__25"

	// $ANTLR start "T__26"
	public final void mT__26() throws RecognitionException {
		try {
			int _type = T__26;
			int _channel = DEFAULT_TOKEN_CHANNEL;
			// /Users/zhi/Documents/workspace/bakar/sireum-bakar-jago/src/main/scala/org/sireum/bakar/policy/parser/Policy.g:26:7: ( '{' )
			// /Users/zhi/Documents/workspace/bakar/sireum-bakar-jago/src/main/scala/org/sireum/bakar/policy/parser/Policy.g:26:9: '{'
			{
			match('{'); 
			}

			state.type = _type;
			state.channel = _channel;
		}
		finally {
			// do for sure before leaving
		}
	}
	// $ANTLR end "T__26"

	// $ANTLR start "T__27"
	public final void mT__27() throws RecognitionException {
		try {
			int _type = T__27;
			int _channel = DEFAULT_TOKEN_CHANNEL;
			// /Users/zhi/Documents/workspace/bakar/sireum-bakar-jago/src/main/scala/org/sireum/bakar/policy/parser/Policy.g:27:7: ( '}' )
			// /Users/zhi/Documents/workspace/bakar/sireum-bakar-jago/src/main/scala/org/sireum/bakar/policy/parser/Policy.g:27:9: '}'
			{
			match('}'); 
			}

			state.type = _type;
			state.channel = _channel;
		}
		finally {
			// do for sure before leaving
		}
	}
	// $ANTLR end "T__27"

	// $ANTLR start "NUM_INT"
	public final void mNUM_INT() throws RecognitionException {
		try {
			int _type = NUM_INT;
			int _channel = DEFAULT_TOKEN_CHANNEL;
			// /Users/zhi/Documents/workspace/bakar/sireum-bakar-jago/src/main/scala/org/sireum/bakar/policy/parser/Policy.g:100:2: ( ( '0' | ( '1' .. '9' ) ( '0' .. '9' )* ) )
			// /Users/zhi/Documents/workspace/bakar/sireum-bakar-jago/src/main/scala/org/sireum/bakar/policy/parser/Policy.g:100:4: ( '0' | ( '1' .. '9' ) ( '0' .. '9' )* )
			{
			// /Users/zhi/Documents/workspace/bakar/sireum-bakar-jago/src/main/scala/org/sireum/bakar/policy/parser/Policy.g:100:4: ( '0' | ( '1' .. '9' ) ( '0' .. '9' )* )
			int alt2=2;
			int LA2_0 = input.LA(1);
			if ( (LA2_0=='0') ) {
				alt2=1;
			}
			else if ( ((LA2_0 >= '1' && LA2_0 <= '9')) ) {
				alt2=2;
			}

			else {
				NoViableAltException nvae =
					new NoViableAltException("", 2, 0, input);
				throw nvae;
			}

			switch (alt2) {
				case 1 :
					// /Users/zhi/Documents/workspace/bakar/sireum-bakar-jago/src/main/scala/org/sireum/bakar/policy/parser/Policy.g:100:5: '0'
					{
					match('0'); 
					}
					break;
				case 2 :
					// /Users/zhi/Documents/workspace/bakar/sireum-bakar-jago/src/main/scala/org/sireum/bakar/policy/parser/Policy.g:100:11: ( '1' .. '9' ) ( '0' .. '9' )*
					{
					if ( (input.LA(1) >= '1' && input.LA(1) <= '9') ) {
						input.consume();
					}
					else {
						MismatchedSetException mse = new MismatchedSetException(null,input);
						recover(mse);
						throw mse;
					}
					// /Users/zhi/Documents/workspace/bakar/sireum-bakar-jago/src/main/scala/org/sireum/bakar/policy/parser/Policy.g:100:22: ( '0' .. '9' )*
					loop1:
					while (true) {
						int alt1=2;
						int LA1_0 = input.LA(1);
						if ( ((LA1_0 >= '0' && LA1_0 <= '9')) ) {
							alt1=1;
						}

						switch (alt1) {
						case 1 :
							// /Users/zhi/Documents/workspace/bakar/sireum-bakar-jago/src/main/scala/org/sireum/bakar/policy/parser/Policy.g:
							{
							if ( (input.LA(1) >= '0' && input.LA(1) <= '9') ) {
								input.consume();
							}
							else {
								MismatchedSetException mse = new MismatchedSetException(null,input);
								recover(mse);
								throw mse;
							}
							}
							break;

						default :
							break loop1;
						}
					}

					}
					break;

			}

			}

			state.type = _type;
			state.channel = _channel;
		}
		finally {
			// do for sure before leaving
		}
	}
	// $ANTLR end "NUM_INT"

	// $ANTLR start "ID"
	public final void mID() throws RecognitionException {
		try {
			int _type = ID;
			int _channel = DEFAULT_TOKEN_CHANNEL;
			// /Users/zhi/Documents/workspace/bakar/sireum-bakar-jago/src/main/scala/org/sireum/bakar/policy/parser/Policy.g:103:5: ( ( 'a' .. 'z' | 'A' .. 'Z' | '_' ) ( 'a' .. 'z' | 'A' .. 'Z' | '0' .. '9' | '_' )* )
			// /Users/zhi/Documents/workspace/bakar/sireum-bakar-jago/src/main/scala/org/sireum/bakar/policy/parser/Policy.g:103:7: ( 'a' .. 'z' | 'A' .. 'Z' | '_' ) ( 'a' .. 'z' | 'A' .. 'Z' | '0' .. '9' | '_' )*
			{
			if ( (input.LA(1) >= 'A' && input.LA(1) <= 'Z')||input.LA(1)=='_'||(input.LA(1) >= 'a' && input.LA(1) <= 'z') ) {
				input.consume();
			}
			else {
				MismatchedSetException mse = new MismatchedSetException(null,input);
				recover(mse);
				throw mse;
			}
			// /Users/zhi/Documents/workspace/bakar/sireum-bakar-jago/src/main/scala/org/sireum/bakar/policy/parser/Policy.g:103:31: ( 'a' .. 'z' | 'A' .. 'Z' | '0' .. '9' | '_' )*
			loop3:
			while (true) {
				int alt3=2;
				int LA3_0 = input.LA(1);
				if ( ((LA3_0 >= '0' && LA3_0 <= '9')||(LA3_0 >= 'A' && LA3_0 <= 'Z')||LA3_0=='_'||(LA3_0 >= 'a' && LA3_0 <= 'z')) ) {
					alt3=1;
				}

				switch (alt3) {
				case 1 :
					// /Users/zhi/Documents/workspace/bakar/sireum-bakar-jago/src/main/scala/org/sireum/bakar/policy/parser/Policy.g:
					{
					if ( (input.LA(1) >= '0' && input.LA(1) <= '9')||(input.LA(1) >= 'A' && input.LA(1) <= 'Z')||input.LA(1)=='_'||(input.LA(1) >= 'a' && input.LA(1) <= 'z') ) {
						input.consume();
					}
					else {
						MismatchedSetException mse = new MismatchedSetException(null,input);
						recover(mse);
						throw mse;
					}
					}
					break;

				default :
					break loop3;
				}
			}

			}

			state.type = _type;
			state.channel = _channel;
		}
		finally {
			// do for sure before leaving
		}
	}
	// $ANTLR end "ID"

	// $ANTLR start "COMMENT"
	public final void mCOMMENT() throws RecognitionException {
		try {
			int _type = COMMENT;
			int _channel = DEFAULT_TOKEN_CHANNEL;
			// /Users/zhi/Documents/workspace/bakar/sireum-bakar-jago/src/main/scala/org/sireum/bakar/policy/parser/Policy.g:106:9: ( ( '--' (~ ( '\\n' | '\\r' ) )* ( '\\n' | '\\r' ( '\\n' )? ) ) )
			// /Users/zhi/Documents/workspace/bakar/sireum-bakar-jago/src/main/scala/org/sireum/bakar/policy/parser/Policy.g:106:11: ( '--' (~ ( '\\n' | '\\r' ) )* ( '\\n' | '\\r' ( '\\n' )? ) )
			{
			// /Users/zhi/Documents/workspace/bakar/sireum-bakar-jago/src/main/scala/org/sireum/bakar/policy/parser/Policy.g:106:11: ( '--' (~ ( '\\n' | '\\r' ) )* ( '\\n' | '\\r' ( '\\n' )? ) )
			// /Users/zhi/Documents/workspace/bakar/sireum-bakar-jago/src/main/scala/org/sireum/bakar/policy/parser/Policy.g:106:13: '--' (~ ( '\\n' | '\\r' ) )* ( '\\n' | '\\r' ( '\\n' )? )
			{
			match("--"); 

			// /Users/zhi/Documents/workspace/bakar/sireum-bakar-jago/src/main/scala/org/sireum/bakar/policy/parser/Policy.g:106:18: (~ ( '\\n' | '\\r' ) )*
			loop4:
			while (true) {
				int alt4=2;
				int LA4_0 = input.LA(1);
				if ( ((LA4_0 >= '\u0000' && LA4_0 <= '\t')||(LA4_0 >= '\u000B' && LA4_0 <= '\f')||(LA4_0 >= '\u000E' && LA4_0 <= '\uFFFF')) ) {
					alt4=1;
				}

				switch (alt4) {
				case 1 :
					// /Users/zhi/Documents/workspace/bakar/sireum-bakar-jago/src/main/scala/org/sireum/bakar/policy/parser/Policy.g:
					{
					if ( (input.LA(1) >= '\u0000' && input.LA(1) <= '\t')||(input.LA(1) >= '\u000B' && input.LA(1) <= '\f')||(input.LA(1) >= '\u000E' && input.LA(1) <= '\uFFFF') ) {
						input.consume();
					}
					else {
						MismatchedSetException mse = new MismatchedSetException(null,input);
						recover(mse);
						throw mse;
					}
					}
					break;

				default :
					break loop4;
				}
			}

			// /Users/zhi/Documents/workspace/bakar/sireum-bakar-jago/src/main/scala/org/sireum/bakar/policy/parser/Policy.g:106:34: ( '\\n' | '\\r' ( '\\n' )? )
			int alt6=2;
			int LA6_0 = input.LA(1);
			if ( (LA6_0=='\n') ) {
				alt6=1;
			}
			else if ( (LA6_0=='\r') ) {
				alt6=2;
			}

			else {
				NoViableAltException nvae =
					new NoViableAltException("", 6, 0, input);
				throw nvae;
			}

			switch (alt6) {
				case 1 :
					// /Users/zhi/Documents/workspace/bakar/sireum-bakar-jago/src/main/scala/org/sireum/bakar/policy/parser/Policy.g:106:35: '\\n'
					{
					match('\n'); 
					}
					break;
				case 2 :
					// /Users/zhi/Documents/workspace/bakar/sireum-bakar-jago/src/main/scala/org/sireum/bakar/policy/parser/Policy.g:106:40: '\\r' ( '\\n' )?
					{
					match('\r'); 
					// /Users/zhi/Documents/workspace/bakar/sireum-bakar-jago/src/main/scala/org/sireum/bakar/policy/parser/Policy.g:106:44: ( '\\n' )?
					int alt5=2;
					int LA5_0 = input.LA(1);
					if ( (LA5_0=='\n') ) {
						alt5=1;
					}
					switch (alt5) {
						case 1 :
							// /Users/zhi/Documents/workspace/bakar/sireum-bakar-jago/src/main/scala/org/sireum/bakar/policy/parser/Policy.g:106:45: '\\n'
							{
							match('\n'); 
							}
							break;

					}

					}
					break;

			}

			}

			_channel=HIDDEN;
			}

			state.type = _type;
			state.channel = _channel;
		}
		finally {
			// do for sure before leaving
		}
	}
	// $ANTLR end "COMMENT"

	// $ANTLR start "WS"
	public final void mWS() throws RecognitionException {
		try {
			int _type = WS;
			int _channel = DEFAULT_TOKEN_CHANNEL;
			// /Users/zhi/Documents/workspace/bakar/sireum-bakar-jago/src/main/scala/org/sireum/bakar/policy/parser/Policy.g:110:4: ( ( ' ' | '\\r' | '\\t' | '\\u000C' | '\\n' ) )
			// /Users/zhi/Documents/workspace/bakar/sireum-bakar-jago/src/main/scala/org/sireum/bakar/policy/parser/Policy.g:110:6: ( ' ' | '\\r' | '\\t' | '\\u000C' | '\\n' )
			{
			if ( (input.LA(1) >= '\t' && input.LA(1) <= '\n')||(input.LA(1) >= '\f' && input.LA(1) <= '\r')||input.LA(1)==' ' ) {
				input.consume();
			}
			else {
				MismatchedSetException mse = new MismatchedSetException(null,input);
				recover(mse);
				throw mse;
			}
			 _channel=HIDDEN;
			}

			state.type = _type;
			state.channel = _channel;
		}
		finally {
			// do for sure before leaving
		}
	}
	// $ANTLR end "WS"

	@Override
	public void mTokens() throws RecognitionException {
		// /Users/zhi/Documents/workspace/bakar/sireum-bakar-jago/src/main/scala/org/sireum/bakar/policy/parser/Policy.g:1:8: ( T__8 | T__9 | T__10 | T__11 | T__12 | T__13 | T__14 | T__15 | T__16 | T__17 | T__18 | T__19 | T__20 | T__21 | T__22 | T__23 | T__24 | T__25 | T__26 | T__27 | NUM_INT | ID | COMMENT | WS )
		int alt7=24;
		alt7 = dfa7.predict(input);
		switch (alt7) {
			case 1 :
				// /Users/zhi/Documents/workspace/bakar/sireum-bakar-jago/src/main/scala/org/sireum/bakar/policy/parser/Policy.g:1:10: T__8
				{
				mT__8(); 

				}
				break;
			case 2 :
				// /Users/zhi/Documents/workspace/bakar/sireum-bakar-jago/src/main/scala/org/sireum/bakar/policy/parser/Policy.g:1:15: T__9
				{
				mT__9(); 

				}
				break;
			case 3 :
				// /Users/zhi/Documents/workspace/bakar/sireum-bakar-jago/src/main/scala/org/sireum/bakar/policy/parser/Policy.g:1:20: T__10
				{
				mT__10(); 

				}
				break;
			case 4 :
				// /Users/zhi/Documents/workspace/bakar/sireum-bakar-jago/src/main/scala/org/sireum/bakar/policy/parser/Policy.g:1:26: T__11
				{
				mT__11(); 

				}
				break;
			case 5 :
				// /Users/zhi/Documents/workspace/bakar/sireum-bakar-jago/src/main/scala/org/sireum/bakar/policy/parser/Policy.g:1:32: T__12
				{
				mT__12(); 

				}
				break;
			case 6 :
				// /Users/zhi/Documents/workspace/bakar/sireum-bakar-jago/src/main/scala/org/sireum/bakar/policy/parser/Policy.g:1:38: T__13
				{
				mT__13(); 

				}
				break;
			case 7 :
				// /Users/zhi/Documents/workspace/bakar/sireum-bakar-jago/src/main/scala/org/sireum/bakar/policy/parser/Policy.g:1:44: T__14
				{
				mT__14(); 

				}
				break;
			case 8 :
				// /Users/zhi/Documents/workspace/bakar/sireum-bakar-jago/src/main/scala/org/sireum/bakar/policy/parser/Policy.g:1:50: T__15
				{
				mT__15(); 

				}
				break;
			case 9 :
				// /Users/zhi/Documents/workspace/bakar/sireum-bakar-jago/src/main/scala/org/sireum/bakar/policy/parser/Policy.g:1:56: T__16
				{
				mT__16(); 

				}
				break;
			case 10 :
				// /Users/zhi/Documents/workspace/bakar/sireum-bakar-jago/src/main/scala/org/sireum/bakar/policy/parser/Policy.g:1:62: T__17
				{
				mT__17(); 

				}
				break;
			case 11 :
				// /Users/zhi/Documents/workspace/bakar/sireum-bakar-jago/src/main/scala/org/sireum/bakar/policy/parser/Policy.g:1:68: T__18
				{
				mT__18(); 

				}
				break;
			case 12 :
				// /Users/zhi/Documents/workspace/bakar/sireum-bakar-jago/src/main/scala/org/sireum/bakar/policy/parser/Policy.g:1:74: T__19
				{
				mT__19(); 

				}
				break;
			case 13 :
				// /Users/zhi/Documents/workspace/bakar/sireum-bakar-jago/src/main/scala/org/sireum/bakar/policy/parser/Policy.g:1:80: T__20
				{
				mT__20(); 

				}
				break;
			case 14 :
				// /Users/zhi/Documents/workspace/bakar/sireum-bakar-jago/src/main/scala/org/sireum/bakar/policy/parser/Policy.g:1:86: T__21
				{
				mT__21(); 

				}
				break;
			case 15 :
				// /Users/zhi/Documents/workspace/bakar/sireum-bakar-jago/src/main/scala/org/sireum/bakar/policy/parser/Policy.g:1:92: T__22
				{
				mT__22(); 

				}
				break;
			case 16 :
				// /Users/zhi/Documents/workspace/bakar/sireum-bakar-jago/src/main/scala/org/sireum/bakar/policy/parser/Policy.g:1:98: T__23
				{
				mT__23(); 

				}
				break;
			case 17 :
				// /Users/zhi/Documents/workspace/bakar/sireum-bakar-jago/src/main/scala/org/sireum/bakar/policy/parser/Policy.g:1:104: T__24
				{
				mT__24(); 

				}
				break;
			case 18 :
				// /Users/zhi/Documents/workspace/bakar/sireum-bakar-jago/src/main/scala/org/sireum/bakar/policy/parser/Policy.g:1:110: T__25
				{
				mT__25(); 

				}
				break;
			case 19 :
				// /Users/zhi/Documents/workspace/bakar/sireum-bakar-jago/src/main/scala/org/sireum/bakar/policy/parser/Policy.g:1:116: T__26
				{
				mT__26(); 

				}
				break;
			case 20 :
				// /Users/zhi/Documents/workspace/bakar/sireum-bakar-jago/src/main/scala/org/sireum/bakar/policy/parser/Policy.g:1:122: T__27
				{
				mT__27(); 

				}
				break;
			case 21 :
				// /Users/zhi/Documents/workspace/bakar/sireum-bakar-jago/src/main/scala/org/sireum/bakar/policy/parser/Policy.g:1:128: NUM_INT
				{
				mNUM_INT(); 

				}
				break;
			case 22 :
				// /Users/zhi/Documents/workspace/bakar/sireum-bakar-jago/src/main/scala/org/sireum/bakar/policy/parser/Policy.g:1:136: ID
				{
				mID(); 

				}
				break;
			case 23 :
				// /Users/zhi/Documents/workspace/bakar/sireum-bakar-jago/src/main/scala/org/sireum/bakar/policy/parser/Policy.g:1:139: COMMENT
				{
				mCOMMENT(); 

				}
				break;
			case 24 :
				// /Users/zhi/Documents/workspace/bakar/sireum-bakar-jago/src/main/scala/org/sireum/bakar/policy/parser/Policy.g:1:147: WS
				{
				mWS(); 

				}
				break;

		}
	}


	protected DFA7 dfa7 = new DFA7(this);
	static final String DFA7_eotS =
		"\4\uffff\1\27\3\uffff\10\23\10\uffff\3\23\1\45\1\46\10\23\2\uffff\1\23"+
		"\1\60\6\23\1\67\1\uffff\1\23\1\71\1\72\3\23\1\uffff\1\23\2\uffff\1\23"+
		"\1\100\3\23\1\uffff\1\104\2\23\1\uffff\2\23\1\111\1\23\1\uffff\1\23\1"+
		"\114\1\uffff";
	static final String DFA7_eofS =
		"\115\uffff";
	static final String DFA7_minS =
		"\1\11\3\uffff\1\75\3\uffff\1\145\1\162\1\156\2\165\1\162\1\171\1\151\10"+
		"\uffff\1\143\1\155\1\144\2\60\1\154\1\164\1\157\1\160\1\164\1\154\1\141"+
		"\1\145\2\uffff\1\154\1\60\1\143\1\145\1\150\1\141\1\151\1\162\1\60\1\uffff"+
		"\1\145\2\60\1\163\1\156\1\145\1\uffff\1\144\2\uffff\1\163\1\60\1\144\1"+
		"\165\1\151\1\uffff\1\60\1\162\1\146\1\uffff\1\145\1\151\1\60\1\145\1\uffff"+
		"\1\162\1\60\1\uffff";
	static final String DFA7_maxS =
		"\1\175\3\uffff\1\75\3\uffff\1\157\1\162\1\163\2\165\1\162\1\171\1\151"+
		"\10\uffff\1\143\1\155\1\144\2\172\1\154\1\164\1\157\1\160\1\164\1\154"+
		"\1\141\1\145\2\uffff\1\154\1\172\1\143\1\145\1\150\1\141\1\151\1\162\1"+
		"\172\1\uffff\1\145\2\172\1\163\1\156\1\145\1\uffff\1\144\2\uffff\1\163"+
		"\1\172\1\144\1\165\1\151\1\uffff\1\172\1\162\1\146\1\uffff\1\145\1\151"+
		"\1\172\1\145\1\uffff\1\162\1\172\1\uffff";
	static final String DFA7_acceptS =
		"\1\uffff\1\1\1\2\1\3\1\uffff\1\6\1\7\1\10\10\uffff\1\23\1\24\1\25\1\26"+
		"\1\27\1\30\1\5\1\4\15\uffff\1\14\1\15\11\uffff\1\17\6\uffff\1\16\1\uffff"+
		"\1\21\1\22\5\uffff\1\12\3\uffff\1\13\4\uffff\1\20\2\uffff\1\11";
	static final String DFA7_specialS =
		"\115\uffff}>";
	static final String[] DFA7_transitionS = {
			"\2\25\1\uffff\2\25\22\uffff\1\25\7\uffff\1\1\1\2\2\uffff\1\3\1\24\2\uffff"+
			"\12\22\1\4\1\5\1\6\1\7\3\uffff\3\23\1\10\12\23\1\11\13\23\4\uffff\1\23"+
			"\1\uffff\10\23\1\12\4\23\1\13\1\14\1\15\3\23\1\16\2\23\1\17\3\23\1\20"+
			"\1\uffff\1\21",
			"",
			"",
			"",
			"\1\26",
			"",
			"",
			"",
			"\1\30\11\uffff\1\31",
			"\1\32",
			"\1\33\4\uffff\1\34",
			"\1\35",
			"\1\36",
			"\1\37",
			"\1\40",
			"\1\41",
			"",
			"",
			"",
			"",
			"",
			"",
			"",
			"",
			"\1\42",
			"\1\43",
			"\1\44",
			"\12\23\7\uffff\32\23\4\uffff\1\23\1\uffff\32\23",
			"\12\23\7\uffff\32\23\4\uffff\1\23\1\uffff\32\23",
			"\1\47",
			"\1\50",
			"\1\51",
			"\1\52",
			"\1\53",
			"\1\54",
			"\1\55",
			"\1\56",
			"",
			"",
			"\1\57",
			"\12\23\7\uffff\32\23\4\uffff\1\23\1\uffff\32\23",
			"\1\61",
			"\1\62",
			"\1\63",
			"\1\64",
			"\1\65",
			"\1\66",
			"\12\23\7\uffff\32\23\4\uffff\1\23\1\uffff\32\23",
			"",
			"\1\70",
			"\12\23\7\uffff\32\23\4\uffff\1\23\1\uffff\32\23",
			"\12\23\7\uffff\32\23\4\uffff\1\23\1\uffff\32\23",
			"\1\73",
			"\1\74",
			"\1\75",
			"",
			"\1\76",
			"",
			"",
			"\1\77",
			"\12\23\7\uffff\32\23\4\uffff\1\23\1\uffff\32\23",
			"\1\101",
			"\1\102",
			"\1\103",
			"",
			"\12\23\7\uffff\32\23\4\uffff\1\23\1\uffff\32\23",
			"\1\105",
			"\1\106",
			"",
			"\1\107",
			"\1\110",
			"\12\23\7\uffff\32\23\4\uffff\1\23\1\uffff\32\23",
			"\1\112",
			"",
			"\1\113",
			"\12\23\7\uffff\32\23\4\uffff\1\23\1\uffff\32\23",
			""
	};

	static final short[] DFA7_eot = DFA.unpackEncodedString(DFA7_eotS);
	static final short[] DFA7_eof = DFA.unpackEncodedString(DFA7_eofS);
	static final char[] DFA7_min = DFA.unpackEncodedStringToUnsignedChars(DFA7_minS);
	static final char[] DFA7_max = DFA.unpackEncodedStringToUnsignedChars(DFA7_maxS);
	static final short[] DFA7_accept = DFA.unpackEncodedString(DFA7_acceptS);
	static final short[] DFA7_special = DFA.unpackEncodedString(DFA7_specialS);
	static final short[][] DFA7_transition;

	static {
		int numStates = DFA7_transitionS.length;
		DFA7_transition = new short[numStates][];
		for (int i=0; i<numStates; i++) {
			DFA7_transition[i] = DFA.unpackEncodedString(DFA7_transitionS[i]);
		}
	}

	protected class DFA7 extends DFA {

		public DFA7(BaseRecognizer recognizer) {
			this.recognizer = recognizer;
			this.decisionNumber = 7;
			this.eot = DFA7_eot;
			this.eof = DFA7_eof;
			this.min = DFA7_min;
			this.max = DFA7_max;
			this.accept = DFA7_accept;
			this.special = DFA7_special;
			this.transition = DFA7_transition;
		}
		@Override
		public String getDescription() {
			return "1:1: Tokens : ( T__8 | T__9 | T__10 | T__11 | T__12 | T__13 | T__14 | T__15 | T__16 | T__17 | T__18 | T__19 | T__20 | T__21 | T__22 | T__23 | T__24 | T__25 | T__26 | T__27 | NUM_INT | ID | COMMENT | WS );";
		}
	}

}
