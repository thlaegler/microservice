package org.example.users.model.entity;

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

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@ApiModel
@JsonIgnoreProperties(ignoreUnknown = true)
@Data
@Builder
@RedisHash
@NoArgsConstructor
@AllArgsConstructor
@KeySpace
@Document(indexName = "userindex", type = "User")
@Setting(settingPath = "/elasticsearch/userindex-settings.yml")
@Entity
@Table
public class User implements Serializable {

	private static final long serialVersionUID = 4241123290300217349L;

	@Id
	@org.springframework.data.annotation.Id
	@ApiModelProperty(example = "1234")
	@Field(type = FieldType.Long, store = true)
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column
	private long id;

	@ApiModelProperty(example = "john.doe")
	@Field(type = FieldType.String)
	@Column
	private String username;

	@ApiModelProperty(example = "john.doe@example.org")
	@Field(type = FieldType.String)
	@Column
	private String email;

	@ApiModelProperty(example = "sdf9sd6fefq2389faf9s")
	@Field(type = FieldType.String)
	@Column
	private String password;

}
