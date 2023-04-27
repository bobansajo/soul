package boot.data.dto;

import java.sql.Timestamp;

import org.apache.ibatis.type.Alias;

import lombok.Data;

@Data
@Alias("CommentDto")
public class CommentDto {
	private String cnum;
	private String content;
	private Timestamp writeday;
	private int regroup;
	private int restep;
	private int relevel;
	private String unum;
	private String pnum;
}
