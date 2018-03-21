package total.controller;

import java.util.Map;

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
	public String qnaHandle(Model model,@PathVariable String type) {
		model.addAttribute("main","customer/qna.jsp");
		model.addAttribute("board",customerService.readAllBoard(type));
		return "default";
	}
	@RequestMapping("/{type}/{no}")
	public String qnaNoHandle(Model model,@PathVariable String no,@PathVariable String type) {
		Map read=customerService.readOneBoard(no);
		model.addAttribute("board",read);
		model.addAttribute("comments",customerService.readComments(no));
		if(customerService.hitUp(read)) {
			model.addAttribute("main","customer/board.jsp");
			System.out.println("ok");
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
		return "redirect:customer/"+type+"/"+cno;
	}
}