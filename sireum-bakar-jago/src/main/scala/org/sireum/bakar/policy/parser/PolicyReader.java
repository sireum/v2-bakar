package org.sireum.bakar.policy.parser;

import org.antlr.runtime.ANTLRFileStream;
import org.antlr.runtime.CommonTokenStream;

public class PolicyReader {
	
	public static T_Policy ParsePolicy(String policy_file) {
		try {
			policy_file = "/Users/zhi/Documents/workspace/bakar/sireum-bakar-jago/src/main/scala/org/sireum/bakar/policy/parser/policy.ads";
			final ANTLRFileStream afs = new ANTLRFileStream(policy_file);
			final PolicyLexer adl = new PolicyLexer(afs);
			final CommonTokenStream cts = new CommonTokenStream(adl);
			final PolicyParser adp = new PolicyParser(cts);
			final T_Policy p = adp.start();
			return p;
			
		} catch (final Exception e) {
			e.printStackTrace();
			throw new RuntimeException();
		}
	}
	
}
