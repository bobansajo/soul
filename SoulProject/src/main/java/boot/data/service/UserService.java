package boot.data.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import boot.data.dto.UserDto;
import boot.data.mapper.UserMapperInter;
@Service
public class UserService implements UserServiceInter {

	@Autowired
	UserMapperInter umapper;

	@Override
	public List<UserDto> getAllUsers() {
		// TODO Auto-generated method stub
		return umapper.getAllUsers();
	}

	@Override
	public void insertUser(UserDto dto) {
		// TODO Auto-generated method stub
		umapper.insertUser(dto);
	}

	@Override
	public int getSearchId(String id) {
		// TODO Auto-generated method stub
		return umapper.getSearchid(id);
	}

	@Override
	public String getName(String id) {
		// TODO Auto-generated method stub
		return umapper.getName(id);
	}

	@Override
	public int LoginIdPassCheck(String id, String pass) {
		Map<String, String> map=new HashMap<>();
		map.put(id, id);
		map.put(pass, pass);
		return umapper.LoginIdPassCheck(map);
	}

	@Override
	public UserDto getDataById(String id) {
		return umapper.getDataById(id);
	}

	@Override
	public void deleteUser(String unum) {
		
			umapper.deleteUser(unum);;
	}

	@Override
	public void updateUserPhoto(String unum, String userphoto) {
		Map<String, String> map =new HashMap<>();
		
		map.put(unum, unum);
		map.put(userphoto, userphoto);
		
		umapper.updateUserPhoto(map);
	}

	@Override
	public void updateUser(UserDto dto) {
		umapper.updateUser(dto);
	}

	@Override
	public UserDto getDataByUnum(String unum) {
		return umapper.getDataByUnum(unum);
	}
	
	
}
