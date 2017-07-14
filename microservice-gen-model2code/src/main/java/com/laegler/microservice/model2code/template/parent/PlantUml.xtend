package com.laegler.microservice.model2code.template.parent

import java.util.ArrayList
import com.laegler.microservice.model.microserviceModel.Architecture
import com.laegler.microservice.model.microserviceModel.GrpcConsume
import com.laegler.microservice.model.microserviceModel.GrpcExpose
import com.laegler.microservice.model.microserviceModel.GrpcJar
import com.laegler.microservice.model.microserviceModel.Jar
import com.laegler.microservice.model.microserviceModel.RestConsume
import com.laegler.microservice.model.microserviceModel.RestExpose
import com.laegler.microservice.model.microserviceModel.Spring
import com.laegler.microservice.adapter.model.Project
import com.laegler.microservice.adapter.model.Template
import com.laegler.microservice.adapter.model.TemplateBuilder
import javax.inject.Named
import com.laegler.microservice.adapter.model.FileType
import com.laegler.microservice.adapter.util.DiagramUtil
import javax.inject.Inject
import org.slf4j.LoggerFactory
import org.slf4j.Logger
import com.laegler.microservice.adapter.util.NamingStrategy
import com.laegler.microservice.adapter.model.World
import com.laegler.microservice.adapter.util.StringUtil

@Named
class PlantUml {

	protected static final Logger LOG = LoggerFactory.getLogger(PlantUml)

	@Inject protected World world
	@Inject protected TemplateBuilder templateBuilder
	@Inject protected NamingStrategy namingStrategy
	@Inject protected DiagramUtil diagramUtil
	@Inject protected StringUtil stringUtil

	public def Template getTemplate(Project project) {
		LOG.debug('Generate template PlantUml')

		templateBuilder //
		.project(project) //
		.fileName('architecture.plantuml') //
		.fileType(FileType.UNDEFINED) //
		.relativPath(namingStrategy.getAbsoluteBasePath(project.name)) //
		.content(content).build
	}

	private def String getContent() {
		val services = new ArrayList<String>()
		services.add('@startuml')
		services.add('skinparam componentStyle uml2')
		services.add('''
			
			skinparam
			
			interface  {
				backgroundColor RosyBrown
				borderColor orange
			}
		''')
		services.add(
			'''
			sprite $dependency [16x16/16] {
				FFFFFFFFFFFFFFFF
				FFFFFFFFFFFFFFFF
				FFFFFFFFFFFFFFFF
				FFFFFFFFFFFFFFFF
				FFFFFFFFFF0FFFFF
				FFFFFFFFFF00FFFF
				FF00000000000FFF
				FF000000000000FF
				FF00000000000FFF
				FFFFFFFFFF00FFFF
				FFFFFFFFFF0FFFFF
				FFFFFFFFFFFFFFFF
				FFFFFFFFFFFFFFFF
				FFFFFFFFFFFFFFFF
				FFFFFFFFFFFFFFFF
				FFFFFFFFFFFFFFFF
			}'''
		)
		services.add(' ')
		world.architecture?.artifacts?.filter(Jar).forEach [
			val jar = it as Jar
			val jarName = jar?.name
			jar => []
		]
		world.architecture?.artifacts?.filter(GrpcJar).forEach [
			val jar = it as GrpcJar
			val jarName = jar?.name
			jar => [
				protoFile
			]
		]
		world.architecture?.artifacts?.filter(Spring).forEach [
			val service = it as Spring
			val serviceName = service?.name
			service => [
				val serviceNameClean = stringUtil.clean(serviceName)
				services.add('''node "«service?.type?.literal»: «serviceName»" {''')
				services.add('''	component "«serviceName»" as «serviceNameClean»''')
				exposes?.filter(RestExpose).forEach [
					var color = diagramUtil.umlColorRest
					if (it.draft) {
						color = diagramUtil.umlColorDraft
					}
					services.add('''	interface "«it?.name» «it?.port»" as «stringUtil.clean(it.name)» «color»''')
					services.add('''	[«»] -[«color»]-> () «stringUtil.clean(it.name)» : exposes''')
				]
				exposes?.filter(GrpcExpose).forEach [
					var color = diagramUtil.umlColorGrpc
					if (it.draft) {
						color = diagramUtil.umlColorDraft
					}
					services.add('''	interface "«it?.name» «it.port»" as «stringUtil.clean(it.name)» «color»''')
					services.add('''	[«serviceNameClean»] -[«color»]-> () «it?.name» : exposes''')
				]
				dependencies?.forEach [
					var String label = it?.target?.name + '.jar'
					if (it.target === null) {
						label = it?.name + '.jar'
					}
					services.
						add('''	rectangle "«label»" <<$dependency>> as «serviceNameClean»«stringUtil.clean(label)» «diagramUtil.umlColorJar»''');
					services.
						add('''	[«serviceNameClean»] -[«diagramUtil.umlColorJar»]-> «serviceNameClean»«stringUtil.clean(label)» : uses''')
				]
				services.add('}')
				services.add(' ')
				consumes?.filter(RestConsume).forEach [
					services.
						add('''[«serviceNameClean»] -[«diagramUtil.umlColorRest»]-> () «stringUtil.clean(it?.target?.name)» : consumes«stringUtil.formatted(it?.description)»''')
				]
				consumes?.filter(GrpcConsume).forEach [
					services.
						add('''[«serviceNameClean»] -[«diagramUtil.umlColorGrpc»]-> () «stringUtil.clean(it?.target?.name)» : consumes«stringUtil.formatted(it?.description)»''')
				]
				services.add(' ')
			]
		]
		services.add('@enduml')
		services.join(System.getProperty('line.separator'))
	}
}
