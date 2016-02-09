// $ANTLR 3.5 /Users/zhi/Downloads/antlrworks-1.5/Policy.g 2016-02-04 10:50:05

package org.sireum.bakar.policy.parser;
import java.util.ArrayList;
import java.util.HashMap;


import org.antlr.runtime.*;
import java.util.Stack;
import java.util.List;
import java.util.ArrayList;

@SuppressWarnings("all")
public class PolicyParser extends Parser {
	public static final String[] tokenNames = new String[] {
		"<invalid>", "<EOR>", "<DOWN>", "<UP>", "COMMENT", "ID", "NUM_INT", "WS", 
		"'('", "')'", "','", "':'", "':='", "';'", "'<='", "'=>'", "'Declassifier'", 
		"'Domain'", "'Ordered'", "'in'", "'is'", "'null'", "'out'", "'procedure'", 
		"'type'", "'with'", "'{'", "'}'"
	};
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
	public Parser[] getDelegates() {
		return new Parser[] {};
	}

	// delegators


	public PolicyParser(TokenStream input) {
		this(input, new RecognizerSharedState());
	}
	public PolicyParser(TokenStream input, RecognizerSharedState state) {
		super(input, state);
	}

	@Override public String[] getTokenNames() { return PolicyParser.tokenNames; }
	@Override public String getGrammarFileName() { return "/Users/zhi/Downloads/antlrworks-1.5/Policy.g"; }



	// $ANTLR start "start"
	// /Users/zhi/Downloads/antlrworks-1.5/Policy.g:15:1: start returns [T_Policy result = new T_Policy()] : d= domain_definition b= domain_bindings f= declassifiers ;
	public final T_Policy start() throws RecognitionException {
		T_Policy result =  new T_Policy();


		T_Domain d =null;
		HashMap<String, String> b =null;
		HashMap<String, T_Declassifier> f =null;

		try {
			// /Users/zhi/Downloads/antlrworks-1.5/Policy.g:16:2: (d= domain_definition b= domain_bindings f= declassifiers )
			// /Users/zhi/Downloads/antlrworks-1.5/Policy.g:16:4: d= domain_definition b= domain_bindings f= declassifiers
			{
			pushFollow(FOLLOW_domain_definition_in_start32);
			d=domain_definition();
			state._fsp--;

			pushFollow(FOLLOW_domain_bindings_in_start39);
			b=domain_bindings();
			state._fsp--;

			pushFollow(FOLLOW_declassifiers_in_start46);
			f=declassifiers();
			state._fsp--;

			result.set_domains(d);
				   result.set_domain_bindings(b);
				   result.set_declassifiers(f);
			}

		}
		catch (RecognitionException re) {
			reportError(re);
			recover(input,re);
		}
		finally {
			// do for sure before leaving
		}
		return result;
	}
	// $ANTLR end "start"



	// $ANTLR start "domain_definition"
	// /Users/zhi/Downloads/antlrworks-1.5/Policy.g:24:1: domain_definition returns [T_Domain result = new T_Domain()] : 'type' ID 'is' v= enumerated_values 'with' o= ordering ';' ;
	public final T_Domain domain_definition() throws RecognitionException {
		T_Domain result =  new T_Domain();


		ArrayList<String> v =null;
		HashMap<String, String> o =null;

		try {
			// /Users/zhi/Downloads/antlrworks-1.5/Policy.g:25:2: ( 'type' ID 'is' v= enumerated_values 'with' o= ordering ';' )
			// /Users/zhi/Downloads/antlrworks-1.5/Policy.g:25:4: 'type' ID 'is' v= enumerated_values 'with' o= ordering ';'
			{
			match(input,24,FOLLOW_24_in_domain_definition66); 
			match(input,ID,FOLLOW_ID_in_domain_definition68); 
			match(input,20,FOLLOW_20_in_domain_definition70); 
			pushFollow(FOLLOW_enumerated_values_in_domain_definition74);
			v=enumerated_values();
			state._fsp--;

			match(input,25,FOLLOW_25_in_domain_definition76); 
			pushFollow(FOLLOW_ordering_in_domain_definition80);
			o=ordering();
			state._fsp--;

			match(input,13,FOLLOW_13_in_domain_definition82); 
			result.set_domains(v); result.set_domain_ordering(o);
			}

		}
		catch (RecognitionException re) {
			reportError(re);
			recover(input,re);
		}
		finally {
			// do for sure before leaving
		}
		return result;
	}
	// $ANTLR end "domain_definition"



