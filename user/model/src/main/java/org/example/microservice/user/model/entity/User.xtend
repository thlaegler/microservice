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
import javax.annotation.Generated
import com.google.gson.annotations.Until
import com.google.gson.annotations.Since

/**
 * 
 * 
 * @author  {@literal <[at]example>}
 * @since 
 * @version 
 * @generated 27.07.2017 - 22:02:46:426
 */
//@Since()
@Until(0.0)
@Generated(value = '')
@Accessors
@Entity
@Table(name = "User")
@XmlRootElement
//@ApiModel
@Cache(usage = CacheConcurrencyStrategy.NONSTRICT_READ_WRITE)
class User implements Serializable {

	/**
	 * id
	 */
	@Column(name='id')
	//@Since()
	@Until(0.0)
	//@JsonProperty('id')
	@XmlElement
	@Expose(serialize=true, deserialize=true)
	@Accessors(PUBLIC_GETTER, PUBLIC_SETTER)
	long id
	
	/**
	 * name
	 */
	@Column(name='name')
	//@Since()
	@Until(0.0)
	//@JsonProperty('name')
	@XmlElement
	@Expose(serialize=true, deserialize=true)
	@Accessors(PUBLIC_GETTER, PUBLIC_SETTER)
	String name
	
	/**
	 * email
	 */
	@Column(name='email')
	//@Since()
	@Until(0.0)
	//@JsonProperty('email')
	@XmlElement
	@Expose(serialize=true, deserialize=true)
	@Accessors(PUBLIC_GETTER, PUBLIC_SETTER)
	Email email
	
	/**
	 * password
	 */
	@Column(name='password')
	//@Since()
	@Until(0.0)
	//@JsonProperty('password')
	@XmlElement
	@Expose(serialize=true, deserialize=true)
	@Accessors(PUBLIC_GETTER, PUBLIC_SETTER)
	Password password
	
}
