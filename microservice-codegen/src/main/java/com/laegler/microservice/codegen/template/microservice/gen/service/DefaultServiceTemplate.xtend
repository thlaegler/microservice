package com.laegler.microservice.codegen.template.microservice.gen.service

import com.laegler.microservice.codegen.model.Project
import com.laegler.microservice.codegen.template.base.AbstractXtendTemplate
import com.laegler.microservice.model.microserviceModel.Entity

/**
 * File Generator for Spring REST controller for managing entity
 */
class DefaultServiceTemplate extends AbstractXtendTemplate {

	private Entity entity

	new(Project project, Entity entity) {
		super(project)
		this.entity = entity
		fileName = '''«entity?.name?.toFirstUpper»Repository'''
		relativPath = '''/src-gen/main/java/«project?.basePackage?.toPath»/repository/'''
		header = '''package «project.basePackage».repository'''
		documentation = '''Custom Service for managing entity «entity?.name?.toFirstUpper»'''

		content = template
	}
	
	override public String getDocumentation() '''The Spring REST controller for managing entity «entity?.name?.toFirstUpper»'''

	override public String getTemplateName() '''«this.class.name»'''

	override public String getFileName() '''«entity?.name?.toFirstUpper»Service'''
	
	def public String getTemplate() '''
		package «model.getOption('packageName')».service
		
		import com.google.gson.annotations.Until
		import com.codahale.metrics.annotation.Timed
		import «model.getOption('packageName')».model.entity.«entity?.name?.toFirstUpper»
		
		import «model.getOption('packageName')».persistence.repository.«entity?.name?.toFirstUpper»Repository
		import «model.getOption('packageName')».rest.util.HeaderUtil
		import «model.getOption('packageName')».rest.util.PaginationUtil
		import «model.getOption('packageName')».persistence.dto.«entity?.name?.toFirstUpper»DTO
		import «model.getOption('packageName')».persistence.mapper.«entity?.name?.toFirstUpper»Mapper
		import org.slf4j.Logger
		«IF 'spring' != 'spring'»
			import com.codahale.metrics.annotation.Timed
			import org.springframework.data.domain.Page
			import org.springframework.data.domain.Pageable
			import org.springframework.http.HttpHeaders
			import org.springframework.http.HttpStatus
			import org.springframework.http.MediaType
			import org.springframework.http.ResponseEntity
			import org.springframework.web.bind.annotation.*
		«ELSE»
			import javax.ws.rs.POST
			import javax.ws.rs.PUT
			import javax.ws.rs.GET
			import javax.ws.rs.DELETE
			import javax.ws.rs.Path
			import javax.ws.rs.Produces
			import javax.ws.rs.core.MediaType
		«ENDIF»
		
		import javax.inject.Inject
		import java.net.URI
		import java.net.URISyntaxException
		import java.util.LinkedList
		import java.util.List
		import java.util.Optional
		import java.util.stream.Collectors
		
		«javaDocType»
		«IF 'spring' != 'spring'»
			@RestController
			@RequestMapping('/api')
		«ENDIF»
		public class «fileName» {
		
			@Inject
			Logger log
				
			@Inject
			«entity?.name?.toFirstUpper»Repository «entity?.name?.toFirstLower»Repository
		
			@Inject
			«entity?.name?.toFirstUpper»Mapper «entity?.name?.toFirstLower»Mapper
		
			/**
			 * POST  /«entity?.name?.toFirstLower»s : Create a new «entity?.name?.toFirstLower».
			 *
			 * @param «entity?.name?.toFirstLower»DTO the «entity?.name?.toFirstLower»DTO to create
			 * @return the ResponseEntity with status 201 (Created) and with body the new «entity?.name?.toFirstLower»DTO, or with status 400 (Bad Request) if the «entity?.name?.toFirstLower» has already an ID
			 * @throws URISyntaxException if the Location URI syntax is incorrect
			 */
			«IF 'spring' != 'spring'»
				@RequestMapping(value = '/«entity?.name?.toFirstLower»s',
					method = RequestMethod.POST,
					produces = MediaType.APPLICATION_JSON_VALUE)
				@Timed
			«ELSE»
				@POST
				@Path('/«entity?.name?.toFirstLower»s')
				@Produces(MediaType.APPLICATION_JSON)
			«ENDIF»
			public def ResponseEntity<«entity?.name?.toFirstUpper»DTO> create«entity?.name?.toFirstUpper»(@RequestBody «entity?.name?.toFirstUpper»DTO «entity?.name?.toFirstLower»DTO) throws URISyntaxException {
				log.debug('REST request to save «entity?.name?.toFirstUpper» : {}', «entity?.name?.toFirstLower»DTO)
				if («entity?.name?.toFirstLower»DTO.id != null) {
					return ResponseEntity.badRequest().headers(HeaderUtil.createFailureAlert('«entity?.name?.toFirstLower»', 'idexists', 'A new «entity?.name?.toFirstLower» cannot already have an ID')).body(null)
				}
				var «entity?.name?.toFirstUpper» «entity?.name?.toFirstLower» = «entity?.name?.toFirstLower»Mapper.«entity?.name?.toFirstLower»DTOTo«entity?.name?.toFirstUpper»(«entity?.name?.toFirstLower»DTO)
				«entity?.name?.toFirstLower» = «entity?.name?.toFirstLower»Repository.save(«entity?.name?.toFirstLower»)
				val «entity?.name?.toFirstUpper»DTO result = «entity?.name?.toFirstLower»Mapper.«entity?.name?.toFirstLower»To«entity?.name?.toFirstUpper»DTO(«entity?.name?.toFirstLower»)
				return ResponseEntity.created(new URI('/api/«entity?.name?.toFirstLower»s/' + result.id))
					.headers(HeaderUtil.createEntityCreationAlert('«entity?.name?.toFirstLower»', result.id.toString))
					.body(result);
			}
		
			/**
			 * PUT  /«entity?.name?.toFirstLower»s : Updates an existing «entity?.name?.toFirstLower».
			 *
			 * @param «entity?.name?.toFirstLower»DTO the «entity?.name?.toFirstLower»DTO to update
			 * @return the ResponseEntity with status 200 (OK) and with body the updated «entity?.name?.toFirstLower»DTO,
			 * or with status 400 (Bad Request) if the «entity?.name?.toFirstLower»DTO is not valid,
			 * or with status 500 (Internal Server Error) if the «entity?.name?.toFirstLower»DTO couldnt be updated
			 * @throws URISyntaxException if the Location URI syntax is incorrect
			 */
			«IF 'spring' != 'spring'»
				@RequestMapping(value = '/«entity?.name?.toFirstLower»s',
					method = RequestMethod.PUT,
					produces = MediaType.APPLICATION_JSON_VALUE)
				@Timed
			«ELSE»
				@PUT
				@Path('/«entity?.name?.toFirstLower»s')
				@Produces(MediaType.APPLICATION_JSON)
			«ENDIF»
			public def ResponseEntity<«entity?.name?.toFirstUpper»DTO> update«entity?.name?.toFirstUpper»(@RequestBody «entity?.name?.toFirstUpper»DTO «entity?.name?.toFirstLower»DTO) throws URISyntaxException {
				log.debug('REST request to update «entity?.name?.toFirstUpper» : {}', «entity?.name?.toFirstLower»DTO)
				if («entity?.name?.toFirstLower»DTO.getId() == null) {
					return create«entity?.name?.toFirstUpper»(«entity?.name?.toFirstLower»DTO);
				}
				var «entity?.name?.toFirstUpper» «entity?.name?.toFirstLower» = «entity?.name?.toFirstLower»Mapper.«entity?.name?.toFirstLower»DTOTo«entity?.name?.toFirstUpper»(«entity?.name?.toFirstLower»DTO);
				«entity?.name?.toFirstLower» = «entity?.name?.toFirstLower»Repository.save(«entity?.name?.toFirstLower»)
				val «entity?.name?.toFirstUpper»DTO result = «entity?.name?.toFirstLower»Mapper.«entity?.name?.toFirstLower»To«entity?.name?.toFirstUpper»DTO(«entity?.name?.toFirstLower»)
				return ResponseEntity.ok
					.headers(HeaderUtil.createEntityUpdateAlert('«entity?.name?.toFirstLower»', «entity?.name?.toFirstLower»DTO.id.toString))
					.body(result)
			}
		
			/**
			 * GET  /«entity?.name?.toFirstLower»s : get all the «entity?.name?.toFirstLower»s.
			 *
			 * @param pageable the pagination information
			 * @return the ResponseEntity with status 200 (OK) and the list of «entity?.name?.toFirstLower»s in body
			 * @throws URISyntaxException if there is an error to generate the pagination HTTP headers
			 */
			«IF 'spring' != 'spring'»
				@RequestMapping(value = '/«entity?.name?.toFirstLower»s',
					method = RequestMethod.GET,
					produces = MediaType.APPLICATION_JSON_VALUE)
				@Timed
			«ELSE»
				@GET
				@Path('/«entity?.name?.toFirstLower»s')
				@Produces(MediaType.APPLICATION_JSON)
			«ENDIF»
			public def ResponseEntity<List<«entity?.name?.toFirstUpper»DTO>> getAll«entity?.name?.toFirstUpper»s(Pageable pageable) throws URISyntaxException {
				log.debug('REST request to get a page of «entity?.name?.toFirstUpper»s')
				
				val Page<«entity?.name?.toFirstUpper»> page = «entity?.name?.toFirstLower»Repository.findAll(pageable)
				val HttpHeaders headers = PaginationUtil.generatePaginationHttpHeaders(page, '/api/«entity?.name?.toFirstLower»s')
				
				new ResponseEntity<>(«entity?.name?.toFirstLower»Mapper.«entity?.name?.toFirstLower»sTo«entity?.name?.toFirstUpper»DTOs(page.content), headers, HttpStatus.OK)
			}
		
			/**
			 * GET  /«entity?.name?.toFirstLower»s/:id : get the 'id' «entity?.name?.toFirstLower».
			 *
			 * @param id the id of the «entity?.name?.toFirstLower»DTO to retrieve
			 * @return the ResponseEntity with status 200 (OK) and with body the «entity?.name?.toFirstLower»DTO, or with status 404 (Not Found)
			 */
			«IF 'spring' != 'spring'»
				@RequestMapping(value = '/«entity?.name?.toFirstLower»s/{id}',
					method = RequestMethod.GET,
					produces = MediaType.APPLICATION_JSON_VALUE)
				@Timed
			«ELSE»
				@GET
				@Path('/«entity?.name?.toFirstLower»s/{id}')
				@Produces(MediaType.APPLICATION_JSON)
			«ENDIF»
			public def ResponseEntity<«entity?.name?.toFirstUpper»DTO> get«entity?.name?.toFirstUpper»(@PathVariable Long id) {
				log.debug('REST request to get «entity?.name?.toFirstUpper» : {}', id);
				
				val «entity?.name?.toFirstUpper» «entity?.name?.toFirstLower» = «entity?.name?.toFirstLower»Repository.findOne(id);
				val «entity?.name?.toFirstUpper»DTO «entity?.name?.toFirstLower»DTO = «entity?.name?.toFirstLower»Mapper.«entity?.name?.toFirstLower»To«entity?.name?.toFirstUpper»DTO(«entity?.name?.toFirstLower»)
				
				Optional.ofNullable(«entity?.name?.toFirstLower»DTO)
					.map(result -> new ResponseEntity<>(
						result,
						HttpStatus.OK))
					.orElse(new ResponseEntity<>(HttpStatus.NOT_FOUND))
			}
		
			/**
			 * DELETE  /«entity?.name?.toFirstLower»s/:id : delete the 'id' «entity?.name?.toFirstLower».
			 *
			 * @param id the id of the «entity?.name?.toFirstLower»DTO to delete
			 * @return the ResponseEntity with status 200 (OK)
			 */
			«IF 'spring' != 'spring'»
				@RequestMapping(value = '/«entity?.name?.toFirstLower»s/{id}',
					method = RequestMethod.DELETE,
					produces = MediaType.APPLICATION_JSON_VALUE)
				@Timed
			«ELSE»
				@DELETE
				@Path('/«entity?.name?.toFirstLower»s')
				@Produces(MediaType.APPLICATION_JSON)
			«ENDIF»
			public def ResponseEntity<Void> delete«entity?.name?.toFirstUpper»(@PathVariable Long id) {
				log.debug('REST request to delete «entity?.name?.toFirstUpper» : {}', id)
				«entity?.name?.toFirstLower»Repository.delete(id)
				return ResponseEntity.ok.headers(HeaderUtil.createEntityDeletionAlert('«entity?.name?.toFirstLower»', id.toString)).build
			}
		
		}
	'''
}
