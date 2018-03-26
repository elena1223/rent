package total.service;

import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ManagerService {
	@Autowired
	SqlSessionTemplate template;
	
	public boolean addCar(Map data) {
		int map = template.insert("car.add", data);
		return map == 1;
	}
	
}
