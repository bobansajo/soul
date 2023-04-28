package boot.data.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import boot.data.dto.UserDto;
import boot.data.service.UserService;

@Controller
public class LoginController {
	
	@Autowired
	UserService service;
	
	@GetMapping("/login/main")
	public String loginform(HttpSession session,Model model)
	{
		String myid=(String)session.getAttribute("myid");
		
		String loginok=(String)session.getAttribute("loginok");
		
		
		if(loginok==null)
			return "/login/loginform";
		else {
			//로그인중일때 requset에 로그인한 이름저장하기
			String name=service.getName(myid);
			model.addAttribute("name", name);
			return "/login/logoutform";
			
		}
		
	}
	
	
	@PostMapping("/login/loginprocess")
	public String loginproc(@RequestParam String id,
			@RequestParam String pass,
			@RequestParam(required = false) String cbsave,
			HttpSession session,Model model)
	{
		
		//id와 pass받기
		int check=service.LoginIdPassCheck(id, pass); //1 or 0
		
		if(check==1) {  //로그인 성공시
			
			session.setMaxInactiveInterval(60*60*8);
			
			session.setAttribute("myid", id);
			session.setAttribute("loginok", "yes");
			session.setAttribute("saveok", cbsave);
			
			//id에 대한 데이타
			UserDto dto=service.getDataById(id);
			
			session.setAttribute("loginphoto", dto.getUserphoto());
			
			return "redirect:main";
			
		}else {  //로그인 실패시
			
			return "/user/passfail";
		}
		
		
	}
	

	@GetMapping("/login/logoutprocess")
	public String logout(HttpSession session)
	{
		session.removeAttribute("loginok");
		return "redirect:main";
	}
	
	
}
