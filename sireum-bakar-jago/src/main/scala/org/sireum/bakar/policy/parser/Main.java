package org.sireum.bakar.policy.parser;

import org.antlr.runtime.ANTLRFileStream;
import org.antlr.runtime.CommonTokenStream;

public class Main {

	/**
	 * @param args
	 */
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		try {
			final ANTLRFileStream afs = new ANTLRFileStream("./src/main/scala/org/sireum/bakar/policy/parser/policy.ads");
			final PolicyLexer adl = new PolicyLexer(afs);
			final CommonTokenStream cts = new CommonTokenStream(adl);
			final PolicyParser adp = new PolicyParser(cts);
			final T_Policy p = adp.start();
			System.out.println("ok, now");
			
		} catch (final Exception e) {
			e.printStackTrace();
			throw new RuntimeException();
		}
	}

}
