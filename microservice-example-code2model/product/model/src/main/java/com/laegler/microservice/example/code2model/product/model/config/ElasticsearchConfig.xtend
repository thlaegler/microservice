package com.laegler.microservice.example.code2model.product.model.config

import org.elasticsearch.common.inject.Inject
import org.slf4j.Logger
import org.springframework.context.annotation.Bean
import org.springframework.context.annotation.Configuration
import org.springframework.data.redis.connection.RedisConnectionFactory
import org.springframework.data.redis.connection.jedis.JedisConnectionFactory
import org.springframework.data.redis.core.RedisTemplate
import org.springframework.data.redis.core.StringRedisTemplate
import org.springframework.data.redis.serializer.Jackson2JsonRedisSerializer
import org.springframework.data.redis.serializer.StringRedisSerializer
import com.laegler.microservice.example.code2model.product.model.entity.Product
import org.springframework.data.elasticsearch.repository.config.EnableElasticsearchRepositories
import org.springframework.data.elasticsearch.core.ElasticsearchOperations
import org.elasticsearch.client.Client
import org.springframework.boot.autoconfigure.data.elasticsearch.ElasticsearchProperties
import org.springframework.beans.factory.annotation.Autowired
import java.net.UnknownHostException
import org.elasticsearch.common.settings.Settings
import org.elasticsearch.client.transport.TransportClient
import org.elasticsearch.common.transport.InetSocketTransportAddress
import java.net.InetAddress
import org.springframework.data.elasticsearch.core.ElasticsearchTemplate

@Configuration
@EnableElasticsearchRepositories(basePackages='com.laegler.microservice.example.code2model.product.model.repo.elasticsearch')
class ElasticsearchConfig {

	static final String ES_CLUSTER_NAME_ATTR = 'cluster.name'
	static final String ES_HOST_ATTR = 'host'
	static final String ES_PORT_ATTR = 'port'

	@Autowired
	ElasticsearchProperties esProperties

	@Bean
	public def Client esClient() throws UnknownHostException {
		TransportClient.builder() //
		.settings(esSettings()) //
//    .addPlugin(ReindexPlugin)//
		.build => [
			addTransportAddress( //
			new InetSocketTransportAddress(InetAddress.getByName( //
				esProperties.properties.get(ES_HOST_ATTR) //
			), Integer.valueOf(esProperties.properties.get(ES_PORT_ATTR))))
		]
	}

	@Bean
	public def ElasticsearchOperations esTemplate() throws UnknownHostException {
		new ElasticsearchTemplate(esClient);
	}

	@Bean
	public def Settings esSettings() {
		Settings.builder() //
		.put(ES_CLUSTER_NAME_ATTR, esProperties.clusterName) //
		.build
	}

}
