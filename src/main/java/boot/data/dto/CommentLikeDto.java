package boot.data.dto;

import org.apache.ibatis.type.Alias;

import lombok.Data;

@Data
@Alias("CommentLikeDto")
public class CommentLikeDto {
	private String clnum;
	private String unum;
	private String cnum;
}