	// $ANTLR start "enumerated_values"
	// /Users/zhi/Downloads/antlrworks-1.5/Policy.g:29:1: enumerated_values returns [ArrayList<String> result = new ArrayList<String>()] : '(' id1= ID ( ',' id2= ID )* ')' ;
	public final ArrayList<String> enumerated_values() throws RecognitionException {
		ArrayList<String> result =  new ArrayList<String>();


		Token id1=null;
		Token id2=null;

		try {
			// /Users/zhi/Downloads/antlrworks-1.5/Policy.g:30:2: ( '(' id1= ID ( ',' id2= ID )* ')' )
			// /Users/zhi/Downloads/antlrworks-1.5/Policy.g:30:4: '(' id1= ID ( ',' id2= ID )* ')'
			{
			match(input,8,FOLLOW_8_in_enumerated_values103); 
			id1=(Token)match(input,ID,FOLLOW_ID_in_enumerated_values115); 
			result.add((id1!=null?id1.getText():null));
			// /Users/zhi/Downloads/antlrworks-1.5/Policy.g:32:8: ( ',' id2= ID )*
			loop1:
			while (true) {
				int alt1=2;
				int LA1_0 = input.LA(1);
				if ( (LA1_0==10) ) {
					alt1=1;
				}

				switch (alt1) {
				case 1 :
					// /Users/zhi/Downloads/antlrworks-1.5/Policy.g:32:9: ',' id2= ID
					{
					match(input,10,FOLLOW_10_in_enumerated_values127); 
					id2=(Token)match(input,ID,FOLLOW_ID_in_enumerated_values131); 
					result.add((id2!=null?id2.getText():null));
					}
					break;

				default :
					break loop1;
				}
			}

			match(input,9,FOLLOW_9_in_enumerated_values141); 
			}

		}
		catch (RecognitionException re) {
			reportError(re);
			recover(input,re);
		}
		finally {
			// do for sure before leaving
		}
		return result;
	}
	// $ANTLR end "enumerated_values"



	// $ANTLR start "ordering"
	// /Users/zhi/Downloads/antlrworks-1.5/Policy.g:36:1: ordering returns [HashMap<String, String> result = new HashMap<String, String>()] : 'Ordered' ( '=>' ( ( '{' id1= ID '<=' id2= ID ( ',' id3= ID '<=' id4= ID )* '}' ) | 'null' ) )? ;
	public final HashMap<String, String> ordering() throws RecognitionException {
		HashMap<String, String> result =  new HashMap<String, String>();


		Token id1=null;
		Token id2=null;
		Token id3=null;
		Token id4=null;

		 boolean b = true; 
		try {
			// /Users/zhi/Downloads/antlrworks-1.5/Policy.g:38:2: ( 'Ordered' ( '=>' ( ( '{' id1= ID '<=' id2= ID ( ',' id3= ID '<=' id4= ID )* '}' ) | 'null' ) )? )
			// /Users/zhi/Downloads/antlrworks-1.5/Policy.g:38:4: 'Ordered' ( '=>' ( ( '{' id1= ID '<=' id2= ID ( ',' id3= ID '<=' id4= ID )* '}' ) | 'null' ) )?
			{
			match(input,18,FOLLOW_18_in_ordering161); 
			// /Users/zhi/Downloads/antlrworks-1.5/Policy.g:38:14: ( '=>' ( ( '{' id1= ID '<=' id2= ID ( ',' id3= ID '<=' id4= ID )* '}' ) | 'null' ) )?
			int alt4=2;
			int LA4_0 = input.LA(1);
			if ( (LA4_0==15) ) {
				alt4=1;
			}
			switch (alt4) {
				case 1 :
					// /Users/zhi/Downloads/antlrworks-1.5/Policy.g:38:15: '=>' ( ( '{' id1= ID '<=' id2= ID ( ',' id3= ID '<=' id4= ID )* '}' ) | 'null' )
					{
					match(input,15,FOLLOW_15_in_ordering164); 
					// /Users/zhi/Downloads/antlrworks-1.5/Policy.g:38:20: ( ( '{' id1= ID '<=' id2= ID ( ',' id3= ID '<=' id4= ID )* '}' ) | 'null' )
					int alt3=2;
					int LA3_0 = input.LA(1);
					if ( (LA3_0==26) ) {
						alt3=1;
					}
					else if ( (LA3_0==21) ) {
						alt3=2;
					}

					else {
						NoViableAltException nvae =
							new NoViableAltException("", 3, 0, input);
						throw nvae;
					}

					switch (alt3) {
						case 1 :
							// /Users/zhi/Downloads/antlrworks-1.5/Policy.g:38:21: ( '{' id1= ID '<=' id2= ID ( ',' id3= ID '<=' id4= ID )* '}' )
							{
							// /Users/zhi/Downloads/antlrworks-1.5/Policy.g:38:21: ( '{' id1= ID '<=' id2= ID ( ',' id3= ID '<=' id4= ID )* '}' )
							// /Users/zhi/Downloads/antlrworks-1.5/Policy.g:38:22: '{' id1= ID '<=' id2= ID ( ',' id3= ID '<=' id4= ID )* '}'
							{
							match(input,26,FOLLOW_26_in_ordering168); 
							id1=(Token)match(input,ID,FOLLOW_ID_in_ordering172); 
							match(input,14,FOLLOW_14_in_ordering174); 
							id2=(Token)match(input,ID,FOLLOW_ID_in_ordering178); 
							result.put((id1!=null?id1.getText():null), (id2!=null?id2.getText():null)); b = false;
							// /Users/zhi/Downloads/antlrworks-1.5/Policy.g:39:14: ( ',' id3= ID '<=' id4= ID )*
							loop2:
							while (true) {
								int alt2=2;
								int LA2_0 = input.LA(1);
								if ( (LA2_0==10) ) {
									alt2=1;
								}

								switch (alt2) {
								case 1 :
									// /Users/zhi/Downloads/antlrworks-1.5/Policy.g:39:15: ',' id3= ID '<=' id4= ID
									{
									match(input,10,FOLLOW_10_in_ordering196); 
									id3=(Token)match(input,ID,FOLLOW_ID_in_ordering200); 
									match(input,14,FOLLOW_14_in_ordering202); 
									id4=(Token)match(input,ID,FOLLOW_ID_in_ordering206); 
									result.put((id3!=null?id3.getText():null), (id4!=null?id4.getText():null));
									}
									break;

								default :
									break loop2;
								}
							}

							match(input,27,FOLLOW_27_in_ordering212); 
							}

							}
							break;
						case 2 :
							// /Users/zhi/Downloads/antlrworks-1.5/Policy.g:40:15: 'null'
							{
							match(input,21,FOLLOW_21_in_ordering232); 
							b = false;
							}
							break;

					}

					}
					break;

			}

			if(b == true)
				     result.put("default", "true");
				  
			}

		}
		catch (RecognitionException re) {
			reportError(re);
			recover(input,re);
		}
		finally {
			// do for sure before leaving
		}
		return result;
	}
	// $ANTLR end "ordering"



