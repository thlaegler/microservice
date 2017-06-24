package com.laegler.microservice.codegen

import org.yaml.snakeyaml.constructor.Constructor
import java.io.InputStream
import com.laegler.microservice.codegen.model.Microservice
import org.yaml.snakeyaml.Yaml
import com.laegler.microservice.codegen.model.YamlConfig
import java.io.FileInputStream
import java.io.File
import java.io.FileNotFoundException

class ArchitectureToMavenProject {

	protected def String readSpringApplicationFileContent(Microservice m) {
//		m.directory.listFiles.filter[it?.listFiles?.c]
		val Constructor constructor = new Constructor(YamlConfig);
		val Yaml yaml = new Yaml(constructor);

		var InputStream input = null;
		try {
			input = new FileInputStream(new File('/tmp/apps.yml'))
		} catch (FileNotFoundException e) {
			e.printStackTrace
		}
		val YamlConfig data = yaml.loadAs(input, YamlConfig)
		''
	}
}
