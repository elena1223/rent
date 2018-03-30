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
		String comments = null;
		List<String> tags = new ArrayList();
		

		SimpleDateFormat mSimpleDateFormat = 
				new SimpleDateFormat ( "yyyy.MM.dd HH:mm:ss", Locale.KOREA );
		Date currentTime = new Date ();
		String date = mSimpleDateFormat.format ( currentTime );

		String comment = param.get("comment");
		comments = comment;
		String[] words = comment.split(" ");
		
			for (String word : words) {
				if (word.startsWith("#")){
					String str = word.replaceAll("#", "");
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
	public String visitGETController(Model model, HttpSession session, HttpServletRequest req, 
			@RequestParam Map<String, String> param, @RequestParam(defaultValue= "1") int page){
		List<Map> list;
	
		list = visitService.listVisit();
		
		Map<String,Integer> paging = new HashMap<String,Integer>();
		int size = list.size();
		
		paging.put("page", page);
		paging.put("totalCount", size);
		paging.put("countList", 10);
		paging.put("countPage", 5);
		paging.put("totalPage", list.size()%10 > 0 ? list.size()/10+1 : list.size()/10 );
		if(page > paging.get("totalPage")) {
			paging.put("page",paging.get("totalPage"));
		}
		paging.put("startPage",((paging.get("page")-1)/5)*5+1);
		paging.put("endPage", paging.get("startPage")+5-1 > paging.get("totalPage")?
				paging.get("totalPage") : paging.get("startPage")+5-1);
		
		model.addAttribute("page",paging);
		model.addAttribute("list", list);
		model.addAttribute("main","visit.jsp");		
		
		return "default";
		
	}
	
	
}
