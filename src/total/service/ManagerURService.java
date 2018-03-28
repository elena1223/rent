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
	
	public List<Map> readSelect(Map<String,String> no){
		List<Map> list = template.selectList("car.readSelect",no);
		return list;
	}
	
	public boolean updateCar(Map<String,String> data) {
		return template.update("car.updateCar", data) == 1;
	}
	
	public boolean remove(MultiValueMap<String,String> no){
		int remove = 0;
		for (List<String> n : no.values()) {
			for(int i=0; i<n.size(); i++) {
				remove = template.delete("car.delete",n.get(i));
			}
		}
		return remove >= 1;
	}

	
}
