package total.service;

import java.util.ArrayList;
import java.util.HashMap;
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
	
	public List overlapDate(Map map){
		List list=new ArrayList<>();
		Map<Object,Integer> cnt = new HashMap<Object,Integer>();
		List<Map> date = template.selectList("reserve.overlapDate",map);
		for(Map d:date) {
			map.putAll(d);
			List<Map> tmp=template.selectList("reserve.overlapDay",map);
			for(Map m:tmp) {
				if(!cnt.containsKey(m.get("DAY"))) {
					cnt.put(m.get("DAY"),0);
				}
				cnt.put(m.get("DAY"), cnt.get(m.get("DAY"))+1);
				if(cnt.get(m.get("DAY"))>=Integer.parseInt((String) map.get("cnt"))) {
					if(!list.contains(m.get("DAY"))) {
						list.add(m.get("DAY"));
					}
				}
			}
			
		}
		return list;
	}
}

