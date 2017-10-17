package com.laegler.microservice.editor.backend;

import com.laegler.microservice.adapter.lib.yaml.YamlAdapter;
import com.laegler.microservice.model.ModelRoot;
import com.laegler.microservice.model2code.Model2CodeTransformator;
import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import java.io.File;
import java.io.IOException;

@RestController
public class ArchitectureRest {

	@Autowired
	private Model2CodeTransformator transform;

	@Autowired
	private YamlAdapter yamlAdapter;

	@GetMapping("application/zip")
	public ResponseEntity<?> generateStubGET(String architecture) throws IOException {
		// generate
		ModelRoot m = yamlAdapter.toModel(architecture);
		transform.generate(m.getArchitecture());

		// zip file
		final File file = new File("project.zip");

		return ResponseEntity.ok(FileUtils.readFileToByteArray(file));
		// .contentType("application/zip")
		// .header("Content-Disposition", "attachment; filename=\"project.zip\"")
		// .build();
	}
}
