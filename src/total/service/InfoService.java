package total.service;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class InfoService {
	@Autowired
	SqlSessionTemplate template;

	public List<Map> readAllCar() {
		List list = template.selectList("car.readAllCar");
		return list;
	}

	public Map readOneCar(String no) {
		return template.selectOne("car.readOne", no);
	}

	public List<Map> readByType(String type) {
		return template.selectList("car.readByType", type);
	}

	public List<Map> readNewCar() {
		return template.selectList("car.readNewCar");
	}

}
