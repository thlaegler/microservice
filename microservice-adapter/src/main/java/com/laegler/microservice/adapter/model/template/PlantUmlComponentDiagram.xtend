package com.laegler.microservice.adapter.model.template

import com.laegler.microservice.adapter.model.FileType
import com.laegler.microservice.adapter.model.Project
import com.laegler.microservice.adapter.model.Template
import com.laegler.microservice.adapter.model.TemplateBuilder
import com.laegler.microservice.adapter.model.World
import com.laegler.microservice.adapter.util.DiagramUtil
import com.laegler.microservice.adapter.util.NamingStrategy
import com.laegler.microservice.adapter.util.StringUtil
import java.util.ArrayList
import javax.inject.Inject
import javax.inject.Named
import org.slf4j.Logger
import org.slf4j.LoggerFactory
import com.laegler.microservice.model.Artifact
import com.laegler.microservice.model.Expose
import com.laegler.microservice.model.EndpointType

@Named
class PlantUmlComponentDiagram {

	static final Logger LOG = LoggerFactory.getLogger(PlantUmlComponentDiagram)

	@Inject World world
	@Inject TemplateBuilder templateBuilder
	@Inject NamingStrategy namingStrategy
	@Inject DiagramUtil diagramUtil
	@Inject StringUtil stringUtil

	public def Template getTemplate(Project p) {
		LOG.debug('Generate template PlantUmlDot')

		templateBuilder //
		.project(p) //
		.fileName(p.name + '-component-uml') //
		.fileType(FileType.DOT) //
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
//		world.architecture?.artifacts?.filter(Jar).forEach [
//			val jar = it as Jar
//			val jarName = jar?.name
//			jar => []
//		]
//		world.architecture?.artifacts?.filter(GrpcJar).forEach [
//			val jar = it as GrpcJar
//			val jarName = jar?.name
//			jar => [
//				protoFile
//			]
//		]
		world.architecture?.artifacts?.filter(Artifact)?.forEach [
			val service = it as Artifact
			val serviceName = service?.name
			service => [
				val serviceNameClean = stringUtil.clean(serviceName)
				services.add('''node "«service.type»: «serviceName»" {''')
				services.add('''	component "«serviceName»" as «serviceNameClean»''')
				exposes?.filter(Expose)?.forEach [
					var color = diagramUtil.umlColorRest
					if (it.draft) {
						color = diagramUtil.umlColorDraft
					}
					services.add('''	interface "«it.name» «it.port»" as «stringUtil.clean(it.name)» «color»''')
					services.add('''	[«»] -[«color»]-> () «stringUtil.clean(it.name)» : exposes''')
				]
				exposes?.filter(Expose)?.forEach [
					var color = diagramUtil.umlColorGrpc
					if (it.draft) {
						color = diagramUtil.umlColorDraft
					}
					services.add('''	interface "«it.name» «it.port»" as «stringUtil.clean(it.name)» «color»''')
					services.add('''	[«serviceNameClean»] -[«color»]-> () «it.name» : exposes''')
				]
//				dependencies?.forEach [
//					var String label = it?.target?.name + '.jar'
//					if (it.target === null) {
//						label = it?.name + '.jar'
//					}
//					services.
//						add('''	rectangle "«label»" <<$dependency>> as «serviceNameClean»«stringUtil.clean(label)» «diagramUtil.umlColorJar»''');
//					services.
//						add('''	[«serviceNameClean»] -[«diagramUtil.umlColorJar»]-> «serviceNameClean»«stringUtil.clean(label)» : uses''')
//				]
				services.add('}')
				services.add(' ')
				consumes?.filter[c|c.endpointType === EndpointType.REST]?.forEach [
					services.
						add('''[«serviceNameClean»] -[«diagramUtil.umlColorRest»]-> () «stringUtil.clean(it.endpoint)» : consumes«stringUtil.formatted(it.endpoint)»''')
				]
				consumes?.filter[c|c.endpointType === EndpointType.GRPC]?.forEach [
					services.
						add('''[«serviceNameClean»] -[«diagramUtil.umlColorGrpc»]-> () «stringUtil.clean(it.endpoint)» : consumes«stringUtil.formatted(it.endpoint)»''')
				]
				services.add(' ')
			]
		]

		services.add('@enduml')
		services.join(System.getProperty('line.separator'))
	}
}
