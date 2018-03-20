package total.service;

import java.math.BigDecimal;
import java.util.*;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class CustomerService {
	@Autowired
	SqlSessionTemplate template;
	public List<Map> readAll(String type){
		return template.selectList("board.readAll", type);
	}
	public Map readOne(String no) {
		return template.selectOne("board.readOne",no);
	}
	public boolean addBoard(Map map) {
		boolean rst=false;
		try {
		rst= template.insert("board.add",map)>0?true:false;
		}catch(Exception e){
			e.printStackTrace();
			
		}finally {
			return rst;
		}	
	}
	public boolean hitUp(Map map) {
		boolean rst=false;
		BigDecimal bh=(BigDecimal)map.get("HIT");
		map.put("HIT",bh.intValue()+1);
		try {
		rst= template.update("board.hitUp",map)>0?true:false;
		}catch(Exception e){
			e.printStackTrace();
			
		}finally {
			return rst;
		}	
	}
	public boolean deleteBoard(String no) {
		boolean rst=false;
		try {
		rst= template.delete("board.delete",no)>0?true:false;
		}catch(Exception e){
			e.printStackTrace();
			
		}finally {
			return rst;
		}	
	}
}
