package org.sireum.bakar.policy.parser;

import java.util.ArrayList;
import java.util.HashMap;

public class T_Declassifier {
	T_Declassifier() {
		this.f_name = null;
		this.f_params = new ArrayList<String>();
		this.f_param_type = new HashMap<String, String>();
		this.f_param_mode = new HashMap<String, String>();
	}
	
	T_Declassifier(String f_name) {
		this.f_name = f_name;
		this.f_params = new ArrayList<String>();
		this.f_param_type = new HashMap<String, String>();
		this.f_param_mode = new HashMap<String, String>();
	}
	
	String f_name;
	ArrayList<String> f_params;
	HashMap<String, String> f_param_type;
	HashMap<String, String> f_param_mode;
	
	// ---
	public String get_name() {
		return this.f_name;
	}
	
	public ArrayList<String> get_params() {
		return this.f_params;
	}
	
	public HashMap<String, String> get_param_types() {
		return this.f_param_type;
	}
	
	public HashMap<String, String> get_param_mode() {
		return this.f_param_mode;
	}
	
	// given a parameter, return its bounded domain
	public String get_param_type(String param) {
		if(this.f_params.contains(param)) {
			return this.f_param_type.get(param);
		}else{
			return null;
		}
	}
	
	// ---
	public void set_name(String f_name) {
		this.f_name = f_name;
	}	

	public void set_params(ArrayList<String> f_params) {
		this.f_params = f_params;
	}
	
	public void set_param_types(HashMap<String, String> f_param_types) {
		this.f_param_type = f_param_types;
	}
	
	public void set_param_mode(HashMap<String, String> f_param_mode) {
		this.f_param_mode = f_param_mode;
	}	
	
	// ---
	public void add_param(String param) {
		this.f_params.add(param);
	}
	
	public void add_param_type(String param, String type) {
		this.f_param_type.put(param, type);
	}
}
