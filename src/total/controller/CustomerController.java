package total.controller;

import java.util.*;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import total.service.CustomerService;

@Controller
@RequestMapping("/customer")
public class CustomerController {
	@Autowired
	CustomerService customerService;
	
	@RequestMapping("/{type}")
	public String qnaHandle(Model model,@PathVariable String type, @RequestParam(defaultValue= "1") int page,@RequestParam(defaultValue= "") String key) {

		model.addAttribute("main","customer/qna.jsp");
		Map map=new HashMap();
		map.put("type", type);
		map.put("key", "%"+key+"%");
		List<Map> res=customerService.readAllBoard(map);
		if(!type.equals("notice")&&key.length()<1) {
			Map notice=new HashMap();
			notice.put("type", "notice");
			notice.put("key", "%%");
			List<Map> noti=customerService.readAllBoard(notice);
		model.addAttribute("noti",noti);
		}
		
		model.addAttribute("board",res);
		Map<String,Integer> paging = new HashMap<String,Integer>();

		paging.put("page", page);
		paging.put("totalCount", res.size());
		paging.put("countList", 10);
		paging.put("countPage", 5);
		paging.put("totalPage", res.size()%10>0?res.size()/10+1:res.size()/10);
		if(page>paging.get("totalPage")) {
			paging.put("page",paging.get("totalPage"));
		}
		paging.put("startPage",((paging.get("page") - 1) / 5) * 5 + 1);
		paging.put("endPage", paging.get("startPage")+5-1>paging.get("totalPage")?paging.get("totalPage"):paging.get("startPage")+5-1);
		model.addAttribute("page",paging);
		return "default";
		

		
	}
	@RequestMapping("/{type}/{no}")
	public String qnaNoHandle(Model model,@PathVariable String no,@PathVariable String type) {
		Map read=customerService.readOneBoard(no);
		model.addAttribute("board",read);
		model.addAttribute("comments",customerService.readComments(no));
		if(customerService.hitUp(read)) {
			model.addAttribute("main","customer/board.jsp");
			return "default";
		}else {
			return "redirect:/customer/"+type;
		}
		
	}
	@RequestMapping(path="/write",method=RequestMethod.GET)
	public String writeHandle(Model model,String type) {
		model.addAttribute("main","customer/write.jsp");
		model.addAttribute("type",type);
		return "default";
	}
	@RequestMapping(path="/modify",method=RequestMethod.POST)
	public String modify(Model model,String type,@RequestParam String content,@RequestParam String title,@RequestParam String no) {
		model.addAttribute("title",title);
		model.addAttribute("content",content);
		model.addAttribute("no",no);
		model.addAttribute("type",type);
		model.addAttribute("main","/customer/modify.jsp");
		return "default";
	}
	@RequestMapping(path="/modifyp",method=RequestMethod.POST)
	public String modifyHandle(Model model,@RequestParam Map map,HttpSession session) {
		if(customerService.modifyBoard(map)) {
			return "redirect:/customer/"+map.get("type")+"/"+map.get("no");
		}else{
			model.addAttribute("err","글수정 실패");
			return "redirect:/customer/"+map.get("type");
		}	
	}
	@RequestMapping(path="/upload",method=RequestMethod.POST)
	public String uploadHandle(Model model,@RequestParam Map map,HttpSession session) {
		if(session.getAttribute("logon")!=null) {
			map.put("writer", ((Map)session.getAttribute("logon")).get("NO"));
			map.put("name", ((Map)session.getAttribute("logon")).get("NAME"));
			if(customerService.addBoard(map)) {
				return "redirect:/customer/"+map.get("type");
			}else{
				model.addAttribute("err","글작성 실패");
				return "redirect:/customer/"+map.get("type");
			}
		}else {
			model.addAttribute("err","로그인 후 이용하실 수 있는 서비스입니다.");
			return "redirect:/login";
		}
	}
	@RequestMapping("/delete")
	public String deleteHandle(Model model,@RequestParam String no,@RequestParam String type) {
		if(customerService.deleteBoard(no)) {
			return "redirect:/customer/"+type;
		}else{
			model.addAttribute("err","게시글 삭제 실패");
			return "redirect:/customer/"+type;
		}
	}
	@RequestMapping(path="/comment",method=RequestMethod.POST)
	public String commentHandle(Model model,@RequestParam Map map,HttpSession session) {
		map.put("mno", ((Map)session.getAttribute("logon")).get("NO"));
		map.put("name", ((Map)session.getAttribute("logon")).get("NAME"));
		if(!customerService.addComments(map)) {
			model.addAttribute("err","댓글 작성에 실패하였습니다.");
		}
		return "redirect:"+map.get("uri");
	}
	@RequestMapping("/cdelete")
	public String cdeleteHandle(Model model,@RequestParam String no,@RequestParam String cno,@RequestParam String type) {
		if(!customerService.deleteComment(no)) {
			model.addAttribute("err","댓글삭제에 실패하였습니다.");
		}
		return "redirect:/customer/"+type+"/"+cno;
	}
	@RequestMapping(path="/delete2", method=RequestMethod.POST)
	public String delete2Handle (Model model,@RequestParam String[] no,@RequestParam String type) {
		for(String each:no) {
			customerService.deleteBoard(each);
		}
		return "redirect:/customer/"+type;
	}
}
