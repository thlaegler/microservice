package com.laegler.microservice.example.code2model.product.model.entity

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

@ApiModel
@JsonIgnoreProperties(ignoreUnknown=true)
@Accessors
@RedisHash
@Document(indexName='product-index', type='Product')
@Setting(settingPath='elasticsearch/product-index-settings.yml')
@Entity
@Table(name='product')
public class Product implements Serializable {

	@Id
	@org.springframework.data.annotation.Id
	@ApiModelProperty(example='1234')
	@Field(type=FieldType.Integer, store=true)
	@GeneratedValue(strategy=GenerationType.AUTO)
	@Column
	long id;

	@ApiModelProperty(example='123ABC456')
	@Field(type=FieldType.String)
	@Column
	String itemCode;

}
