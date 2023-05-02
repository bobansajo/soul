package boot.data.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import boot.data.dto.StoryDto;

@Mapper
public interface StoryMapperInter {
	
	public void insertStory(StoryDto dto);
	public List<Map<String, String>> selectStoryFollow(String unum);
	public List<StoryDto> selectOneStory(String unum);
}
