package total.service;

import java.util.UUID;

import org.springframework.stereotype.Service;

@Service
public class UuidService {

	public String authUUID() {
		UUID uuid = UUID.randomUUID();	// 고유식별문자 생성 (8-4-4-4-12) : 
		System.out.println(uuid.toString());
		String authkey = uuid.toString().split("-")[1];
		System.out.println(authkey);
		
		return authkey;

	}
}
