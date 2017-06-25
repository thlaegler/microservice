package com.laegler.microservice.modeler.ui.plantuml

import net.sourceforge.plantuml.eclipse.utils.DiagramTextProvider
import org.eclipse.jface.viewers.ISelection
import org.eclipse.ui.IEditorPart
import org.eclipse.xtext.ui.editor.XtextEditor
import org.eclipse.xtext.ui.editor.model.XtextDocument
import com.google.inject.Inject
import com.laegler.microservice.codegen.Architecture2MavenProject
import microserviceModel.Architecture

class PlantUmlDiagramTextProvider implements DiagramTextProvider {

	extension Architecture2MavenProject transformator = new Architecture2MavenProject

	override getDiagramText(IEditorPart editorPart, ISelection selection) {
		val document = (editorPart as XtextEditor).getDocumentProvider().getDocument(
			editorPart.editorInput) as XtextDocument;
		val Architecture model = document.readOnly [
			if (contents.head instanceof Architecture) {
				return contents.head as Architecture
			}
		]

		model?.plantumlGraphFileContent
	}

	override supportsEditor(IEditorPart editorPart) {
		if (editorPart instanceof XtextEditor) {
			return true;
		}
		false
	}

	override supportsSelection(ISelection arg0) {
		true
	}

}