	// $ANTLR start "domain_bindings"
	// /Users/zhi/Downloads/antlrworks-1.5/Policy.g:46:1: domain_bindings returns [HashMap<String, String> result = new HashMap<String, String>()] : (d= domain_binding )* ;
	public final HashMap<String, String> domain_bindings() throws RecognitionException {
		HashMap<String, String> result =  new HashMap<String, String>();


		T_Pair<String, String> d =null;

		try {
			// /Users/zhi/Downloads/antlrworks-1.5/Policy.g:47:2: ( (d= domain_binding )* )
			// /Users/zhi/Downloads/antlrworks-1.5/Policy.g:47:4: (d= domain_binding )*
			{
			// /Users/zhi/Downloads/antlrworks-1.5/Policy.g:47:4: (d= domain_binding )*
			loop5:
			while (true) {
				int alt5=2;
				int LA5_0 = input.LA(1);
				if ( (LA5_0==ID) ) {
					alt5=1;
				}

				switch (alt5) {
				case 1 :
					// /Users/zhi/Downloads/antlrworks-1.5/Policy.g:47:5: d= domain_binding
					{
					pushFollow(FOLLOW_domain_binding_in_domain_bindings261);
					d=domain_binding();
					state._fsp--;

					result.put(d.getFirst(), d.getSecond());
					}
					break;

				default :
					break loop5;
				}
			}

			}

		}
		catch (RecognitionException re) {
			reportError(re);
			recover(input,re);
		}
		finally {
			// do for sure before leaving
		}
		return result;
	}
	// $ANTLR end "domain_bindings"



	// $ANTLR start "domain_binding"
	// /Users/zhi/Downloads/antlrworks-1.5/Policy.g:50:1: domain_binding returns [T_Pair<String, String> result = new T_Pair<String, String>()] : id1= ID ':' ID 'with' 'Domain' '=>' id2= ID ( ':=' value )? ';' ;
	public final T_Pair<String, String> domain_binding() throws RecognitionException {
		T_Pair<String, String> result =  new T_Pair<String, String>();


		Token id1=null;
		Token id2=null;

		try {
			// /Users/zhi/Downloads/antlrworks-1.5/Policy.g:51:2: (id1= ID ':' ID 'with' 'Domain' '=>' id2= ID ( ':=' value )? ';' )
			// /Users/zhi/Downloads/antlrworks-1.5/Policy.g:51:4: id1= ID ':' ID 'with' 'Domain' '=>' id2= ID ( ':=' value )? ';'
			{
			id1=(Token)match(input,ID,FOLLOW_ID_in_domain_binding283); 
			match(input,11,FOLLOW_11_in_domain_binding285); 
			match(input,ID,FOLLOW_ID_in_domain_binding287); 
			match(input,25,FOLLOW_25_in_domain_binding289); 
			match(input,17,FOLLOW_17_in_domain_binding291); 
			match(input,15,FOLLOW_15_in_domain_binding293); 
			id2=(Token)match(input,ID,FOLLOW_ID_in_domain_binding297); 
			// /Users/zhi/Downloads/antlrworks-1.5/Policy.g:51:46: ( ':=' value )?
			int alt6=2;
			int LA6_0 = input.LA(1);
			if ( (LA6_0==12) ) {
				alt6=1;
			}
			switch (alt6) {
				case 1 :
					// /Users/zhi/Downloads/antlrworks-1.5/Policy.g:51:47: ':=' value
					{
					match(input,12,FOLLOW_12_in_domain_binding300); 
					pushFollow(FOLLOW_value_in_domain_binding302);
					value();
					state._fsp--;

					}
					break;

			}

			match(input,13,FOLLOW_13_in_domain_binding306); 
			result.setFirst((id1!=null?id1.getText():null)); result.setSecond((id2!=null?id2.getText():null));
			}

		}
		catch (RecognitionException re) {
			reportError(re);
			recover(input,re);
		}
		finally {
			// do for sure before leaving
		}
		return result;
	}
	// $ANTLR end "domain_binding"



