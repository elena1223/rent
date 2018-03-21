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
	
	
	public HashMap existIdCheck(String id) {
		HashMap map = new HashMap<>();
		map = template.selectOne("member.getById", id);
		return map;
	}
	
	public boolean existEmailCheck(String email) {
		return template.selectOne("member.getByEmail", email)!=null;
	}
		

}












