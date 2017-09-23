package org.example.users.model.entity

import com.fasterxml.jackson.annotation.JsonIgnoreProperties
import io.swagger.annotations.ApiModel
import io.swagger.annotations.ApiModelProperty
import java.io.Serializable
import javax.persistence.Column
import javax.persistence.Entity
import javax.persistence.GeneratedValue
import javax.persistence.GenerationType
import javax.persistence.Id
import javax.persistence.Table
import org.eclipse.xtend.lib.annotations.Accessors
import org.springframework.data.elasticsearch.annotations.Field
import org.springframework.data.elasticsearch.annotations.FieldType
import org.springframework.data.redis.core.RedisHash
import org.springframework.data.elasticsearch.annotations.Document
import org.springframework.data.elasticsearch.annotations.Setting
import org.springframework.data.keyvalue.annotation.KeySpace

@ApiModel
@JsonIgnoreProperties(ignoreUnknown=true)
@Accessors
@RedisHash
@KeySpace
@Document(indexName='userindex', type='User')
@Setting(settingPath='/elasticsearch/userindex-settings.yml')
@Entity
@Table
public class User implements Serializable {

	@Id
	@org.springframework.data.annotation.Id
	@ApiModelProperty(example='1234')
	@Field(type=FieldType.Long, store=true)
	@GeneratedValue(strategy=GenerationType.AUTO)
	@Column
	long id

	@ApiModelProperty(example='john.doe')
	@Field(type=FieldType.String)
	@Column
	String username
	
	@ApiModelProperty(example='john.doe@example.org')
	@Field(type=FieldType.String)
	@Column
	String email
	
	@ApiModelProperty(example='sdf9sd6fefq2389faf9s')
	@Field(type=FieldType.String)
	@Column
	String password

}
