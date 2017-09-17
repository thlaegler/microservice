package org.example.users.websocket.server

import org.springframework.context.annotation.Configuration
import org.springframework.web.socket.config.annotation.EnableWebSocketMessageBroker
import org.slf4j.LoggerFactory
import org.slf4j.Logger

@Configuration
@EnableWebSocketMessageBroker
class UsersWebsocketServerConfig extends AbstractUsersWebsocketServerConfig {

	private static final Logger LOG = LoggerFactory.getLogger(UsersWebsocketServerConfig)
}
