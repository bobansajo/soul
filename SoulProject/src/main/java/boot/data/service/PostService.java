package boot.data.service;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import boot.data.dto.PostDto;
import boot.data.mapper.PostMapperInter;
@Service
public class PostService implements PostServiceInter {

	
	@Autowired
	PostMapperInter mapperInter;
	
	@Override
	public int getTotalCount() {
		// TODO Auto-generated method stub
		return mapperInter.getTotalCount();
	}

	@Override
	public PostDto getData(String num) {
		// TODO Auto-generated method stub
		return mapperInter.getData(num);
	}

	@Override
	public int getMaxNum() {
		// TODO Auto-generated method stub
		return mapperInter.getMaxNum();
	}

	@Override
	public List<PostDto> getList(int start, int perpage) {
		// TODO Auto-generated method stub
		Map<String, Integer> map= new HashMap<>();
		map.put("start", start);
		map.put("perpage", perpage);
		
		return mapperInter.getList(map);
	}

	@Override
	public void insertPost(PostDto dto) {
		// TODO Auto-generated method stub
		mapperInter.insertPost(dto);
	}

}
