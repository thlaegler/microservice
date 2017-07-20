package com.laegler.microservice.model2code.template.microservice.grpc.res

import com.laegler.microservice.adapter.model.FileType
import com.laegler.microservice.adapter.model.Project
import com.laegler.microservice.adapter.model.Template
import com.laegler.microservice.adapter.model.TemplateBuilder
import com.laegler.microservice.adapter.model.World
import com.laegler.microservice.adapter.util.NamingStrategy
import com.laegler.microservice.model.Artifact
import com.laegler.microservice.model.Entity
import java.util.Map.Entry
import javax.inject.Inject
import javax.inject.Named

@Named
class GrpcProto {

	@Inject protected World world
	@Inject protected TemplateBuilder templateBuilder
	@Inject protected NamingStrategy namingStrategy

	public def Template getTemplate(Project p, Artifact a) {
		templateBuilder //
		.project(p) //
		.fileName(a.name.toLowerCase) //
		.fileType(FileType.PROTO) //
		.relativPath(namingStrategy.resPath) //
		.documentation('gRPC ProtoBuf file') //
		.skipStamping(true) //
		.content('''
			syntax = "proto3";
			
			package «p.basePackage».«a.name.toLowerCase».grpc;
			
			option java_multiple_files = true;
			option java_outer_classname = «a.name.toFirstUpper»GrpcProtoService;
			
			«FOR Entity e : a.entities»
				service «e.name.toFirstUpper»GrpcService {
					rpc GetAll«a.name.toFirstUpper»s (GetAll«e.name.toFirstUpper»sRequest) returns (GetAll«e.name.toFirstUpper»sResponse) {
					}
				}
				
				message GetAll«e.name.toFirstUpper»sRequest {
					int64 id = 1;
				}
				
				message GetAll«e.name.toFirstUpper»sResponse {
					repeated «e.name.toFirstUpper» «e.name.toLowerCase»s = 1;
				}
				
				message «e.name.toFirstUpper» {
				«var int idx = 1»
				«FOR Entry<String, String> es : e?.fields?.entrySet»
					«es?.value?.toLowerCase» «es?.key?.toLowerCase» = «idx»;
					«idx++»
				«ENDFOR»
				}
			«ENDFOR»
		''') //
		.build
	}
}