	// $ANTLR start "declassifiers"
	// /Users/zhi/Downloads/antlrworks-1.5/Policy.g:55:1: declassifiers returns [HashMap<String, T_Declassifier> result = new HashMap<String, T_Declassifier>()] : (d= declassifier )* ;
	public final HashMap<String, T_Declassifier> declassifiers() throws RecognitionException {
		HashMap<String, T_Declassifier> result =  new HashMap<String, T_Declassifier>();


		T_Declassifier d =null;

		try {
			// /Users/zhi/Downloads/antlrworks-1.5/Policy.g:56:2: ( (d= declassifier )* )
			// /Users/zhi/Downloads/antlrworks-1.5/Policy.g:56:4: (d= declassifier )*
			{
			// /Users/zhi/Downloads/antlrworks-1.5/Policy.g:56:4: (d= declassifier )*
			loop7:
			while (true) {
				int alt7=2;
				int LA7_0 = input.LA(1);
				if ( (LA7_0==23) ) {
					alt7=1;
				}

				switch (alt7) {
				case 1 :
					// /Users/zhi/Downloads/antlrworks-1.5/Policy.g:56:5: d= declassifier
					{
					pushFollow(FOLLOW_declassifier_in_declassifiers329);
					d=declassifier();
					state._fsp--;

					result.put(d.get_name(), d);
					}
					break;

				default :
					break loop7;
				}
			}

			}

		}
		catch (RecognitionException re) {
			reportError(re);
			recover(input,re);
		}
		finally {
			// do for sure before leaving
		}
		return result;
	}
	// $ANTLR end "declassifiers"



	// $ANTLR start "declassifier"
	// /Users/zhi/Downloads/antlrworks-1.5/Policy.g:59:1: declassifier returns [T_Declassifier result = new T_Declassifier()] : 'procedure' id= ID '(' p= params ')' 'with' 'Declassifier' ',' 'Domain' '=>' d= domain_def ';' ;
	public final T_Declassifier declassifier() throws RecognitionException {
		T_Declassifier result =  new T_Declassifier();


		Token id=null;
		T_Pair p =null;
		HashMap<String, String> d =null;

		try {
			// /Users/zhi/Downloads/antlrworks-1.5/Policy.g:60:2: ( 'procedure' id= ID '(' p= params ')' 'with' 'Declassifier' ',' 'Domain' '=>' d= domain_def ';' )
			// /Users/zhi/Downloads/antlrworks-1.5/Policy.g:60:4: 'procedure' id= ID '(' p= params ')' 'with' 'Declassifier' ',' 'Domain' '=>' d= domain_def ';'
			{
			match(input,23,FOLLOW_23_in_declassifier349); 
			id=(Token)match(input,ID,FOLLOW_ID_in_declassifier353); 
			match(input,8,FOLLOW_8_in_declassifier355); 
			pushFollow(FOLLOW_params_in_declassifier359);
			p=params();
			state._fsp--;

			match(input,9,FOLLOW_9_in_declassifier361); 
			match(input,25,FOLLOW_25_in_declassifier363); 
			match(input,16,FOLLOW_16_in_declassifier369); 
			match(input,10,FOLLOW_10_in_declassifier371); 
			match(input,17,FOLLOW_17_in_declassifier377); 
			match(input,15,FOLLOW_15_in_declassifier379); 
			pushFollow(FOLLOW_domain_def_in_declassifier383);
			d=domain_def();
			state._fsp--;

			match(input,13,FOLLOW_13_in_declassifier385); 
			result.set_name((id!=null?id.getText():null)); 
				   result.set_params((ArrayList<String>)(p.getFirst())); 
				   result.set_param_mode((HashMap<String, String>)(p.getSecond()));
				   result.set_param_types(d);
			}

		}
		catch (RecognitionException re) {
			reportError(re);
			recover(input,re);
		}
		finally {
			// do for sure before leaving
		}
		return result;
	}
	// $ANTLR end "declassifier"



