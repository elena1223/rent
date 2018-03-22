package total.service;

import java.util.*;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class MypageService {
	@Autowired
	SqlSessionTemplate template;
	
	public Map readOne(String id) {
		return template.selectOne("member.readOne", id);
		
	}
	
	public boolean editMypage(Map map) {
		return template.update("member.editMypage", map) == 1 ;

	}
}
