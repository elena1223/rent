package total.service;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ReserveService {
	@Autowired
	SqlSessionTemplate template;
	
	public boolean newReserve(Map map) {
		boolean rst=false;
		try {
		rst= template.insert("reserve.add",map)>0?true:false;
		}catch(Exception e){
			e.printStackTrace();
			
		}finally {
			return rst;
		}	
	}
	public Map dateCheck(Map map) {
		return template.selectOne("reserve.dateCheck",map);

	}
}