	// $ANTLR start "params"
	// /Users/zhi/Downloads/antlrworks-1.5/Policy.g:69:1: params returns [T_Pair result = new T_Pair<ArrayList<String>, HashMap<String, String>>()] : id1= ID ':' (m1= access_mode )? ID ( ';' id2= ID ':' (m2= access_mode )? ID )* ;
	public final T_Pair params() throws RecognitionException {
		T_Pair result =  new T_Pair<ArrayList<String>, HashMap<String, String>>();


		Token id1=null;
		Token id2=null;
		String m1 =null;
		String m2 =null;


		ArrayList<String> params = new ArrayList<String>();
		HashMap<String, String> param_mode = new HashMap<String, String>();
		String mode = "in";

		try {
			// /Users/zhi/Downloads/antlrworks-1.5/Policy.g:75:2: (id1= ID ':' (m1= access_mode )? ID ( ';' id2= ID ':' (m2= access_mode )? ID )* )
			// /Users/zhi/Downloads/antlrworks-1.5/Policy.g:75:4: id1= ID ':' (m1= access_mode )? ID ( ';' id2= ID ':' (m2= access_mode )? ID )*
			{
			id1=(Token)match(input,ID,FOLLOW_ID_in_params415); 
			match(input,11,FOLLOW_11_in_params417); 
			// /Users/zhi/Downloads/antlrworks-1.5/Policy.g:75:15: (m1= access_mode )?
			int alt8=2;
			int LA8_0 = input.LA(1);
			if ( (LA8_0==19||LA8_0==22) ) {
				alt8=1;
			}
			switch (alt8) {
				case 1 :
					// /Users/zhi/Downloads/antlrworks-1.5/Policy.g:75:16: m1= access_mode
					{
					pushFollow(FOLLOW_access_mode_in_params422);
					m1=access_mode();
					state._fsp--;

					mode = m1;
					}
					break;

			}

			match(input,ID,FOLLOW_ID_in_params428); 
			params.add((id1!=null?id1.getText():null)); param_mode.put((id1!=null?id1.getText():null), mode);
			// /Users/zhi/Downloads/antlrworks-1.5/Policy.g:77:4: ( ';' id2= ID ':' (m2= access_mode )? ID )*
			loop10:
			while (true) {
				int alt10=2;
				int LA10_0 = input.LA(1);
				if ( (LA10_0==13) ) {
					alt10=1;
				}

				switch (alt10) {
				case 1 :
					// /Users/zhi/Downloads/antlrworks-1.5/Policy.g:77:5: ';' id2= ID ':' (m2= access_mode )? ID
					{
					match(input,13,FOLLOW_13_in_params440); 
					id2=(Token)match(input,ID,FOLLOW_ID_in_params444); 
					match(input,11,FOLLOW_11_in_params446); 
					mode = "in";
					// /Users/zhi/Downloads/antlrworks-1.5/Policy.g:77:34: (m2= access_mode )?
					int alt9=2;
					int LA9_0 = input.LA(1);
					if ( (LA9_0==19||LA9_0==22) ) {
						alt9=1;
					}
					switch (alt9) {
						case 1 :
							// /Users/zhi/Downloads/antlrworks-1.5/Policy.g:77:35: m2= access_mode
							{
							pushFollow(FOLLOW_access_mode_in_params452);
							m2=access_mode();
							state._fsp--;

							mode = m2;
							}
							break;

					}

					match(input,ID,FOLLOW_ID_in_params458); 
					params.add((id2!=null?id2.getText():null)); param_mode.put((id2!=null?id2.getText():null), mode);
					}
					break;

				default :
					break loop10;
				}
			}

			result.setFirst(params); result.setSecond(param_mode);
			}

		}
		catch (RecognitionException re) {
			reportError(re);
			recover(input,re);
		}
		finally {
			// do for sure before leaving
		}
		return result;
	}
	// $ANTLR end "params"



