package boot.data.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import boot.data.dto.StoryDto;
import boot.data.mapper.StoryMapperInter;

@Service
public class StoryService implements StoryServiceInter{

	@Autowired
	StoryMapperInter mapperInter;

	@Override
	public void insertStory(StoryDto dto) {
		// TODO Auto-generated method stub
		mapperInter.insertStory(dto);
	}

	@Override
	public List<Map<String, String>> selectStoryFollow(String unum) {
		// TODO Auto-generated method stub
		return mapperInter.selectStoryFollow(unum);
	}

	@Override
	public List<StoryDto> selectOneStory(String unum) {
		// TODO Auto-generated method stub
		return mapperInter.selectOneStory(unum);
	}
}
