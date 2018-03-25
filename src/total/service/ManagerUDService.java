package total.service;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ManagerUDService {
	
	@Autowired
	SqlSessionTemplate template;
	
	public List<Map> readAllCar() {
		List list = template.selectList("car.readAllCar");
		return list;
	}
	
}
