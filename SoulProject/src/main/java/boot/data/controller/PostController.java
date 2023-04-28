package boot.data.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import boot.data.dto.PostDto;
import boot.data.dto.UserDto;
import boot.data.mapper.PostMapperInter;
import boot.data.service.PostService;
import boot.data.service.UserService;

@Controller
public class PostController {

	
	@Autowired
	PostMapperInter mapper;
	
	@Autowired
	PostService service;
	
	@Autowired
	UserService uservice;
	

	@PostMapping("/user/insert")
	public String insert(@ModelAttribute PostDto dto, 
			@RequestParam ArrayList<MultipartFile> upload,
			HttpSession session)
	{
		//세션에 로그인한 아이디 얻기
		String myid=(String)session.getAttribute("myid");
		
		//아이디 넘겨서 num값 얻기
		String usernum = uservice.getDataById(myid).getUnum();
		
		dto.setUnum(usernum);
		
		String path= session.getServletContext().getRealPath("photo");
		
		System.out.println(path);
		
		String uploadName="";
		
		int idx=1;
		
		if(upload.get(0).getOriginalFilename().equals(""))
			uploadName="no";
		else {
			for(MultipartFile f:upload)
			{
				SimpleDateFormat sdf= new SimpleDateFormat("yyyyMMddHHmmss");
				String fName=idx++ +"_"+sdf.format(new Date())+"_"+f.getOriginalFilename();
				uploadName+=fName+","; //누적
				
				//업로드
				try {
					f.transferTo(new File(path+"\\"+fName));
				} catch (IllegalStateException | IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				
			}
			
			//마지막 컴마제거
			uploadName=uploadName.substring(0, uploadName.length()-1);
		}
		
		dto.setPhoto(uploadName);		
		mapper.insertPost(dto);
		
		
		return "/timeline/timelinemain";
	}
	
}