	// $ANTLR start "access_mode"
	// /Users/zhi/Downloads/antlrworks-1.5/Policy.g:82:1: access_mode returns [String result = null] : ( 'in' | 'out' | 'in' 'out' );
	public final String access_mode() throws RecognitionException {
		String result =  null;


		try {
			// /Users/zhi/Downloads/antlrworks-1.5/Policy.g:83:2: ( 'in' | 'out' | 'in' 'out' )
			int alt11=3;
			int LA11_0 = input.LA(1);
			if ( (LA11_0==19) ) {
				int LA11_1 = input.LA(2);
				if ( (LA11_1==22) ) {
					alt11=3;
				}
				else if ( (LA11_1==ID) ) {
					alt11=1;
				}

				else {
					int nvaeMark = input.mark();
					try {
						input.consume();
						NoViableAltException nvae =
							new NoViableAltException("", 11, 1, input);
						throw nvae;
					} finally {
						input.rewind(nvaeMark);
					}
				}

			}
			else if ( (LA11_0==22) ) {
				alt11=2;
			}

			else {
				NoViableAltException nvae =
					new NoViableAltException("", 11, 0, input);
				throw nvae;
			}

			switch (alt11) {
				case 1 :
					// /Users/zhi/Downloads/antlrworks-1.5/Policy.g:83:4: 'in'
					{
					match(input,19,FOLLOW_19_in_access_mode487); 
					result="in";
					}
					break;
				case 2 :
					// /Users/zhi/Downloads/antlrworks-1.5/Policy.g:84:4: 'out'
					{
					match(input,22,FOLLOW_22_in_access_mode497); 
					result="out";
					}
					break;
				case 3 :
					// /Users/zhi/Downloads/antlrworks-1.5/Policy.g:85:4: 'in' 'out'
					{
					match(input,19,FOLLOW_19_in_access_mode507); 
					match(input,22,FOLLOW_22_in_access_mode509); 
					result="inout";
					}
					break;

			}
		}
		catch (RecognitionException re) {
			reportError(re);
			recover(input,re);
		}
		finally {
			// do for sure before leaving
		}
		return result;
	}
	// $ANTLR end "access_mode"



	// $ANTLR start "domain_def"
	// /Users/zhi/Downloads/antlrworks-1.5/Policy.g:88:1: domain_def returns [HashMap<String, String> result = new HashMap<String, String>()] : '(' id1= ID '=>' id2= ID ( ',' id3= ID '=>' id4= ID )* ')' ;
	public final HashMap<String, String> domain_def() throws RecognitionException {
		HashMap<String, String> result =  new HashMap<String, String>();


		Token id1=null;
		Token id2=null;
		Token id3=null;
		Token id4=null;

		try {
			// /Users/zhi/Downloads/antlrworks-1.5/Policy.g:89:2: ( '(' id1= ID '=>' id2= ID ( ',' id3= ID '=>' id4= ID )* ')' )
			// /Users/zhi/Downloads/antlrworks-1.5/Policy.g:89:4: '(' id1= ID '=>' id2= ID ( ',' id3= ID '=>' id4= ID )* ')'
			{
			match(input,8,FOLLOW_8_in_domain_def526); 
			id1=(Token)match(input,ID,FOLLOW_ID_in_domain_def539); 
			match(input,15,FOLLOW_15_in_domain_def541); 
			id2=(Token)match(input,ID,FOLLOW_ID_in_domain_def545); 
			result.put((id1!=null?id1.getText():null), (id2!=null?id2.getText():null));
			// /Users/zhi/Downloads/antlrworks-1.5/Policy.g:91:8: ( ',' id3= ID '=>' id4= ID )*
			loop12:
			while (true) {
				int alt12=2;
				int LA12_0 = input.LA(1);
				if ( (LA12_0==10) ) {
					alt12=1;
				}

				switch (alt12) {
				case 1 :
					// /Users/zhi/Downloads/antlrworks-1.5/Policy.g:91:9: ',' id3= ID '=>' id4= ID
					{
					match(input,10,FOLLOW_10_in_domain_def557); 
					id3=(Token)match(input,ID,FOLLOW_ID_in_domain_def561); 
					match(input,15,FOLLOW_15_in_domain_def563); 
					id4=(Token)match(input,ID,FOLLOW_ID_in_domain_def567); 
					result.put((id3!=null?id3.getText():null), (id4!=null?id4.getText():null));
					}
					break;

				default :
					break loop12;
				}
			}

			match(input,9,FOLLOW_9_in_domain_def576); 
			}

		}
		catch (RecognitionException re) {
			reportError(re);
			recover(input,re);
		}
		finally {
			// do for sure before leaving
		}
		return result;
	}
	// $ANTLR end "domain_def"



	// $ANTLR start "value"
	// /Users/zhi/Downloads/antlrworks-1.5/Policy.g:95:1: value returns [String result = null] : (n= NUM_INT |id= ID );
	public final String value() throws RecognitionException {
		String result =  null;


		Token n=null;
		Token id=null;

		try {
			// /Users/zhi/Downloads/antlrworks-1.5/Policy.g:96:2: (n= NUM_INT |id= ID )
			int alt13=2;
			int LA13_0 = input.LA(1);
			if ( (LA13_0==NUM_INT) ) {
				alt13=1;
			}
			else if ( (LA13_0==ID) ) {
				alt13=2;
			}

			else {
				NoViableAltException nvae =
					new NoViableAltException("", 13, 0, input);
				throw nvae;
			}

			switch (alt13) {
				case 1 :
					// /Users/zhi/Downloads/antlrworks-1.5/Policy.g:96:4: n= NUM_INT
					{
					n=(Token)match(input,NUM_INT,FOLLOW_NUM_INT_in_value593); 
					result = (n!=null?n.getText():null);
					}
					break;
				case 2 :
					// /Users/zhi/Downloads/antlrworks-1.5/Policy.g:96:36: id= ID
					{
					id=(Token)match(input,ID,FOLLOW_ID_in_value601); 
					result = (id!=null?id.getText():null);
					}
					break;

			}
		}
		catch (RecognitionException re) {
			reportError(re);
			recover(input,re);
		}
		finally {
			// do for sure before leaving
		}
		return result;
	}
	// $ANTLR end "value"

