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
 * @author johnDoe {@literal <johnDoe[at]model2code-example>}
 * @since 
 * @version 
 * @generated 17.10.2017 - 20:56:33:290
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
	 * Long Service
	 */
	//@Since()
	@Until(0.0)
	public def Group getGroupById(id long) {
		log.debug('Calling getGroupBylong({})', long)
		
		jpaRepo.findByLong(long)
	}
	
	/**
	 * String Service
	 */
	//@Since()
	@Until(0.0)
	public def Group getGroupById(name string) {
		log.debug('Calling getGroupBystring({})', string)
		
		jpaRepo.findByString(string)
	}
	
}
