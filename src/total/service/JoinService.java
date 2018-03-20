package total.service;

import java.util.*;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class JoinService {
	@Autowired
	SqlSessionTemplate template;
	
	public boolean addNewOne(Map map) {
		System.out.println(map);
		return template.insert("member.create", map)==1;
	}
	
	public boolean existIdCheck(String id) {
		return template.selectOne("member.getById", id)!=null;
	}
	
	public boolean existEmailCheck(String email) {
		return template.selectOne("member.getByEmail", email)!=null;
	}
	
//	public boolean login(String id, String password) {
//		Map map=new HashMap<>();
//		map.put("id", id);
//		map.put("password", password);
//		try {
//		 boolean res = template.selectOne("member.loginCheck", map)!=null?true:false;
//			return res;
//		}catch(Exception e){
//			e.printStackTrace();
//			return false;
//		}
//		
//	}
		
		public Map read(String id) {
			return template.selectOne("member.readMember", id);
			
		}
		
}












