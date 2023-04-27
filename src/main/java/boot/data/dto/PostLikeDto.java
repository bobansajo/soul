package boot.data.dto;

import org.apache.ibatis.type.Alias;

import lombok.Data;

@Data
@Alias("PostLikeDto")
public class PostLikeDto {
	private String plnum;
	private String unum;
	private String pnum;
}
