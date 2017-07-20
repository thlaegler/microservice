package com.laegler.microservice.adapter.lib.yaml

import org.yaml.snakeyaml.Yaml
import com.laegler.microservice.model.ModelRoot
import com.laegler.microservice.model.Architecture

class YamlAdapter {

	/**
	 * Serialize a ModelRoot.    
	 */
	public def String serialize(ModelRoot root) {
		val Yaml yaml = new Yaml
		yaml.dump(root)
	}

	/**
	 * Serialize a Architecture.    
	 */
	public def String serialize(Architecture a) {
		val Yaml yaml = new Yaml
		yaml.dump(new ModelRoot => [architecture = a])
	}

	/**
	 * Deserialize to ModelRoot.
	 */
	public def ModelRoot deserialize(String yamlString) {
		val Yaml yaml = new Yaml
		yaml.loadAs(yamlString, ModelRoot)
	}
}
