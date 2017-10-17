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
 * @generated 17.10.2017 - 20:56:33:283
 */
//@Since()
@Until(0.0)
@Generated(value = '')
@Accessors
@Service
class UserService {
	
	@Autowired(required=false)
	Logger log
	
	@Autowired
	UserJpaRepository jpaRepo

	/**
	 * Long Service
	 */
	//@Since()
	@Until(0.0)
	public def User getUserById(id long) {
		log.debug('Calling getUserBylong({})', long)
		
		jpaRepo.findByLong(long)
	}
	
	/**
	 * List<Group> Service
	 */
	//@Since()
	@Until(0.0)
	public def User getUserById(groups list<Group>) {
		log.debug('Calling getUserBylist<Group>({})', list<Group>)
		
		jpaRepo.findByList<Group>(list<Group>)
	}
	
	/**
	 * String Service
	 */
	//@Since()
	@Until(0.0)
	public def User getUserById(name string) {
		log.debug('Calling getUserBystring({})', string)
		
		jpaRepo.findByString(string)
	}
	
	/**
	 * Email Service
	 */
	//@Since()
	@Until(0.0)
	public def User getUserById(email email) {
		log.debug('Calling getUserByemail({})', email)
		
		jpaRepo.findByEmail(email)
	}
	
	/**
	 * Password Service
	 */
	//@Since()
	@Until(0.0)
	public def User getUserById(password password) {
		log.debug('Calling getUserBypassword({})', password)
		
		jpaRepo.findByPassword(password)
	}
	
}
