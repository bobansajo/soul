package boot.data.service;

import java.util.List;
import java.util.Map;

import boot.data.dto.StoryDto;

public interface StoryServiceInter {

	public void insertStory(StoryDto dto);
	public List<Map<String, String>> selectStoryFollow(String unum);
	public List<StoryDto> selectOneStory(String unum);
}
