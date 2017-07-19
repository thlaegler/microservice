package com.laegler.microservice.adapter.lib.json

import com.laegler.microservice.model.Architecture
import gherkin.deps.com.google.gson.Gson
import javax.inject.Named

@Named
class JsonAdapter {

	/**
	 * Serialize a single object.    
	 */
	public def String serialize(Architecture architecture) {
		val Gson gson = new Gson
		gson.toJson(architecture)
	}

	/**
	 * Deserialize to single object.
	 */
	public def Architecture deserialize(String jsonString) {
		val Gson gson = new Gson
		gson.fromJson(jsonString, Architecture)
	}

}
