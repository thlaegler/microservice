package com.laegler.microservice.model2code.template.microservice.model.src.repo.elasticsearch

import com.laegler.microservice.adapter.model.FileType
import com.laegler.microservice.adapter.model.Project
import com.laegler.microservice.adapter.model.Template
import com.laegler.microservice.adapter.model.Xtend
import com.laegler.microservice.model.Entity
import javax.inject.Named
import org.slf4j.Logger
import org.slf4j.LoggerFactory
import com.laegler.microservice.adapter.util.NamingStrategy
import javax.inject.Inject
import com.laegler.microservice.adapter.model.Java

@Named
class EsRepoJava extends Java {

	protected static final Logger log = LoggerFactory.getLogger(EsRepoJava)

	@Inject protected extension NamingStrategy _name

	Entity e

	public def Template getTemplate(Project project, Entity e) {
		val path = project.srcPathWithPackage + '/repo/elasticsearch'
		log.debug('  Generate template {}/{}.java', path, e.name.camelUp)

		this.e = e

		templateBuilder //
		.project(project) //
		.fileName(e?.name?.toFirstUpper + 'EsRepo') //
		.relativPath(path) //
		.documentation('''Elasticsearch Repository «e.name.camelUp»''') //
		.skipStamping(true) //
		.content('''
			package «project.basePackage».repo.elasticsearch;
			
			import «project.basePackage».*
			import org.springframework.data.domain.Page;
			import org.springframework.data.domain.Pageable;
			import org.springframework.data.domain.Slice;
			import org.springframework.stereotype.Repository;
			import java.util.stream.Stream;
			«project.javaDocType»
			@Repository
			public interface «getCamelUp(e.name,true)»EsRepo extends NumberKeyedRepository<«e.name.camelUp», Long> {
			
			}
		''') //
		.build
	}

}
