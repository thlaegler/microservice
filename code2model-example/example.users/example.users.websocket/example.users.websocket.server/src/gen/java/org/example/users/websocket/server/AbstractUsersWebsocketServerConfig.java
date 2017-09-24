package org.example.users.websocket.server;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.socket.config.annotation.AbstractWebSocketMessageBrokerConfigurer;

abstract public class AbstractUsersWebsocketServerConfig extends AbstractWebSocketMessageBrokerConfigurer {

	private static final Logger LOG = LoggerFactory.getLogger(AbstractUsersWebsocketServerConfig.class);

}
