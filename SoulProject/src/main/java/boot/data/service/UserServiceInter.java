package boot.data.service;

import java.util.List;

import boot.data.dto.UserDto;

public interface UserServiceInter {
	public List<UserDto> getAllUsers();
	public void insertUser(UserDto dto);
	public int getSearchId(String id);
	public String getName(String id);
	public int LoginIdPassCheck(String id, String pass);
	public UserDto getDataById(String id);
	public void deleteUser(String unum);
	public void updateUserPhoto(String unum, String userphoto);
	public void updateUser(UserDto dto);
	public UserDto getDataByUnum(String unum);
}
