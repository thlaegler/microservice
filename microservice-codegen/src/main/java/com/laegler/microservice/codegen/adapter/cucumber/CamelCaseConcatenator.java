package com.laegler.microservice.codegen.adapter.cucumber;

public class CamelCaseConcatenator implements Concatenator {

	public String concatenate(String[] words) {
		StringBuilder functionName = new StringBuilder();
		boolean firstWord = true;
		for (String word : words) {
			if (firstWord) {
				functionName.append(word.toLowerCase());
				firstWord = false;
			} else {
				functionName.append(capitalize(word));
			}
		}
		return functionName.toString();
	}

	private String capitalize(String line) {
		return Character.toUpperCase(line.charAt(0)) + line.substring(1);
	}
}