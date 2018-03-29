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
	
	public boolean outMember(Map map) {
		Map find = new HashMap<>();
		find = template.selectOne("member.getById", map.get("id"));
		boolean rst = false;
		if(find != null) {
			template.delete("member.outMember",map);
			rst = true;
		}
		return rst;
	}
	
	public List readMyResevation(String no) {
		List<Map> list = template.selectList("reserve.readMyResevation",no);
		 return list;
	}
	public List<Map> cacelMyReserve(String no){
		return template.selectList("reserve.cancelMyReserve",no);
	}
	public List<Map> endMyReserve(String no){
		return template.selectList("reserve.endMyReserve",no);
	}
	
}
