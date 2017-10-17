package com.laegler.microservice.model2code.template.microservice.model.src

import com.laegler.microservice.adapter.model.Java
import com.laegler.microservice.adapter.model.Project
import com.laegler.microservice.adapter.model.Template
import com.laegler.microservice.adapter.util.NamingStrategy
import com.laegler.microservice.model.Entity
import java.util.Map.Entry
import java.util.Random
import javax.inject.Inject
import javax.inject.Named
import org.slf4j.Logger
import org.slf4j.LoggerFactory
import com.laegler.microservice.adapter.util.JavaUtil

@Named
class EntityJava extends Java {

	private static final Logger log = LoggerFactory.getLogger(EntityJava)

	@Inject private extension NamingStrategy _name
	@Inject private extension JavaUtil _java

	Entity e

	public def Template getTemplate(Project p, Entity e) {
		val path = p.srcPathWithPackage + '/entity'
		log.debug('  Generate template {}/{}.java', path, e.name)

		this.e = e

		templateBuilder //
		.project(p) //
		.fileName(e.name.camelUp) //
		.relativPath(path) //
		.documentation('Java Entity of ' + e.name.camelUp) //
		.skipStamping(true) //
		.content('''
			package «p.basePackage».entity;
			
			import «p.basePackage».*;
			import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
			import io.swagger.annotations.ApiModel;
			import io.swagger.annotations.ApiModelProperty;
			import lombok.AllArgsConstructor;
			import lombok.Builder;
			import lombok.Data;
			import lombok.NoArgsConstructor;
			import org.springframework.data.elasticsearch.annotations.Document;
			import org.springframework.data.elasticsearch.annotations.Field;
			import org.springframework.data.elasticsearch.annotations.FieldType;
			import org.springframework.data.elasticsearch.annotations.Setting;
			import org.springframework.data.keyvalue.annotation.KeySpace;
			import org.springframework.data.redis.core.RedisHash;
			import javax.xml.bind.annotation.XmlElement;
			import javax.xml.bind.annotation.XmlRootElement;
			import org.hibernate.annotations.Cache;
			import java.io.Serializable;
			import javax.persistence.Column;
			import javax.persistence.Entity;
			import javax.persistence.GeneratedValue;
			import javax.persistence.GenerationType;
			import javax.persistence.Id;
			import javax.persistence.Table;
			«p.javaDocType»
			@ApiModel
			@JsonIgnoreProperties(ignoreUnknown = true)
			@Data
			@Builder
			@RedisHash
			@NoArgsConstructor
			@AllArgsConstructor
			@KeySpace
			@Document(indexName = "«e.name.camelLow»index", type = "«e.name.camelUp»")
			@Setting(settingPath = "/elasticsearch/«e.name.camelLow»index-settings.yml")
			@Entity
			@Table(name = "«getCamelLow(e.name,true)»")
			@Accessors
			@XmlRootElement
			@JsonProperty
			@Cache
			public class «e.name.camelUp» implements Serializable {
			
				private static final long serialVersionUID = «randomLong»;
			
				«FOR Entry<String, String> field : e?.fields?.entrySet»
					/**
					 * «field.value»
					 */
					@Since(«p.version»)
					@Until(0.0)
					@ApiModelProperty(example = "1234")
					@JsonProperty('«field.value.toFirstLower»')
					@Field(type = FieldType.«field.key», store = true)
					@XmlElement
					@Expose(serialize=true, deserialize=true)
					«IF (field.key.contains('Integer') || field.key.contains('int') || field.key.contains('Long') || field.key.contains('long')) && (field.value.contains('id') || field.value.contains('ID') || field.value.contains('Id'))»
						@Id
						@GeneratedValue(strategy = GenerationType.AUTO)
					«ENDIF»
					@Column(name='«field.value»')
					private «field.key.camelUp» «field.key.camelLow»;
					
				«ENDFOR»
				
			}
		''') //
		.build
	}

	def long getRandomLong() {
		// error checking and 2^x checking removed for simplicity.
		var Random rng = new Random
		rng.nextLong
	}

}
