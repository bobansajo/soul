package boot.data.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

@Controller
public class LayoutController {
	
	//임시: 삭제할 거!
	@GetMapping("/timeline")
	public String timeline()
	{

		return "/timeline/timelinemain";


	}
	////////

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