	// Delegated rules



	public static final BitSet FOLLOW_domain_definition_in_start32 = new BitSet(new long[]{0x0000000000800020L});
	public static final BitSet FOLLOW_domain_bindings_in_start39 = new BitSet(new long[]{0x0000000000800000L});
	public static final BitSet FOLLOW_declassifiers_in_start46 = new BitSet(new long[]{0x0000000000000002L});
	public static final BitSet FOLLOW_24_in_domain_definition66 = new BitSet(new long[]{0x0000000000000020L});
	public static final BitSet FOLLOW_ID_in_domain_definition68 = new BitSet(new long[]{0x0000000000100000L});
	public static final BitSet FOLLOW_20_in_domain_definition70 = new BitSet(new long[]{0x0000000000000100L});
	public static final BitSet FOLLOW_enumerated_values_in_domain_definition74 = new BitSet(new long[]{0x0000000002000000L});
	public static final BitSet FOLLOW_25_in_domain_definition76 = new BitSet(new long[]{0x0000000000040000L});
	public static final BitSet FOLLOW_ordering_in_domain_definition80 = new BitSet(new long[]{0x0000000000002000L});
	public static final BitSet FOLLOW_13_in_domain_definition82 = new BitSet(new long[]{0x0000000000000002L});
	public static final BitSet FOLLOW_8_in_enumerated_values103 = new BitSet(new long[]{0x0000000000000020L});
	public static final BitSet FOLLOW_ID_in_enumerated_values115 = new BitSet(new long[]{0x0000000000000600L});
	public static final BitSet FOLLOW_10_in_enumerated_values127 = new BitSet(new long[]{0x0000000000000020L});
	public static final BitSet FOLLOW_ID_in_enumerated_values131 = new BitSet(new long[]{0x0000000000000600L});
	public static final BitSet FOLLOW_9_in_enumerated_values141 = new BitSet(new long[]{0x0000000000000002L});
	public static final BitSet FOLLOW_18_in_ordering161 = new BitSet(new long[]{0x0000000000008002L});
	public static final BitSet FOLLOW_15_in_ordering164 = new BitSet(new long[]{0x0000000004200000L});
	public static final BitSet FOLLOW_26_in_ordering168 = new BitSet(new long[]{0x0000000000000020L});
	public static final BitSet FOLLOW_ID_in_ordering172 = new BitSet(new long[]{0x0000000000004000L});
	public static final BitSet FOLLOW_14_in_ordering174 = new BitSet(new long[]{0x0000000000000020L});
	public static final BitSet FOLLOW_ID_in_ordering178 = new BitSet(new long[]{0x0000000008000400L});
	public static final BitSet FOLLOW_10_in_ordering196 = new BitSet(new long[]{0x0000000000000020L});
	public static final BitSet FOLLOW_ID_in_ordering200 = new BitSet(new long[]{0x0000000000004000L});
	public static final BitSet FOLLOW_14_in_ordering202 = new BitSet(new long[]{0x0000000000000020L});
	public static final BitSet FOLLOW_ID_in_ordering206 = new BitSet(new long[]{0x0000000008000400L});
	public static final BitSet FOLLOW_27_in_ordering212 = new BitSet(new long[]{0x0000000000000002L});
	public static final BitSet FOLLOW_21_in_ordering232 = new BitSet(new long[]{0x0000000000000002L});
	public static final BitSet FOLLOW_domain_binding_in_domain_bindings261 = new BitSet(new long[]{0x0000000000000022L});
	public static final BitSet FOLLOW_ID_in_domain_binding283 = new BitSet(new long[]{0x0000000000000800L});
	public static final BitSet FOLLOW_11_in_domain_binding285 = new BitSet(new long[]{0x0000000000000020L});
	public static final BitSet FOLLOW_ID_in_domain_binding287 = new BitSet(new long[]{0x0000000002000000L});
	public static final BitSet FOLLOW_25_in_domain_binding289 = new BitSet(new long[]{0x0000000000020000L});
	public static final BitSet FOLLOW_17_in_domain_binding291 = new BitSet(new long[]{0x0000000000008000L});
	public static final BitSet FOLLOW_15_in_domain_binding293 = new BitSet(new long[]{0x0000000000000020L});
	public static final BitSet FOLLOW_ID_in_domain_binding297 = new BitSet(new long[]{0x0000000000003000L});
	public static final BitSet FOLLOW_12_in_domain_binding300 = new BitSet(new long[]{0x0000000000000060L});
	public static final BitSet FOLLOW_value_in_domain_binding302 = new BitSet(new long[]{0x0000000000002000L});
	public static final BitSet FOLLOW_13_in_domain_binding306 = new BitSet(new long[]{0x0000000000000002L});
	public static final BitSet FOLLOW_declassifier_in_declassifiers329 = new BitSet(new long[]{0x0000000000800002L});
	public static final BitSet FOLLOW_23_in_declassifier349 = new BitSet(new long[]{0x0000000000000020L});
	public static final BitSet FOLLOW_ID_in_declassifier353 = new BitSet(new long[]{0x0000000000000100L});
	public static final BitSet FOLLOW_8_in_declassifier355 = new BitSet(new long[]{0x0000000000000020L});
	public static final BitSet FOLLOW_params_in_declassifier359 = new BitSet(new long[]{0x0000000000000200L});
	public static final BitSet FOLLOW_9_in_declassifier361 = new BitSet(new long[]{0x0000000002000000L});
	public static final BitSet FOLLOW_25_in_declassifier363 = new BitSet(new long[]{0x0000000000010000L});
	public static final BitSet FOLLOW_16_in_declassifier369 = new BitSet(new long[]{0x0000000000000400L});
	public static final BitSet FOLLOW_10_in_declassifier371 = new BitSet(new long[]{0x0000000000020000L});
	public static final BitSet FOLLOW_17_in_declassifier377 = new BitSet(new long[]{0x0000000000008000L});
	public static final BitSet FOLLOW_15_in_declassifier379 = new BitSet(new long[]{0x0000000000000100L});
	public static final BitSet FOLLOW_domain_def_in_declassifier383 = new BitSet(new long[]{0x0000000000002000L});
	public static final BitSet FOLLOW_13_in_declassifier385 = new BitSet(new long[]{0x0000000000000002L});
	public static final BitSet FOLLOW_ID_in_params415 = new BitSet(new long[]{0x0000000000000800L});
	public static final BitSet FOLLOW_11_in_params417 = new BitSet(new long[]{0x0000000000480020L});
	public static final BitSet FOLLOW_access_mode_in_params422 = new BitSet(new long[]{0x0000000000000020L});
	public static final BitSet FOLLOW_ID_in_params428 = new BitSet(new long[]{0x0000000000002002L});
	public static final BitSet FOLLOW_13_in_params440 = new BitSet(new long[]{0x0000000000000020L});
	public static final BitSet FOLLOW_ID_in_params444 = new BitSet(new long[]{0x0000000000000800L});
	public static final BitSet FOLLOW_11_in_params446 = new BitSet(new long[]{0x0000000000480020L});
	public static final BitSet FOLLOW_access_mode_in_params452 = new BitSet(new long[]{0x0000000000000020L});
	public static final BitSet FOLLOW_ID_in_params458 = new BitSet(new long[]{0x0000000000002002L});
	public static final BitSet FOLLOW_19_in_access_mode487 = new BitSet(new long[]{0x0000000000000002L});
	public static final BitSet FOLLOW_22_in_access_mode497 = new BitSet(new long[]{0x0000000000000002L});
	public static final BitSet FOLLOW_19_in_access_mode507 = new BitSet(new long[]{0x0000000000400000L});
	public static final BitSet FOLLOW_22_in_access_mode509 = new BitSet(new long[]{0x0000000000000002L});
	public static final BitSet FOLLOW_8_in_domain_def526 = new BitSet(new long[]{0x0000000000000020L});
	public static final BitSet FOLLOW_ID_in_domain_def539 = new BitSet(new long[]{0x0000000000008000L});
	public static final BitSet FOLLOW_15_in_domain_def541 = new BitSet(new long[]{0x0000000000000020L});
	public static final BitSet FOLLOW_ID_in_domain_def545 = new BitSet(new long[]{0x0000000000000600L});
	public static final BitSet FOLLOW_10_in_domain_def557 = new BitSet(new long[]{0x0000000000000020L});
	public static final BitSet FOLLOW_ID_in_domain_def561 = new BitSet(new long[]{0x0000000000008000L});
	public static final BitSet FOLLOW_15_in_domain_def563 = new BitSet(new long[]{0x0000000000000020L});
	public static final BitSet FOLLOW_ID_in_domain_def567 = new BitSet(new long[]{0x0000000000000600L});
	public static final BitSet FOLLOW_9_in_domain_def576 = new BitSet(new long[]{0x0000000000000002L});
	public static final BitSet FOLLOW_NUM_INT_in_value593 = new BitSet(new long[]{0x0000000000000002L});
	public static final BitSet FOLLOW_ID_in_value601 = new BitSet(new long[]{0x0000000000000002L});
}
