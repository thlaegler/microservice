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

@Named
class RedisRepoImplJava extends Java {

	protected static final Logger log = LoggerFactory.getLogger(RedisRepoImplJava)

	@Inject protected extension NamingStrategy _name

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
			@Repository
			public class «getCamelUp(e.name,true)»RedisRepoImpl implements «getCamelUp(e.name,true)»RedisRepo {

				private static final Logger LOG = LoggerFactory.getLogger(«e.name.camelUp»RedisRepo.class);
				
				private static final String KEY = "«e.name.camelUp»";
				
				@Autowired
				private RedisTemplate<String, «e.name.camelUp»> redisTemplate;
			
				private HashOperations hashOps;
				
				@PostConstruct
				private void init() {
					hashOps = redisTemplate.opsForHash();
				}
			
				@Override
				public void save(«e.name.camelUp» «e.name.camelLow») {
					hashOps.put(KEY, «e.name.camelLow».getId(), «e.name.camelLow»);
				}
			
				@Override
				public «e.name.camelUp» findOne(long id) {
					return («e.name.camelUp») hashOps.get(KEY, id);
				}
			
				@Override
				public Map<Object, «e.name.camelUp»> findAll() {
					return hashOps.entries(KEY);
				}
			
				@Override
				public void delete(long id) {
					hashOps.delete(KEY, id);
				}
			
				@Override
				public Page<«e.name.camelUp»> findAllPaged(Pageable pageable) {
					// TODO Auto-generated method stub
					return null;
				}
			
				@Override
				public Slice<«e.name.camelUp»> findAllSliced(Pageable pageable) {
					// TODO Auto-generated method stub
					return null;
				}
			
				@Override
				public Stream<«e.name.camelUp»> findAllStreamed() {
					// TODO Auto-generated method stub
					return null;
				}
			
			}
		''') //
		.build
	}

}
