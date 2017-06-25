package com.laegler.microservice.codegen.adapter.cucumber;

public class UnderscoreConcatenator implements Concatenator {

	public String concatenate(String[] words) {
		StringBuilder functionName = new StringBuilder();
		boolean firstWord = true;
		for (String word : words) {
			if (firstWord) {
				word = word.toLowerCase();
			} else {
				functionName.append('_');
			}
			functionName.append(word);
			firstWord = false;
		}
		return functionName.toString();
	}

}