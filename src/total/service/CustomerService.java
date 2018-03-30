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

	public List<Map> readAllBoard(Map map) {
		return template.selectList("board.readAll", map);
	}

	public List<Map> readComments(String cno) {
		return template.selectList("comments.readAll", cno);
	}

	public Map readOneBoard(String no) {
		return template.selectOne("board.readOne", no);
	}

	public boolean addBoard(Map map) {
		boolean rst = false;
		try {
			rst = template.insert("board.add", map) > 0 ? true : false;
		} catch (Exception e) {
			e.printStackTrace();

		} finally {
			return rst;
		}
	}

	public boolean addComments(Map map) {
		boolean rst = false;
		try {
			rst = template.insert("comments.add", map) > 0 ? true : false;
		} catch (Exception e) {
			e.printStackTrace();

		} finally {
			return rst;
		}
	}

	public boolean hitUp(Map map) {
		boolean rst = false;
		BigDecimal bh = (BigDecimal) map.get("HIT");
		map.put("HIT", bh.intValue() + 1);
		try {
			rst = template.update("board.hitUp", map) > 0 ? true : false;
		} catch (Exception e) {
			e.printStackTrace();

		} finally {
			return rst;
		}
	}

	public boolean deleteBoard(String no) {
		boolean rst = false;
		try {
			rst = template.delete("board.delete", no) > 0 ? true : false;
		} catch (Exception e) {
			e.printStackTrace();

		} finally {
			return rst;
		}
	}

	public boolean modifyBoard(Map map) {
		boolean rst = false;
		try {
			rst = template.update("board.modify", map) > 0 ? true : false;
		} catch (Exception e) {
			e.printStackTrace();

		} finally {
			return rst;
		}
	}

	public boolean deleteComment(String no) {
		boolean rst = false;
		try {
			rst = template.delete("comments.delete", no) > 0 ? true : false;
		} catch (Exception e) {
			e.printStackTrace();

		} finally {
			return rst;
		}
	}
}
