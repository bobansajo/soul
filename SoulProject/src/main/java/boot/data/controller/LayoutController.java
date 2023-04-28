package boot.data.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

@Controller
public class LayoutController {

	@GetMapping("/")
	public String start()
	{

		return "redirect:/user/login";
		/* return "/timeline/timelinemain"; */

	}
	

	@GetMapping("/user/login")
	public String login()
	{
		return  "layout2/login/loginform";
	}
	
	
	
	@GetMapping("/user/userinsert")
	public String insert()
	{
		return "layout2/login/loginform";
	}
	
	

}
