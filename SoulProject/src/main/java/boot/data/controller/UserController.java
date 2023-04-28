package boot.data.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

//import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
//import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import boot.data.dto.UserDto;
import boot.data.service.UserService;

@Controller
public class UserController {
	@Autowired
	UserService uservice;
	
	
	@GetMapping("/user/list")
	public String list(Model model)
	{
		List<UserDto> list=uservice.getAllUsers();
		
		model.addAttribute("list", list);
		model.addAttribute("count", list.size());
		
		return "/user/userlist";
	}
	
	
	@GetMapping("/user/form")
	public String userform()
	{
		return "/user/userform";
	}
	
	//중복체크 
	@GetMapping("/user/useridcheck")
	@ResponseBody
	public Map<String, Integer> idCheckPass(@RequestParam String id)
	{	Map<String, Integer> map= new HashMap<>();
		int n=uservice.getSearchId(id);
		System.out.println(n);
		map.put("count", n);
		
		return map;
	}
	//insert
	
		@PostMapping("/user/userinsert")
		public String insert(@ModelAttribute UserDto dto,
				MultipartFile myphoto,
				HttpSession session)
		{
			
			//업로드경로
			String path=session.getServletContext().getRealPath("/photo");
			
			//저장파일
			SimpleDateFormat sdf=new SimpleDateFormat("yyyyMMddHHmmss");
			String fileName="photo_"+sdf.format(new Date())+"_"+myphoto.getOriginalFilename();
			
			//dto의 photo에 저장
			dto.setUserphoto(fileName);
			
			//upload
			try {
				myphoto.transferTo(new File(path+"\\"+fileName));
				
				//db insert
				uservice.insertUser(dto);
			} catch (IllegalStateException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			return "/login/loginform";

				
			//return "redirect:list";
			
		}
		
		//나의 정보로 이동
		@GetMapping("/user/myinfo")
		public String myinfo(Model model)
		{
			List<UserDto> list=uservice.getAllUsers();
			
			model.addAttribute("list", list);
			
			return "/user/myinfo";
		}
		
		
		//삭제
		@GetMapping("/user/userdelete")
		@ResponseBody
		public void deleteMember(@RequestParam String unum)
		{
			uservice.deleteUser(unum);
		}
		
		
		//info에서 사진만 수정

		@PostMapping("/user/userupdatephoto")
		@ResponseBody

		public void photoUpload(String unum,MultipartFile photo,HttpSession session)
		{
			//업로드될 경로구하기
			String path=session.getServletContext().getRealPath("/photo");
			
			//파일명구하기
			SimpleDateFormat sdf=new SimpleDateFormat("yyyyMMddHHmmss");
			String fileName="f_"+sdf.format(new Date())+photo.getOriginalFilename();
			
			try {
				photo.transferTo(new File(path+"\\"+fileName));
				session.setAttribute("loginphoto", fileName);  //세션의 사진변경

			} catch (IllegalStateException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
		}
		//수정폼에 출력할 데이터 반환
		@GetMapping("/user/userupdateform")
		@ResponseBody
		public UserDto getData(String unum)
		{
			return uservice.getDataByUnum(unum);
		}
		
		//수정
		@PostMapping("/member/userupdate")
		@ResponseBody
		public void update(UserDto dto,HttpSession session)
		{
			uservice.updateUser(dto);
			
			//세션에 저장된 이름 변경
			session.setAttribute("loginname", dto.getName());
		}
		
}
