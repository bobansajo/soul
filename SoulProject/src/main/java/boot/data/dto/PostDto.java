package boot.data.dto;

import java.sql.Timestamp;

import org.apache.ibatis.type.Alias;

import lombok.Data;

@Data
@Alias("PostDto")
public class PostDto {
	private String pnum;
	private String content;
	private String photo;
	private Timestamp writeday;
	private String unum;
}
