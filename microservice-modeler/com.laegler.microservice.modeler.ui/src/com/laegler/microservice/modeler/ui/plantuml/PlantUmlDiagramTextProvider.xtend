package com.laegler.microservice.modeler.ui.plantuml

import microserviceModel.Architecture
import net.sourceforge.plantuml.eclipse.utils.DiagramTextProvider
import org.eclipse.jface.viewers.ISelection
import org.eclipse.ui.IEditorPart
import org.eclipse.xtext.ui.editor.XtextEditor
import org.eclipse.xtext.ui.editor.model.XtextDocument
import com.laegler.microservice.codegen.Model2CodeTransformator

class PlantUmlDiagramTextProvider implements DiagramTextProvider {

	extension Model2CodeTransformator transformator = new Model2CodeTransformator

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
