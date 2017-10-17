package org.example.microservice.entity;

import org.example.microservice.*;
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
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import javax.annotation.Generated;
import com.google.gson.annotations.Until;
import com.google.gson.annotations.Since;

/**
 * 
 * 
 * @author johnDoe {@literal <johnDoe[at]model2code-example>}
 * @since 
 * @version 
 * @generated 17.10.2017 - 20:56:34:93
 */
@Since(0.1)
//@Until(0.0)
@Generated(value = '')
@ApiModel
@JsonIgnoreProperties(ignoreUnknown = true)
@Data
@Builder
@RedisHash
@NoArgsConstructor
@AllArgsConstructor
@KeySpace
@Document(indexName = "groupindex", type = "Group")
@Setting(settingPath = "/elasticsearch/groupindex-settings.yml")
@Entity
@Table(name = "groups")
@Accessors
@XmlRootElement
@JsonProperty
@Cache
public class Group implements Serializable {

	private static final long serialVersionUID = -8257049281814163185;

	/**
	 * id
	 */
	@Since()
	@Until(0.0)
	@ApiModelProperty(example = "1234")
	@JsonProperty('id')
	@Field(type = FieldType.Long, store = true)
	@XmlElement
	@Expose(serialize=true, deserialize=true)
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name='id')
	private Long long;
	
	/**
	 * name
	 */
	@Since()
	@Until(0.0)
	@ApiModelProperty(example = "1234")
	@JsonProperty('name')
	@Field(type = FieldType.String, store = true)
	@XmlElement
	@Expose(serialize=true, deserialize=true)
	@Column(name='name')
	private String string;
	
	
}
