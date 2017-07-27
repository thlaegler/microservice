package com.laegler.microservice.model2code.template

import com.laegler.microservice.adapter.model.FileType
import com.laegler.microservice.adapter.model.Project
import com.laegler.microservice.adapter.model.Template
import com.laegler.microservice.adapter.model.TemplateBuilder
import com.laegler.microservice.model.Architecture
import javax.inject.Inject
import javax.inject.Named
import org.slf4j.Logger
import org.slf4j.LoggerFactory
import com.laegler.microservice.adapter.model.World

@Named
class DockerComposeYaml {

	protected static final Logger log = LoggerFactory.getLogger(RootPomXml)

	@Inject World world
	@Inject TemplateBuilder templateBuilder

	public def Template getTemplate(Project p) {
		log.debug('  Generating template pom.xml')

		templateBuilder //
		.project(p) //
		.fileName('docker-compose') //
		.fileType(FileType.YAML) //
		.content('''
			version: '3'
			services:
			  «FOR a : (p.microserviceModel as Architecture).artifacts»
			  	«a.name»:
			  	  image: «a.name»:«p.version»
			  	  container_name: «a.name»
			  	  hostname: «a.name»
			  	  command: java -Dspring.active.profiles=test -Dit.test.host=http://«a.name»:8080 -jar app.jar
			  	  ports:
			  	  - 8080:8080
			  	  - 7070:7070
			  	  environment:
			  	  - TEST_HOST="http://«a.name»:8080"
			  	  links:
			  	  - «world.name»-mysql
			  	  - «world.name»-redis
			  	  - «world.name»-elasticsearch
			  	  networks:
			  	  - «world.name»
			  «ENDFOR»
			  mysql:
			    image: «world.name»-mysql:«p.version»
			    container_name: «world.name»-mysql
			    hostname: «world.name»-mysql
			    ports:
			    - 3306:3306
			    networks:
			    -  «world.name»
			  redis:
			    image: «world.name»-redis:«p.version»
			    container_name: «world.name»-redis
			    hostname: «world.name»-redis
			    ports:
			    - 6379:6379
			    networks:
			    -  «world.name»
			  elasticsearch:
			    image: «world.name»-elasticsearch:0.0.1-SNAPSHOT
			    container_name: «world.name»-elasticsearch
			    hostname: «world.name»-elasticsearch
			    ports:
			    - 9200:9200
			    - 9300:9300
			    environment:
			    - cluster.name=«world.name»-cluster
			    - bootstrap.memory_lock=true
			    - ES_JAVA_OPTS=-Xms512m -Xmx512m
			    volumes:
			    - esdata:/usr/share/elasticsearch/data
			    networks:
			    -  «world.name»
			volumes:
			  esdata:
			    driver: local
			networks:
			  microservice: null
		''') //
		.build //
	}

}
