package org.sireum.bakar.policy.parser;

import java.util.HashMap;

public class T_Policy {
	T_Domain domains;
	HashMap<String, String> domain_bindings;
	HashMap<String, T_Declassifier> declassifiers;
	
	public T_Policy() {
		this.domains = new T_Domain();
		this.domain_bindings = new HashMap<String, String>();
		this.declassifiers = new HashMap<String, T_Declassifier>();
	}
	
	// ---
	public T_Domain get_domains() {
		return this.domains;
	}
	
	public HashMap<String, String> get_domain_bindings() {
		return this.domain_bindings;
	}
	
	public HashMap<String, T_Declassifier> get_declassifiers() {
		return this.declassifiers;
	}
	
	// ---
	public void set_domains(T_Domain domains) {
		this.domains = domains;
	}
	
	public void set_domain_bindings(HashMap<String, String> domain_bindings) {
		this.domain_bindings = domain_bindings;
	}
	
	public void set_declassifiers(HashMap<String, T_Declassifier> declassifiers) {
		this.declassifiers = declassifiers;
	}	
	
	// ---
	public void add_domain(String domain) {
		this.domains.add_domain(domain);
	}
	
	public void add_domain_ordering(String l_domain, String r_domain) {
		this.domains.add_domain_ordering(l_domain, r_domain);
	}
	
	public void add_domain_binding(String id, String domain) {
		this.domain_bindings.put(id, domain);
	}
	
	public void add_declassifier(String f_name, T_Declassifier declassifier) {
		this.declassifiers.put(f_name, declassifier);
	}
}




