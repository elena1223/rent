package total.service;

import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.MultiValueMap;

@Service
public class ManagerUDService {
	
	@Autowired
	SqlSessionTemplate template;
	
	public List<Map> readAllCar() {
		List list = template.selectList("car.readAllCar");
		return list;
	}
	
	public List<Map> readSelect(MultiValueMap<String,String> no){
		for (List<String> n : no.values()) {
			for(int i=0; i<n.size(); i++) {
				System.out.println(n.get(i));
			}
		}

		List list = template.selectList("car.readAllCar");
		return list;
	}
	
}
