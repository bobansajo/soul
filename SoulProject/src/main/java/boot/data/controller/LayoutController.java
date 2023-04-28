package boot.data.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

@Controller
public class LayoutController {

	@GetMapping("/")
	public String start()
	{
		return "/timeline/timelinemain";
	}
	
	@PostMapping("/insert")
	public String insert()
	{
		return "/timeline/timelinemain";
	}
}
