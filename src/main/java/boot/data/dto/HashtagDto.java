package boot.data.dto;

import org.apache.ibatis.type.Alias;

import lombok.Data;

@Data
@Alias("HashtagDto")
public class HashtagDto {
	private String hnum;
	private String hashname;
	private String pnum;
}
