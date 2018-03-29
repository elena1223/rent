package total.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import total.service.LoginOutService;
import total.service.MypageService;
import total.service.ReserveService;

@Controller
public class MypageController {
	@Autowired
	MypageService mypageService;
	@Autowired
	LoginOutService loginOutService;
	@Autowired
	ReserveService reserveService;

	@RequestMapping(path = "/mypage")
	public String myPageHandle(Model model, HttpSession session, Map map, HttpServletRequest req) {

		try {
			HttpSession s = req.getSession();
			Map logon = (Map) s.getAttribute("logon");
			if (logon == null) {
				return "redirect:/";
			}
			// System.out.println("(���������� in)���ǿ� �α׿� ���� ��" + logon);

			String id = (String) logon.get("ID");

			map = mypageService.readOne(id);
			System.out.println("ȸ������ �� : " + map);
			model.addAttribute("main", "mypage.jsp");
			model.addAttribute("mypage", map);

		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("err", "Error!");
			model.addAttribute("main", "error.jsp");

			return "default";
		}

		return "default";
	}
	
	
	
	
	@RequestMapping(path = "/mypageInfo")
	public String myPageHandle(Model model, HttpSession session, HttpServletRequest req,
			@RequestParam Map<String, String> param) {
		try {
			Map map = new HashMap();
			Map editmap = new HashMap();
			// System.out.println("param = " + param);
			HttpSession s = req.getSession();
			Map logon = (Map) s.getAttribute("logon");
			if (logon == null) {
				return "redirect:/";
			}
//			 String lv =param.get("LV"); // lv == null
//			String lv = String.valueOf(param.get("LV")); // lv == "null"
			String lv = String.valueOf(logon.get("LV"));
			String lvv =param.get("lvv"); 
			String phone = String.valueOf(param.get("phone"));
//			System.out.println("lvv : " + lvv);
			if(lvv==null) {
				param.put("lv", lv);
				map.put("lv", lv);
			}else {
				if (lvv.equals("0")) {
					param.put("lv", "0");
					map.put("lv", "0");
				} else {
					param.put("lv", "1");
					map.put("lv", "1");
				}
			}
			if (phone == null) {
				param.put("phone", (String) logon.get("phone"));
				map.put("phone", (String) logon.get("phone"));
			}

			map.put("id", param.get("id"));
			map.put("password", param.get("password"));
			map.put("phone", param.get("phone"));

			 System.out.println("������ �Ѿ�� �� = " + map);
			boolean b = mypageService.editMypage(map);
			// �����Ǿ����� ����
			if (b) {
				editmap.put("id", param.get("id"));
				editmap.put("password", param.get("password"));

				Map logons = loginOutService.findByIdAndPass(editmap);
				session.setAttribute("logon", logons);
				System.out.println("(����������out)���ǿ� �α׿� ���� ��" + logon);

			} else {

				throw new Exception();
			}

		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("err", "Error!");
			model.addAttribute("main", "error.jsp");

			return "default";
		}
		return "redirect:/";
	}
	
	
	@RequestMapping(path="/outMember", method = RequestMethod.POST)

	public String registerHandle(Model model, HttpSession session, Map map,
			 HttpServletRequest req, @RequestParam Map<String, String> param) {
		try {

			System.out.println("param =  " + param);
			String password = param.get("password");
			String id = param.get("id");
			
			boolean rst = false;
			rst= mypageService.outMember(param); 

			System.out.println("ȸ��Ż�� ���� =  " + rst);
			
			if(rst) {
				session.removeAttribute("logon");
				return "redirect:/";
			}
			throw new Exception();
		}catch(Exception e) {
			e.printStackTrace();
			model.addAttribute("err", "ȸ�� Ż�𿡼� ������ �־����ϴ�.");
			model.addAttribute("main","error.jsp" );

			return "default";
		}
	}
	
	@RequestMapping(path = "/target")
	public String popupHandle(Model model, HttpSession session, HttpServletRequest req,
			@RequestParam Map<String, String> param) {
//		model.addAttribute("main","target.jsp" );
		return "target";

	}
	
	@RequestMapping("/mypage/reserve")
	public String readMyResevation(Model model, HttpSession session, HttpServletRequest req) {
		
		HttpSession s = req.getSession();
		Map logon = (Map) s.getAttribute("logon");
		if (logon == null) {
			return "redirect:/";
		}
		String no = String.valueOf(logon.get("NO"));
			model.addAttribute("my", mypageService.readMyResevation(no));
			model.addAttribute("end",mypageService.endMyReserve(no));
			model.addAttribute("cancel",mypageService.cacelMyReserve(no));
			model.addAttribute("main","myreservation.jsp");
			return "default";
	}
	@RequestMapping(path="/mypage/cancel",method=RequestMethod.POST)
	public String cancelHandle(Model model,@RequestParam String[] no,@RequestParam String c) {
		for(String each:no) {
			reserveService.cancellation(each,c);
		}
		return "redirect:/mypage/reserve";
	}
	
}
