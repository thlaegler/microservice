package com.laegler.microservice.example.code2model.user.model.config

import com.laegler.microservice.example.code2model.user.model.entity.User
import org.springframework.beans.factory.annotation.Autowired
import org.springframework.boot.autoconfigure.data.redis.RedisProperties
import org.springframework.context.annotation.Bean
import org.springframework.context.annotation.Configuration
import org.springframework.data.redis.connection.RedisConnectionFactory
import org.springframework.data.redis.connection.jedis.JedisConnectionFactory
import org.springframework.data.redis.core.RedisTemplate
import org.springframework.data.redis.core.StringRedisTemplate
import org.springframework.data.redis.repository.configuration.EnableRedisRepositories
import org.springframework.data.redis.serializer.Jackson2JsonRedisSerializer
import org.springframework.data.redis.serializer.StringRedisSerializer

@Configuration
@EnableRedisRepositories(basePackages="com.laegler.microservice.example.code2model.user.model.repo.redis")
class RedisConfig {

	@Autowired
	RedisProperties redisProperties;

	@Bean
	def RedisTemplate<String, User> redisTemplate() {
		new RedisTemplate<String, User>() => [
			connectionFactory = connectionFactory()
			keySerializer = new StringRedisSerializer
			valueSerializer = new Jackson2JsonRedisSerializer(User)
			afterPropertiesSet
		]
	}

//  @Bean
//  def CustomConversions redisCustomConversions() {
//    new CustomConversions(
//    	Arrays.asList(
//    		new TimestampToBytesConverter, new BytesToTimestampConverter
//    	)
//    )
//  }
	@Bean
	def RedisConnectionFactory connectionFactory() {
		new JedisConnectionFactory() => [
			hostName = redisProperties.host
			port = redisProperties.port
		]
	}

	@Bean
	def StringRedisTemplate template(RedisConnectionFactory connectionFactory) {
		return new StringRedisTemplate(connectionFactory);
	}

}
