package com.example.users.websocket.server;

// import static org.apache.jmeter.protocol.java.sampler.AbstractJavaSamplerClient.log;

import org.apache.jmeter.config.Arguments;
import org.apache.jmeter.protocol.java.sampler.AbstractJavaSamplerClient;
import org.apache.jmeter.protocol.java.sampler.JavaSamplerContext;
import org.apache.jmeter.samplers.SampleResult;
import org.glassfish.tyrus.client.ClientManager;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.io.IOException;
import java.net.URI;
import java.util.concurrent.CountDownLatch;
import java.util.concurrent.TimeUnit;

import javax.websocket.ClientEndpoint;
import javax.websocket.CloseReason;
import javax.websocket.OnClose;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;

@ClientEndpoint
public class UsersWebsocketClientRequest extends AbstractJavaSamplerClient {

	private static final String HOST = "users";
	private static final String PORT = "8091";
	private static final String BASE_PATH = "stream";

	private static String ws_uri;
	private static String ws_message;
	private static String response_message;
	private static CountDownLatch latch;

	private static final Logger LOG = LoggerFactory.getLogger(UsersWebsocketClientRequest.class);

	@Override
	public Arguments getDefaultParameters() {
		Arguments params = new Arguments();
		params.addArgument("URI", "ws://" + HOST + ":" + PORT + "/" + BASE_PATH + "/");
		params.addArgument("Message", "test");
		return params;
	}


	@Override
	public void setupTest(JavaSamplerContext context) {
		ws_uri = context.getParameter("URI");
		ws_message = context.getParameter("Message");
	}

	@Override
	public SampleResult runTest(JavaSamplerContext javaSamplerContext) {
		SampleResult rv = new SampleResult();
		rv.sampleStart();
		latch = new CountDownLatch(1);

		ClientManager client = ClientManager.createClient();
		try {
			client.connectToServer(UsersWebsocketClientRequest.class, new URI(ws_uri));
			latch.await(1L, TimeUnit.SECONDS);
		} catch (Throwable e) {
			throw new RuntimeException(e);
		}
		rv.setSuccessful(true);
		rv.setResponseMessage(response_message);
		rv.setResponseCode("200");
		if (response_message != null) {
			rv.setResponseData(response_message.getBytes());
		}
		rv.sampleEnd();
		return rv;
	}

	@OnOpen
	public void onOpen(Session session) {
		// LOG.info("Connected ... " + session.getId());
		try {
			session.getBasicRemote().sendText(ws_message);
		} catch (IOException e) {
			throw new RuntimeException(e);
		}
	}

	@OnMessage
	public String onMessage(String message, Session session) {
		// LOG.info("Received ... " + message + " on session " + session.getId());
		response_message = message;
		try {
			session.close(new CloseReason(CloseReason.CloseCodes.NORMAL_CLOSURE, ""));
		} catch (IOException e) {
			e.printStackTrace();
		}
		return response_message;
	}

	@OnClose
	public void onClose(Session session, CloseReason closeReason) {
		// LOG.info(String.format("Session %s close because of %s", session.getId(), closeReason));
	}

}
