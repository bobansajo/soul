package boot.data.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;


import boot.data.dto.UserDto;
import boot.data.service.UserService;

@RestController // 로그인 전용
public class LoginRestController {

	@Autowired
	UserService service;
	
	@GetMapping("/user/userlogin")
	public Map<String,String> loginproc(String id , String pass,HttpSession session)
	{ 
		
		Map<String , String> map=new HashMap<>();
		int result=service.LoginIdPassCheck(id, pass);
		
		if(result==1)
		{
			//아이디와 비밀번호 일치하면 세션유지설정
			session.setMaxInactiveInterval(60*60*4); //4시간
			//로그인한 정보얻기 
			UserDto dto=service.getDataById(id);
			
			
			session.setAttribute("loginok", "yes");
			session.setAttribute("myid", id);
			session.setAttribute("loginphoto",dto.getUserphoto() );
			session.setAttribute("loginname",dto.getName() );
			
			
			
		}
		map.put("result", result==1?"success":"fail");

		
 		return map;
	}
	
	
	//로그아웃
	
	@GetMapping("/user/logout")
	public void logoutproc(HttpSession session)
	{
		//로그아웃때 제거 되어야할 세션
		session.removeAttribute("loginok");
		session.removeAttribute("myid");
	}
}


