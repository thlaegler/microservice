package com.laegler.microservice.model2code.template.microservice.model.src.repo.redis

import com.laegler.microservice.adapter.model.Java
import com.laegler.microservice.adapter.model.Project
import com.laegler.microservice.adapter.model.Template
import com.laegler.microservice.adapter.util.NamingStrategy
import com.laegler.microservice.model.Entity
import javax.inject.Inject
import javax.inject.Named
import org.slf4j.Logger
import org.slf4j.LoggerFactory
import com.laegler.microservice.adapter.util.JavaUtil

@Named
class RedisRepoJava extends Java {

	protected static final Logger log = LoggerFactory.getLogger(RedisRepoJava)

	@Inject private extension NamingStrategy _name
	@Inject private extension JavaUtil _java

	Entity e

	public def Template getTemplate(Project project, Entity e) {
		val path = project.srcPathWithPackage + '/repo/redis'
		log.debug('  Generate template {}/{}.java', path, e.name.camelUp)

		this.e = e

		templateBuilder //
		.project(project) //
		.fileName(e?.name?.toFirstUpper + 'RedisRepository') //
		.relativPath(path) //
		.documentation('''Redis Repository «e.name.camelUp»''') //
		.skipStamping(true) //
		.content('''
			package «project.basePackage».repo.redis;
			
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
			public class «e.name.camelUp»RedisRepo {
			
				public void save(«e.name.camelUp» «e.name.camelLow»);
			
				public User findOne(long id);
			
				public Map<Object, «e.name.camelUp»> findAll();
			
				public void delete(long id);
			
				@Query("SELECT x FROM «e.name.camelUp» x")
				public Page<«e.name.camelUp»> findAllPaged(Pageable pageable);
			
				@Query("SELECT x FROM «e.name.camelUp» x")
				public Slice<«e.name.camelUp»> findAllSliced(Pageable pageable);
			
				@Query("SELECT x FROM «e.name.camelUp» x")
				public Stream<«e.name.camelUp»> findAllStreamed();
			
			}
		''') //
		.build
	}

}
