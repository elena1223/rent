package total.service;

import java.util.ArrayList;
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
	public boolean delete(String no) {
		boolean rst=false;
		try {
		rst= template.delete("reserve.delete",no)>0?true:false;
		}catch(Exception e){
			e.printStackTrace();
			
		}finally {
			return rst;
		}	
	}
	public Map dateCheck(Map map) {
		return template.selectOne("reserve.dateCheck",map);

	}
	
	public List overlapDate(Map map){
		List list=new ArrayList<>();
		List<Map> date = template.selectList("reserve.overlapDate",map);
		for(Map d:date) {
			map.putAll(d);
			List<Map> tmp=template.selectList("reserve.overlapDay",map);
			for(Map m:tmp) {
				if(!list.contains(m.get("DAY"))) {
					list.add(m.get("DAY"));
				}
			}
			System.out.println(list.toString());
		}
		return list;
	}
	public List<Map> readAll(String key){
		return template.selectList("reserve.readAll",key);
	}
	public List<Map> endReserve(String key){
		return template.selectList("reserve.endReserve",key);
	}
}

