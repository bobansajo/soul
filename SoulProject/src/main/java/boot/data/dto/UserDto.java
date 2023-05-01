package boot.data.dto;

import org.apache.ibatis.type.Alias;

import lombok.Data;

@Data
@Alias("UserDto")
public class UserDto {
	private String unum;
	private String id;
	private String pass;
	private String hp;
	private String email;
	private String name;
	private String userphoto;
}
