package com.laegler.microservice.adapter.lib.yaml

import org.yaml.snakeyaml.Yaml
import com.laegler.microservice.model.ModelRoot

class YamlAdapter {

	/**
	 * Serialize a single object.    
	 */
	public def String serialize(ModelRoot root) {
		val Yaml yaml = new Yaml
		yaml.dump(root)
	}

	/**
	 * Deserialize to single object.
	 */
	public def ModelRoot deserialize(String yamlString) {
		val Yaml yaml = new Yaml
		yaml.loadAs(yamlString, ModelRoot)
	}
}
