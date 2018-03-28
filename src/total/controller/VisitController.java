package total.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.mongodb.MongoClient;

import total.service.MongoCollection;
import total.service.MongoDatabase;

@Controller
public class VisitController {

	@RequestMapping("/visit")
	public String wayController(Model model){
		
		
		
		
		 try {
			MongoClient client = new MongoClient("13.125.168.55", 27017);
			MongoDatabase db = client.getDatabase("work");
			MongoCollection collection = db.getCollection("natural");

			
			
			 client.close();	
			 
		} catch (Exception e) {
			e.printStackTrace();
			
		}
		 
		 
		 
		model.addAttribute("main","visit.jsp");
		return "default";
	}
	
	
}
