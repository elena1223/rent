package total.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.MultiValueMap;

@Service
public class ManagerURService {
	
	@Autowired
	SqlSessionTemplate template;
	
	public List<Map> readAllCar() {
		List list = template.selectList("car.readAllCar");
		return list;
	}
	
	public List<Map> readSelect(MultiValueMap<String,String> no){
		List<Map> list = new ArrayList<>();
		List<Map> list2 = null;
		for (List<String> n : no.values()) {
			for(int i=0; i<n.size(); i++) {
				list2 = template.selectList("car.readSelect",n.get(i));
				list.addAll(list2);
			}
		}
		return list;
	}
	
}
