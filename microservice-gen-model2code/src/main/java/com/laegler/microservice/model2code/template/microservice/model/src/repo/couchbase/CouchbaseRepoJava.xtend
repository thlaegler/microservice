package com.laegler.microservice.model2code.template.microservice.model.src.repo.couchbase

import com.laegler.microservice.adapter.model.Java
import com.laegler.microservice.adapter.model.Project
import com.laegler.microservice.adapter.model.Template
import com.laegler.microservice.adapter.util.JavaUtil
import com.laegler.microservice.adapter.util.NamingStrategy
import com.laegler.microservice.model.Entity
import javax.inject.Inject
import javax.inject.Named
import org.slf4j.Logger
import org.slf4j.LoggerFactory

@Named
class CouchbaseRepoJava extends Java {

	private static final Logger log = LoggerFactory.getLogger(CouchbaseRepoJava)

	@Inject private extension NamingStrategy _name
	@Inject private extension JavaUtil _java

	Entity e

	public def Template getTemplate(Project p, Entity e) {
		val path = p.srcPathWithPackage + '/repo/jpa'
		log.debug('  Generate template {}/{}.java', path, e.name.camelUp)

		this.e = e

		templateBuilder //
		.project(p) //
		.fileName(e?.name?.toFirstUpper + 'JpaRepository') //
		.relativPath(path) //
		.documentation('''JPA Repository «e.name.camelUp»''') //
		.skipStamping(true) //
		.content('''
			package «p.basePackage».repo.jpa;
			
			import «p.basePackage».*
			import org.springframework.data.domain.Page;
			import org.springframework.data.domain.Pageable;
			import org.springframework.data.domain.Slice;
			import org.springframework.data.jpa.repository.JpaRepository;
			import org.springframework.data.jpa.repository.Query;
			import org.springframework.stereotype.Repository;
			import java.util.stream.Stream;
			«p.javaDocType»
			@Repository
			public interface «getCamelUp(e.name,true)»JpaRepo extends JpaRepository<«e.name.camelUp», Long> {
			
				@Query("SELECT x FROM «e.name.camelUp» x")
				public Page<«e.name.camelUp»> findAllPaged(Pageable pageable);
			
				@Query("SELECT x FROM «e.name.camelUp» x ")
				public Slice<«e.name.camelUp»> findAllSliced(Pageable pageable);
			
				@Query("SELECT x FROM «e.name.camelUp» x")
				public Stream<«e.name.camelUp»> findAllStreamed();
			
			}
		''') //
		.build
	}

}
