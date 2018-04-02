package total.service;

import java.util.UUID;

import org.springframework.stereotype.Service;

@Service
public class UuidService {

	public String authUUID() {
		UUID uuid = UUID.randomUUID();
		String authkey = uuid.toString().split("-")[1];
		
		return authkey;

	}
}
