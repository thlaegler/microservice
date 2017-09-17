package org.example.users.websocket.server

import org.springframework.messaging.simp.config.MessageBrokerRegistry
import org.springframework.web.socket.config.annotation.AbstractWebSocketMessageBrokerConfigurer
import org.springframework.web.socket.config.annotation.StompEndpointRegistry

abstract class AbstractUsersWebsocketServerConfig extends AbstractWebSocketMessageBrokerConfigurer {

	override configureMessageBroker(MessageBrokerRegistry config) {
		config.enableSimpleBroker('/topic')
		config.setApplicationDestinationPrefixes('/users')
	}

	override registerStompEndpoints(StompEndpointRegistry registry) {
		registry.addEndpoint('/stream').withSockJS
	}

}
