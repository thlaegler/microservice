package com.laegler.microservice.editor.backend;

import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import java.io.File;

@RestController
public class ArchitectureRest {

	@Autowired
	private Model2CodeTransformator transform;

	@GetMapping("application/zip")
	public ResponseEntity<?> generateStubGET(String architecture) {
		// generate
		transform.

		// zip file
		final File file = new File("project.zip");

		return ResponseEntity.ok(FileUtils.readFileToByteArray(file)).type("application/zip")
				.header("Content-Disposition", "attachment; filename=\"project.zip\"").build();
	}
}
