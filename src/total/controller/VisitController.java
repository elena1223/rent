package total.controller;

import java.text.SimpleDateFormat;
import java.util.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.bson.Document;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.mongodb.MongoClient;
import com.mongodb.client.FindIterable;
import com.mongodb.client.MongoCollection;
import com.mongodb.client.MongoDatabase;

import total.service.VisitService;


@Controller
public class VisitController {
	
	@Autowired
	VisitService visitService;
	
	@ResponseBody
	@RequestMapping(path="/delVisit", method = RequestMethod.POST)
	public boolean delvisitController(Model model, HttpSession session, 
			@RequestParam Map<String, String> param, HttpServletRequest req){
		
		
		String id = param.get("id");
		System.out.println("넘어온 objectID : " + id );
		boolean b = visitService.delVisit(id);

		return b;
	}
	
	
	@ResponseBody
	@RequestMapping(path="/visitw", method = RequestMethod.POST)
	public boolean visitPostController(Model model, HttpSession session, 
			@RequestParam Map<String, String> param, HttpServletRequest req){

		HttpSession s = req.getSession();
		Map logon = (Map) s.getAttribute("logon");
		
		String name = null;
		
			if (logon == null) {
				name = "익명";
			} else {
				name = (String)logon.get("NAME");
			}		
//		System.out.println("이름 : " + name);
		String comments = null;
		List<String> tags = new ArrayList();
		

		SimpleDateFormat mSimpleDateFormat = new SimpleDateFormat ( "yyyy.MM.dd HH:mm:ss", Locale.KOREA );
		Date currentTime = new Date ();
		String date = mSimpleDateFormat.format ( currentTime );
//		System.out.println ( "글쓴 날짜" +  date );

		String comment = param.get("comment");
//		System.out.println("내용 : " + comment);
		comments = comment;
		String[] words = comment.split(" ");
		
			for (String word : words) {
				if (word.startsWith("#")){
					String str = word.replaceAll("#", "");
//					System.out.println("태그 : " + str + " / ");
					tags.add(str);
				}
			}
			
		Map query = new HashMap();
		query.put("name", name);
		query.put("comment", comments);
		query.put("tags", tags);
		query.put("date", date);

		boolean b = visitService.writeVisit(query);
		
		return b;
	}
	

	@RequestMapping(path="/visit", method = RequestMethod.GET)
	public String visitGETController(Model model, HttpSession session, 
			@RequestParam Map<String, String> param, HttpServletRequest req){
		List<Map> list;
		
		list = visitService.listVisit();
		System.out.println("list  = " + list);
		
		model.addAttribute("list", list);
		model.addAttribute("main","visit.jsp");		
		
		return "default";
		
	}
	
	
}
