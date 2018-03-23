package total.service;

import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
@Service
public class LoginOutService {

	@Autowired
	SqlSessionTemplate template;
	
	public Map findByIdAndPass(Map data) {
		Map map = template.selectOne("member.loginCheck", data);
		return map;
	}
	
	public Map findPass(Map data) {
		Map map= template.selectOne("member.findPass", data);
		return map;
	}

}
