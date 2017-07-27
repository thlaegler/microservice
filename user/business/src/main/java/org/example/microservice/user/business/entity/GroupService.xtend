package org.example.microservice.entity

import org.example.microservice.*
import java.io.Serializable
import javax.persistence.Id
import javax.persistence.Column
import javax.persistence.Entity
import javax.persistence.GeneratedValue
import javax.persistence.GenerationType
import javax.persistence.Table
import javax.xml.bind.annotation.XmlElement
import javax.xml.bind.annotation.XmlRootElement
import org.eclipse.xtend.lib.annotations.Accessors
import org.hibernate.annotations.Cache
import org.hibernate.annotations.CacheConcurrencyStrategy
import com.google.gson.annotations.Expose
import org.slf4j.Logger
import org.slf4j.LoggerFactory
import javax.annotation.Generated
import com.google.gson.annotations.Until
import com.google.gson.annotations.Since

/**
 * 
 * 
 * @author  {@literal <[at]example>}
 * @since 
 * @version 
 * @generated 27.07.2017 - 22:02:46:446
 */
//@Since()
@Until(0.0)
@Generated(value = '')
@Accessors
@Service
class GroupService {
	
	@Autowired(required=false)
	Logger log
	
	@Autowired
	GroupJpaRepository jpaRepo

	/**
	 * id Service
	 */
	//@Since()
	@Until(0.0)
	public def Group getGroupById(long id) {
		log.debug('Calling getGroupByid({})', id)
		
		jpaRepo.findById(id)
	}
	
	/**
	 * name Service
	 */
	//@Since()
	@Until(0.0)
	public def Group getGroupById(String name) {
		log.debug('Calling getGroupByname({})', name)
		
		jpaRepo.findByName(name)
	}
	
}
