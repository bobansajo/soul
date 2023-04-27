package boot.data.dto;

import org.apache.ibatis.type.Alias;

import lombok.Data;

@Data
@Alias("StoryDto")
public class StoryDto {
	private String snum;
	private String photo;
	private String unum;
}
