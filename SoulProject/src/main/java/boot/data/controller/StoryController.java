package boot.data.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import boot.data.dto.StoryDto;
import boot.data.service.StoryService;
import boot.data.service.UserService;

@Controller
public class StoryController {

	@Autowired
	StoryService sservice;
	
	@Autowired
	UserService uservice;
	
	@GetMapping("/story/list")
	public ModelAndView storyList(@RequestParam String unum)
	{
		ModelAndView model=new ModelAndView();
		
		//선택한 사용자의 스토리 리스트
		List<StoryDto> storyList=sservice.selectOneStory(unum);
		//스토리 리스트 길이
		int storyListCount=storyList.size();
		
		//저장
		model.addObject("storyList",storyList);
		model.addObject("storyListCount",storyListCount);
		
		model.setViewName("layout2/story/storylist");
		
		return model;
	}
}
