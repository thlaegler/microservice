package com.laegler.microservice.codegen.template.parent.docs

import com.laegler.microservice.codegen.model.Project
import java.util.ArrayList
import microserviceModel.Architecture
import microserviceModel.GrpcConsume
import microserviceModel.GrpcExpose
import microserviceModel.GrpcJar
import microserviceModel.Jar
import microserviceModel.RestConsume
import microserviceModel.RestExpose
import microserviceModel.Spring
import com.laegler.microservice.codegen.template.base.AbstractDocuTemplate
import com.laegler.microservice.codegen.model.FileType

class PlantUmlTemplate extends AbstractDocuTemplate {

	new(Project project) {
		super(project)
		fileName = 'architecture.plantuml'
		fileType = FileType.UNDEFINED
		
		content = template(project.microserviceModel as Architecture)
	}
	
	protected def String template(Architecture model) {
		val services = new ArrayList<String>()
		services.add('@startuml')
		services.add('skinparam componentStyle uml2')
		services.add(
			'''skinparam interface {
			backgroundColor RosyBrown
			borderColor orange}'''
		)
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
		model?.artifacts?.filter(Jar).forEach [
			val jar = it as Jar
			val jarName = jar?.name
			jar => []
		]
		model?.artifacts?.filter(GrpcJar).forEach [
			val jar = it as GrpcJar
			val jarName = jar?.name
			jar => [
				protoFile
			]
		]
		model?.artifacts?.filter(Spring).forEach [
			val service = it as Spring
			val serviceName = service?.name
			service => [
				services.add('''node "«service?.type?.literal»: «serviceName»" {''')
				services.add('''	component "«serviceName»" as «serviceName.clean»''')
				exposes?.filter(RestExpose).forEach [
					var color = umlColorRest
					if (it.draft) {
						color = umlColorDraft
					}
					services.add('''	interface "«it?.name» «it?.port»" as «it?.name.clean» «color»''')
					services.add('''	[«serviceName.clean»] -[«color»]-> () «it?.name.clean» : exposes''')
				]
				exposes?.filter(GrpcExpose).forEach [
					var color = umlColorGrpc
					if (it.draft) {
						color = umlColorDraft
					}
					services.add('''	interface "«it?.name» «it.port»" as «it?.name.clean» «color»''')
					services.add('''	[«serviceName.clean»] -[«color»]-> () «it?.name» : exposes''')
				]
				dependencies?.forEach [
					var String label = it?.target?.name + '.jar'
					if (it.target == null) {
						label = it?.name + '.jar'
					}
					services.
						add('''	rectangle "«label»" <<$dependency>> as «service?.name.clean»«label.clean» «umlColorJar»''');
					services.
						add('''	[«serviceName.clean»] -[«umlColorJar»]-> «service?.name.clean»«label.clean» : uses''')
				]
				services.add('}')
				services.add(' ')
				consumes?.filter(RestConsume).forEach [
					services.
						add('''[«serviceName.clean»] -[«umlColorRest»]-> () «it?.target?.name?.clean» : consumes«it?.description.formatted»''')
				]
				consumes?.filter(GrpcConsume).forEach [
					services.
						add('''[«serviceName.clean»] -[«umlColorGrpc»]-> () «it?.target?.name?.clean» : consumes«it?.description.formatted»''')
				]
				services.add(' ')
			]
		]
		services.add('@enduml')
		services.join(System.getProperty('line.separator'))
	}
}
