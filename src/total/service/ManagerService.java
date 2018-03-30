package total.service;

import java.util.List;
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
	public List<Map> readMember(String key) {
		return template.selectList("member.readAll",key);
	}
	public boolean delMember(String no) {
		boolean rst=false;
		try {
		rst= template.insert("member.deleteMember",no)>0?true:false;
		}catch(Exception e){
			e.printStackTrace();
			
		}finally {
			return rst;
		}	
	}
}
