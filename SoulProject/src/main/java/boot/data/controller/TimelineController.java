package boot.data.controller;


import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import boot.data.dto.StoryDto;
import boot.data.service.StoryService;
import boot.data.service.UserService;

@Controller
public class TimelineController {
	
	@Autowired
	UserService uservice;
	
	@Autowired
	StoryService sservie;

	@GetMapping("/timeline/main")
	public ModelAndView timeline(HttpSession session)
	{
		ModelAndView model=new ModelAndView();
		
		//로그인한 아이디로 사용자 unum 받아오기
		String myid=(String)session.getAttribute("myid");
		String unum=uservice.getDataById(myid).getUnum();
		
		//자신을 포함하여 팔로잉한 사람들 중 스토리를 올린 사람의 정보(unum,id,userphoto)를 가져오기
		List<Map<String, String>> storyList=sservie.selectStoryFollow(unum);
		
		//저장
		model.addObject("storyList",storyList);
		
		model.setViewName("/timeline/timelinemain");
		
		return model;
	}
	
	@PostMapping("/timeline/storyinsert")
	@ResponseBody
	public void storyInsert(MultipartFile upload,
			HttpSession session)
	{
		//로그인한 아이디로 사용자 unum 받아오기
		String myid=(String)session.getAttribute("myid");
		String unum=uservice.getDataById(myid).getUnum();
		
		//사진 저장하기
		//저장할 경로
		String path=session.getServletContext().getRealPath("/photo");
		
		//사진 이름
		String photoName=upload.getOriginalFilename();
		
		SimpleDateFormat sdf=new SimpleDateFormat("yyyyMMddhhmmss");
		//저장할 사진 이름(photo_시간_사진이름)
		String photo="photo_"+sdf.format(new Date())+"_"+photoName;
		
		//사진 저장
		try {
			upload.transferTo(new File(path+"\\"+photo));
		} catch (IllegalStateException | IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		//dto에 저장
		StoryDto dto=new StoryDto();
		dto.setPhoto(photo);
		dto.setUnum(unum);
		
		//insert
		sservie.insertStory(dto);
	}
}
