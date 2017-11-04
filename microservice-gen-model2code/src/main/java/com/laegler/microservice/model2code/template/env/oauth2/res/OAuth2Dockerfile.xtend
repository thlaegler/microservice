package com.laegler.microservice.model2code.template.env.oauth2.res

import com.laegler.microservice.adapter.model.FileType
import com.laegler.microservice.adapter.model.Project
import com.laegler.microservice.adapter.model.Template
import com.laegler.microservice.adapter.model.World
import javax.inject.Inject
import javax.inject.Named
import org.slf4j.Logger
import org.slf4j.LoggerFactory

@Named
class OAuth2Dockerfile {
	
	static final Logger LOG = LoggerFactory.getLogger(OAuth2Dockerfile)

	@Inject World world

	public def Template getTemplate(Project p) {
		LOG.debug('  Generating template: {}/Dockerfile', '/')
		
		Template::builder //
		.project(p) //
		.fileName('Dockerfile') //
		.fileType(FileType.UNDEFINED) //
		.relativPath('/') //
		.documentation('Dockerfile') //
		.skipStamping(true) //
		.content('''
			FROM ubuntu
			
			LABEL maintainer "«world.vendor»"
			LABEL package "«p.basePackage»"
			LABEL namespace "«world.name»-«p.name»"
			LABEL version "«p.version»"
			    
			EXPOSE 8080
			EXPOSE 7070
			EXPOSE 6060
			
			#RUN apt-get update && apt-get install -y curl
			
			ADD «p.name».jar /app.jar
			RUN sh -c 'touch /app.jar'
			
			#Could be overridden by kubernetes manifest spec.template.spec.containers[].cmd
			ENTRYPOINT ["java","-jar","/app.jar"]
			
		''') //
		.build
	}
}
