package com.laegler.microservice.adapter.model;

public enum FileType {

	UNDEFINED("", "// ", null, null), //
	DOCKERFILE("", "# ", null, null), //
	XML("xml", null, "<!--", "-->"), //
	JAVA("java", "// ", "/* ", " */"), //
	XTEND("xtend", "// ", "/* ", " */"), //
	PROPERTIES("properties", "# ", null, null), //
	GITIGNORE("gitignore", "# ", null, null), //
	XHTML("xhtml", null, "<!--", "-->"), //
	HTML("html", null, "<!--", "-->"), //
	MD("md", null, "<!---", "-->"), //
	SH("sh", "", null, null), //
	FEATURE("feature", "# ", null, null), //
	TEXTILE("textile", null, "<!--", "-->"), //
	ECLIPSE_PROJECT("project", null, "<!--", "-->"), //
	ECLIPSE_CLASSPATH("classpath", null, "<!--", "-->"), //
	ECLIPSE_PREFS("prefs", null, "<!--", "-->"), //
	INTELLIJ_PROJECT("iml", null, "<!--", "-->"), //
	MANIFEST("MF", "# ", null, null), //
	PROTO("proto", "# ", null, null), //
	YAML("yaml", "// ", null, null), //
	JSON("json", "// ", null, null), //
	DOT("dot", "", null, null), //
	PLANT_UML("plantuml", "", null, null), //
	ARCHITECTURE("architecture", "// ", "/* ", " */");

	private String extension;
	private String lineComment;
	private String beginComment;
	private String endComment;

	FileType(String extension, String lineComment, String beginComment, String endComment) {
		this.extension = extension;
		this.lineComment = lineComment;
		this.beginComment = beginComment;
		this.endComment = endComment;
	}

	public String getExtension() {
		return extension;
	}

	public String getLineComment() {
		return lineComment;
	}

	public String getBeginComment() {
		return beginComment;
	}

	public String getEndComment() {
		return endComment;
	}

	public String getComment(String text) {
		if (lineComment == null) {
			return beginComment + ' ' + text + ' ' + endComment;
		}
		return lineComment + ' ' + text;
	}

}
