package com.laegler.microservice.model2code.template.microservice.model.src.repo.jpa

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
class JpaRepoJava extends Java {

	protected static final Logger log = LoggerFactory.getLogger(JpaRepoJava)

	@Inject protected extension NamingStrategy _name

	Entity e

	public def Template getTemplate(Project project, Entity e) {
		val path = project.srcPathWithPackage + '/repo/jpa'
		log.debug('  Generate template {}/{}.java', path, e.name.camelUp)

		this.e = e

		templateBuilder //
		.project(project) //
		.fileName(e?.name?.toFirstUpper + 'JpaRepository') //
		.relativPath(path) //
		.documentation('''JPA Repository «e.name.camelUp»''')//
		.skipStamping(true) //
		.content('''
			package «project.basePackage».repo.jpa;
			
			import «project.basePackage».*
			import org.springframework.data.domain.Page;
			import org.springframework.data.domain.Pageable;
			import org.springframework.data.domain.Slice;
			import org.springframework.data.jpa.repository.JpaRepository;
			import org.springframework.data.jpa.repository.Query;
			import org.springframework.stereotype.Repository;
			import java.util.stream.Stream;
			«project.javaDocType»
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
