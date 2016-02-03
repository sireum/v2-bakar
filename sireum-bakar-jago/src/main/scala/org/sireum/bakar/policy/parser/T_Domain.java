package org.sireum.bakar.policy.parser;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;

public class T_Domain {
	String domain_name;
	ArrayList<String> domains;
	// domain_of(key) <= domain_of(value)
	HashMap<String, String> domain_ordering;
	
	public T_Domain() {
		this.domain_name = null;
		this.domains = new ArrayList<String>();
		this.domain_ordering = new HashMap<String, String>();
	}
	
	// ---
	public String get_domain_name() {
		return this.domain_name;
	}
	
	public ArrayList<String> get_domains() {
		return this.domains;
	}
	
	public HashMap<String, String> get_domain_ordering() {
		return this.domain_ordering;
	}
	
	// ---
	public void set_domain_name(String domain_name) {
		this.domain_name = domain_name;
	}	
	
	public void set_domains(ArrayList<String> domains) {
		this.domains = domains;
	}
	
	public void set_domain_ordering(HashMap<String, String> domain_ordering) {
		if(domain_ordering.containsKey("default")) {
			// by default, it's a totally ordering domains
			Iterator<String> i = this.domains.iterator();
			String p = i.next();
			while(i.hasNext()) {
				String q = i.next();
				this.domain_ordering.put(p, q);
				p = q;
			}
			/*
			Iterator it = domain_ordering.entrySet().iterator();
			while(it.hasNext()) {
				Map.Entry pair = (Map.Entry)it.next();
				this.domain_ordering.put((String)pair.getKey(), (String)pair.getValue());
			}
			*/
		}else{
			this.domain_ordering = domain_ordering;
		}
	}
	
	// ---
	public void add_domain(String domain) {
		this.domains.add(domain);
	}
	
	public void add_domain_ordering(String l_domain, String r_domain) {
		this.domain_ordering.put(l_domain, r_domain);
	}
}
