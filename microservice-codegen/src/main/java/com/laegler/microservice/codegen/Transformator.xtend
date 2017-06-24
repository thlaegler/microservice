package com.laegler.microservice.codegen
//
//import java.util.ArrayList
//import com.laegler.microservice.modeler.architectureLang.GrpcConsume
//import com.laegler.microservice.modeler.architectureLang.GrpcExpose
//import com.laegler.microservice.modeler.architectureLang.Architecture
//import com.laegler.microservice.modeler.architectureLang.RestConsume
//import com.laegler.microservice.modeler.architectureLang.RestExpose
//import com.laegler.microservice.modeler.architectureLang.Spring
//
class Transformator {
}
//	val String dotColorRest = 'firebrick'
//	val String dotColorGrpc = 'dodgerblue'
//	val String dotColorJar = 'grey'
//	val String dotColorDraft = 'lightgrey'
//
//	val String umlColorRest = '#Red'
//	val String umlColorGrpc = '#Blue'
//	val String umlColorJar = '#Grey'
//	val String umlColorDraft = '#Lightgrey'
//
//	def String getDotComponentDiagram(Architecture model) {
//		val services = new ArrayList<String>()
//		services.add("digraph Microservices {");
//		services.add(' ');
//
//		model.artifacts.filter(Spring).forEach [
//			val service = it as Spring
//			service => [
//				services.add('''	subgraph "cluster_«service.name»" {''')
//				services.add('''		color=black;''')
//				services.add('''		shape=box;''')
//				services.add('''		label = "«service.type.literal»: «service.name»";''')
//				services.add('''		"«service.name»" [label="«service.name»", shape=box];''')
//				exposes.filter(RestExpose).forEach [
//					var color = dotColorRest
//					if (it.draft) {
//						color = dotColorDraft
//					}
//					services.
//						add('''		"REST: «it.name»" [label="REST: «it.name» \n «it.port»", style=filled, color=«color», fontname=arial, fontsize=8];''')
//					services.
//						add('''		"REST: «it.name»" -> "«service.name»" [label="exposes", arrowhead=dot, color=«color», fontname=arial, fontsize=8];''')
//				]
//				exposes.filter(GrpcExpose).forEach [
//					var color = dotColorGrpc
//					if (it.draft) {
//						color = dotColorDraft
//					}
//					services.
//						add('''		"GRPC: «it.name»" [label="GRPC: «it.name» \n «it.port»", style=filled, color=«color», fontname=arial, fontsize=8];''')
//					services.
//						add('''		"GRPC: «it.name»" -> "«service.name»" [label="exposes", arrowhead=dot, color=«color», fontname=arial, fontsize=8];''')
//				]
//				uses.forEach [
//					var String label = it?.dependencyTarget?.name
//					if (it.dependencyTarget == null) {
//						label = it?.dependencyName
//					}
//					services.
//						add('''		"«service.name»«label».jar" [label="«label».jar", shape=box, style=filled, fontname=arial, fontsize=8, color=«dotColorJar»];''');
//					services.
//						add('''		"«service.name»" -> "«service.name»«label».jar" [label="uses JAR", color=«dotColorJar», fontname=arial, fontsize=8];''')
//				]
//				services.add('''	}''')
//
//				consumes.filter(RestConsume).forEach [
//					services.
//						add('''	"«service.name»" -> "REST: «it.target.name»" [label="consumes«it.description.formatted»", color=«dotColorRest», fontname=arial, fontsize=8];''')
//				]
//				consumes.filter(GrpcConsume).forEach [
//					services.
//						add('''	"«service.name»" -> "GRPC: «it.target.name»" [label="consumes«it.description.formatted»", color=«dotColorGrpc», fontname=arial, fontsize=8];''')
//				]
//			]
//		]
//
//		services.add(' ');
//		services.add("}");
//		services.join(System.getProperty('line.separator'))
//	}
//
//	def String getPlantumlComponentDiagram(Architecture model) {
//		val services = new ArrayList<String>()
//		services.add('@startuml')
//		services.add('skinparam componentStyle uml2')
//		services.add(
//			'''skinparam interface {
//			backgroundColor RosyBrown
//			borderColor orange}'''
//		)
//		services.add(
//			'''
//			sprite $dependency [16x16/16] {
//				FFFFFFFFFFFFFFFF
//				FFFFFFFFFFFFFFFF
//				FFFFFFFFFFFFFFFF
//				FFFFFFFFFFFFFFFF
//				FFFFFFFFFF0FFFFF
//				FFFFFFFFFF00FFFF
//				FF00000000000FFF
//				FF000000000000FF
//				FF00000000000FFF
//				FFFFFFFFFF00FFFF
//				FFFFFFFFFF0FFFFF
//				FFFFFFFFFFFFFFFF
//				FFFFFFFFFFFFFFFF
//				FFFFFFFFFFFFFFFF
//				FFFFFFFFFFFFFFFF
//				FFFFFFFFFFFFFFFF
//			}'''
//		)
//		services.add(' ')
//		model?.artifacts?.filter(Spring).forEach [
//			val service = it as Spring
//			val serviceName = service?.name
//			service => [
//				services.add('''node "«service?.type?.literal»: «serviceName»" {''')
//				services.add('''	component "«serviceName»" as «serviceName.clean»''')
//				exposes?.filter(RestExpose).forEach [
//					var color = umlColorRest
//					if (it.draft) {
//						color = umlColorDraft
//					}
//					services.add('''	interface "«it?.name»" as «it?.name.clean» «color»''')
//					services.add('''	[«serviceName.clean»] -[«color»]-> () «it?.name.clean» : exposes''')
//				]
//				exposes?.filter(GrpcExpose).forEach [
//					var color = umlColorGrpc
//					if (it.draft) {
//						color = umlColorDraft
//					}
//					services.add('''	interface "«it?.name»" as «it?.name.clean» «color»''')
//					services.add('''	[«serviceName.clean»] -[«color»]-> () «it?.name» : exposes''')
//				]
//				uses?.forEach [
//					var String label = it?.dependencyTarget?.name+'.jar'
//					if (it.dependencyTarget == null) {
//						label = it?.dependencyName+'.jar'
//					}
//					services.
//						add('''	rectangle "«label»" <<$dependency>> as «service?.name.clean»«label.clean» «umlColorJar»''');
//					services.add('''	[«serviceName.clean»] -[«umlColorJar»]-> «service?.name.clean»«label.clean» : uses''')
//				]
//				services.add('}')
//				services.add(' ')
//				consumes?.filter(RestConsume).forEach [
//					services.
//						add('''[«serviceName.clean»] -[«umlColorRest»]-> () «it?.target?.name?.clean» : consumes«it?.description.formatted»''')
//				]
//				consumes?.filter(GrpcConsume).forEach [
//					services.
//						add('''[«serviceName.clean»] -[«umlColorGrpc»]-> () «it?.target?.name?.clean» : consumes«it?.description.formatted»''')
//				]
//				services.add(' ')
//			]
//		]
//		services.add('@enduml')
//		services.join(System.getProperty('line.separator'))
//	}
//
//	def String getDeploymentList(Spring spring) '''
//		«spring?.name»
//		«FOR consume : spring?.consumes»
//			«IF consume instanceof RestConsume»
//				«consume?.target?.name»
//			«ENDIF»
//			«IF consume instanceof GrpcConsume»
//				«consume?.target?.name»
//			«ENDIF»
//		«ENDFOR»
//		«FOR use : spring?.uses»
//			«use?.dependencyTarget?.name»
//		«ENDFOR»
//	'''
//
//	def String getFormatted(String description) {
//		if (description.nullOrEmpty) {
//			return ''
//		} else {
//			return ''' («description»)'''
//		}
//	}
//
//	def String clean(String identifier) {
//		return identifier?.replaceAll('[^a-zA-Z0-9]', '')
//	}
//}
