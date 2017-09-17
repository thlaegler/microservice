package org.example.users.model.config

import org.example.users.model.entity.User
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
@EnableRedisRepositories(basePackages="org.example.users.model.repo.redis")
class RedisConfig {

	@Autowired
	RedisProperties redisProperties

	@Bean
	def RedisTemplate<String, User> redisTemplate() {
		new RedisTemplate<String, User>() => [
			connectionFactory = connectionFactory()
			keySerializer = new StringRedisSerializer
			valueSerializer = new Jackson2JsonRedisSerializer(User)
			afterPropertiesSet
		]
	}

	@Bean
	def RedisConnectionFactory connectionFactory() {
		new JedisConnectionFactory() => [
			hostName = redisProperties.host
			port = redisProperties.port
		]
	}

	@Bean
	def StringRedisTemplate template(RedisConnectionFactory connectionFactory) {
		new StringRedisTemplate(connectionFactory)
	}

}
