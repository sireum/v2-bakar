package org.sireum.bakar.policy.parser;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;

public class T_Domain {
	String domain_name;
	ArrayList<String> domains;
	ArrayList<T_Pair<String, String>> domain_ordering;
	
	public T_Domain() {
		this.domain_name = null;
		this.domains = new ArrayList<String>();
		this.domain_ordering = new ArrayList<T_Pair<String, String>>();
	}
	
	// ---
	public String get_domain_name() {
		return this.domain_name;
	}
	
	public ArrayList<String> get_domains() {
		return this.domains;
	}
	
	public ArrayList<T_Pair<String, String>> get_domain_ordering() {
		return this.domain_ordering;
	}
	
	// ---
	public void set_domain_name(String domain_name) {
		this.domain_name = domain_name;
	}	
	
	public void set_domains(ArrayList<String> domains) {
		this.domains = domains;
	}
	
	public void set_domain_ordering(ArrayList<T_Pair<String, String>> domain_ordering) {
		if(domain_ordering.size() > 0 && domain_ordering.get(0).getFirst() == "default") {
			// by default, it's a totally ordering domains
			Iterator<String> i = this.domains.iterator();
			String p = i.next();
			while(i.hasNext()) {
				String q = i.next();
				this.domain_ordering.add(new T_Pair<String, String>(p, q));
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
		this.domain_ordering.add(new T_Pair<String, String>(l_domain, r_domain));
	}
}
