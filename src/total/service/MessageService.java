package total.service;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.PostConstruct;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;

import com.google.gson.Gson;

@Service
public class MessageService {
	@Autowired
	Gson gson;
	
	Map<String, List<WebSocketSession>> map;
	
	@PostConstruct
	public void init() {
		map = new HashMap<>();
	}
	
	public boolean addWebSocket(String key, WebSocketSession session) {
		if(!map.containsKey(key)) {
			map.put(key, new ArrayList<>());
		}
		return map.get(key).add(session);
	}
	
	public boolean removeWebSocket(String key, WebSocketSession session) {
		boolean r = map.get(key).remove(session);
		if(map.get(key).isEmpty()) {
			map.remove(key);
		}
		return r;
	}
	
	public void sendMessage(String other,String content){
		if(map.containsKey(other)) {
			Map msg = new LinkedHashMap<>();
				msg.put("mode", "message");
				msg.put("msg", content);
			for(WebSocketSession ws : map.get(other)) {
				try {
					ws.sendMessage(new TextMessage(gson.toJson(msg)));
				} catch (IOException e) {
					e.printStackTrace();
					break;
				}
			}
		}
	}
	
	public void logonMessage(String other,String content){
		if(map.containsKey(other)) {
			Map msg = new LinkedHashMap<>();
				msg.put("mode", "logon");
				msg.put("msg", content);
			for(WebSocketSession ws : map.get(other)) {
				try {
					ws.sendMessage(new TextMessage(gson.toJson(msg)));
				} catch (IOException e) {
					e.printStackTrace();
					break;
				}
			}
		}
	}

	public void sendAcceptedMessage(String one, String other) throws IOException {

	}
	
	public void sendDeniedMessage(String one, String other) throws IOException {

	}
}












