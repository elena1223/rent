package total.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import total.service.MessageService;

@Controller("SocketController")
public class SocketController extends TextWebSocketHandler {
	@Autowired
	MessageService messageService;
	
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		String key =String.valueOf(((Map)session.getAttributes().get("logon")).get("NO"));
		messageService.addWebSocket(key, session);
	}

	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		String key =String.valueOf(((Map)session.getAttributes().get("logon")).get("NO"));
		messageService.removeWebSocket(key, session);
	}

}
