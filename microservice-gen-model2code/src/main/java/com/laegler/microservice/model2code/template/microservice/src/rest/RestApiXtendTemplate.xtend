package com.laegler.microservice.model2code.template.microservice.src.rest

import com.laegler.microservice.adapter.util.Project
import com.laegler.microservice.model2code.template.base.AbstractXtendTemplate
import io.swagger.models.Operation
import io.swagger.models.parameters.AbstractSerializableParameter
import io.swagger.models.parameters.BodyParameter
import io.swagger.models.parameters.Parameter
import io.swagger.models.parameters.RefParameter
import java.util.HashMap
import java.util.Map
import java.util.Map.Entry

class RestApiXtendTemplate extends AbstractXtendTemplate {

	private Operation operation

	new(Project project, Operation operation) {
		super(project)
		this.operation = operation
		fileName = '''«operation?.tags?.findFirst[].toFirstUpper»'''
		relativPath = '''src/main/java/«project?.basePackage?.toPath»/operation'''
		documentation = '''operation «operation?.tags?.findFirst[].toFirstUpper»'''

		this.content = template
	}

	override public String getDocumentation() '''The REST API for path «operation?.tags?.findFirst[]?.toFirstUpper»'''

	override public String getTemplateName() '''«this.class.name»'''

//	override public ProjectType getProject() { ProjectType.REST_CLIENT }
	override public String getFileName() '''«operation?.tags?.findFirst[].replaceFirst('[^A-Za-z0-9]','').toFirstUpper»RestApi'''

//	override public String getPath() '''«super.path»/src/main/java/«stubb?.packageName?.toPath»/rest/server/'''
	def public String getTemplate() '''
		package «model.getOption('packageName')».rest.server
		
		import javax.ws.rs.GET
		import javax.ws.rs.POST
		import javax.ws.rs.PUT
		import javax.ws.rs.DELETE
		import javax.ws.rs.Consumes
		import javax.ws.rs.core.Response
		import javax.ws.rs.Produces
		import javax.ws.rs.core.SecurityContext
		
		«javaDocType»
		public class «fileName» {
			
			«val Map<String, Operation> operations = new HashMap<String, Operation>»
		«««			«operations.put('get',operation?.get)»
«««			«operations.put('post',operation?.post)»
«««			«operations.put('put',operation?.put)»
«««			«operations.put('delete',operation?.delete)»
			
			«FOR Entry<String, Operation> operation : operations.entrySet»
			«IF operation?.value != null»
				@«operation?.key?.toUpperCase»
				«IF !operation?.value?.consumes.isNullOrEmpty»
					@Consumes(#[«FOR String consumes : operation?.value?.consumes»'«consumes»', «ENDFOR»'null/null'])
				«ENDIF»
				«IF !operation?.value?.produces.isNullOrEmpty»
					@Produces(#[«FOR String produces : operation?.value?.produces»'«produces»', «ENDFOR»'null/null'])
				«ENDIF»
			def Response «operation?.value?.tags?.findFirst[]?.replaceFirst('[^A-Za-z0-9]','')?.toFirstLower»«operation?.key?.toFirstUpper»(«IF !operation?.value?.parameters?.nullOrEmpty»«FOR Parameter param : operation?.value?.parameters»«IF param instanceof AbstractSerializableParameter»«(param as AbstractSerializableParameter)?.items?.type» «(param as AbstractSerializableParameter)?.items?.name»«ELSEIF param instanceof BodyParameter»«(param as BodyParameter)?.schema?.title» «(param as BodyParameter).schema?.title»«ELSEIF param instanceof RefParameter»«(param as RefParameter)?.simpleRef» «(param as RefParameter)?.simpleRef»«ENDIF», «ENDFOR»«ENDIF»SecurityContext securityContext) {
				Response.ok.build
			}
			
			«ENDIF»
			«ENDFOR»
		}
	'''
}
