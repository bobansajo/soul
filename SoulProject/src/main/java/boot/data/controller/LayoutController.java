package boot.data.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class LayoutController {

	@GetMapping("/")
	public String start()
	{

		return "redirect:/user/login";


	}
	
	@GetMapping("/user/login")
	public String userlogin()
	{
		return  "layout2/login/loginform";
	}
	
	
	
	@GetMapping("/user/userinsert")
	public String insert()
	{
		return "layout2/login/loginform";
	}
	
	
	
	
	
}
