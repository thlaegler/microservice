package com.example.users.websocket.server;

// package com.example.users.websocket.server;
//
// import static java.util.concurrent.TimeUnit.SECONDS;
// import static org.junit.Assert.assertNotNull;
//
// import org.example.users.model.entity.User;
// import org.junit.Before;
// import org.junit.Test;
// import org.junit.runner.RunWith;
// import org.springframework.beans.factory.annotation.Value;
// import org.springframework.boot.test.context.SpringBootTest;
// import org.springframework.messaging.converter.MappingJackson2MessageConverter;
// import org.springframework.messaging.simp.stomp.StompFrameHandler;
// import org.springframework.messaging.simp.stomp.StompHeaders;
// import org.springframework.messaging.simp.stomp.StompSession;
// import org.springframework.messaging.simp.stomp.StompSessionHandlerAdapter;
// import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
// import org.springframework.web.socket.client.standard.StandardWebSocketClient;
// import org.springframework.web.socket.messaging.WebSocketStompClient;
// import org.springframework.web.socket.sockjs.client.SockJsClient;
// import org.springframework.web.socket.sockjs.client.Transport;
// import org.springframework.web.socket.sockjs.client.WebSocketTransport;
//
// import java.lang.reflect.Type;
// import java.net.URISyntaxException;
// import java.util.ArrayList;
// import java.util.List;
// import java.util.concurrent.CompletableFuture;
// import java.util.concurrent.ExecutionException;
// import java.util.concurrent.TimeoutException;
//
// @RunWith(SpringJUnit4ClassRunner.class)
// @SpringBootTest(webEnvironment = SpringBootTest.WebEnvironment.RANDOM_PORT)
// class UsersWebsocketServerTest {
//
// @Value("${org.example.users.host}")
// private String host;
//
// @Value("${local.server.port}")
// private int port;
//
// private String URL;
//
// private static final String SEND_ADD_USER_ENDPOINT = "/users/addUser";
// private static final String SEND_UPDATE_USER_ENDPOINT = "/users/updateUser";
//
// private static final String SUBSCRIBE_ADD_USER_ENDPOINT = "/topic/users";
// private static final String SUBSCRIBE_UPDATE_USER_ENDPOINT = "/topic/users";
//
// private CompletableFuture<User> completableFuture;
//
// @Before
// public void setup() {
// completableFuture = new CompletableFuture<User>();
// URL = "ws://"+host+":"+port+"/stream";
// }
//
// @Test
// public void shouldAddNewUser() throws URISyntaxException, InterruptedException,
// ExecutionException, TimeoutException {
// WebSocketStompClient stompClient = new WebSocketStompClient(new
// SockJsClient(createTransportClient()));
// stompClient.setMessageConverter(new MappingJackson2MessageConverter());
//
// StompSession stompSession = stompClient.connect(URL, new StompSessionHandlerAdapter() {}).get(1,
// SECONDS);
//
// stompSession.subscribe(SUBSCRIBE_ADD_USER_ENDPOINT, new CreateGameStompFrameHandler());
// stompSession.send(SEND_ADD_USER_ENDPOINT, null);
//
// User user = completableFuture.get(10, SECONDS);
//
// assertNotNull(user);
// }
//
// @Test
// public void shouldUpdateUser() throws URISyntaxException, InterruptedException,
// ExecutionException, TimeoutException {
// long id = 1;
//
// WebSocketStompClient stompClient = new WebSocketStompClient(new
// SockJsClient(createTransportClient()));
// stompClient.setMessageConverter(new MappingJackson2MessageConverter());
//
// StompSession stompSession = stompClient.connect(URL, new StompSessionHandlerAdapter() {}).get(1,
// SECONDS);
//
// stompSession.subscribe(SUBSCRIBE_UPDATE_USER_ENDPOINT + id, new CreateGameStompFrameHandler());
// stompSession.send(SEND_UPDATE_USER_ENDPOINT + id, null);
//
// User user = completableFuture.get(10, SECONDS);
//
// assertNotNull(user);
// }
//
// private List<Transport> createTransportClient() {
// List<Transport> transports = new ArrayList<>();
// transports.add(new WebSocketTransport(new StandardWebSocketClient()));
// return transports;
// }
//
// private class CreateGameStompFrameHandler implements StompFrameHandler {
// @Override
// public Type getPayloadType(StompHeaders stompHeaders) {
// return User.class;
// }
//
// @Override
// public void handleFrame(StompHeaders stompHeaders, Object o) {
// completableFuture.complete((User) o);
// }
//
//
// }
//
// }
