package boot.data.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import boot.data.dto.UserDto;

@Mapper
public interface UserMapperInter {

	public List<UserDto> getAllUsers();
	public void insertUser(UserDto dto);
	public int getSearchid(String id);
	public String getName(String id);
	public int LoginIdPassCheck(Map<String, String>  map);
	public UserDto getDataById(String id);
	public void deleteUser(String num);
	public void updateUserPhoto(Map<String, String> map);
	public void updateUser(UserDto dto);
	public UserDto getDataByUnum(String num);

	
}
