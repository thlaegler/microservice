//package org.example.users.model.config
//
//import java.net.InetAddress
//import java.net.UnknownHostException
//import org.elasticsearch.client.Client
//import org.elasticsearch.client.transport.TransportClient
//import org.elasticsearch.common.settings.Settings
//import org.elasticsearch.common.transport.InetSocketTransportAddress
//import org.springframework.beans.factory.annotation.Autowired
//import org.springframework.boot.autoconfigure.data.elasticsearch.ElasticsearchProperties
//import org.springframework.context.annotation.Bean
//import org.springframework.context.annotation.Configuration
//import org.springframework.data.elasticsearch.core.ElasticsearchOperations
//import org.springframework.data.elasticsearch.core.ElasticsearchTemplate
//import org.springframework.data.elasticsearch.repository.config.EnableElasticsearchRepositories
//
//@Configuration
//@EnableElasticsearchRepositories(basePackages='org.example.users.model.repo.elasticsearch')
//class ElasticsearchConfig {
//
//	static final String ES_CLUSTER_NAME_ATTR = 'cluster.name'
//	static final String ES_HOST_ATTR = 'host'
//	static final String ES_PORT_ATTR = 'port'
//
//	@Autowired
//	ElasticsearchProperties esProperties
//
//	@Bean
//	def Client esClient() throws UnknownHostException {
//		TransportClient.builder() //
//		.settings(esSettings()) //
////    .addPlugin(ReindexPlugin)//
//		.build => [
//			addTransportAddress( //
//			new InetSocketTransportAddress(InetAddress.getByName( //
//				esProperties.properties.get(ES_HOST_ATTR) //
//			), Integer.valueOf(esProperties.properties.get(ES_PORT_ATTR))))
//		]
//	}
//
//	@Bean
//	def ElasticsearchOperations esTemplate() throws UnknownHostException {
//		new ElasticsearchTemplate(esClient)
//	}
//
//	@Bean
//	def Settings esSettings() {
//		Settings.builder //
//		.put(ES_CLUSTER_NAME_ATTR, esProperties.clusterName) //
//		.build
//	}
//
//}
