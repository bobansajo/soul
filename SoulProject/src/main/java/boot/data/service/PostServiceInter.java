package boot.data.service;

import java.util.List;

import boot.data.dto.PostDto;

public interface PostServiceInter {

	public int getTotalCount(); //총갯수
	public PostDto getData(String num); //번호값
	public int getMaxNum(); //글올리고 바로 이동가능
	public List<PostDto> getList(int start, int perpage); // 리스트
	public void insertPost(PostDto dto); //insert
	
}
