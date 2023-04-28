package boot.data.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import boot.data.dto.PostDto;

@Mapper
public interface PostMapperInter {
	
	public int getTotalCount(); //총갯수
	public PostDto getData(String num); //번호값
	public int getMaxNum(); //글올리고 바로 이동가능
	public void insertPost(PostDto dto); //insert
	public List<PostDto> getList(Map<String,Integer> map);
}
