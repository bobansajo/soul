package boot.data.dto;

import org.apache.ibatis.type.Alias;

import lombok.Data;

@Data
@Alias("FollowerDto")
public class FollowerDto {
	private String fwernum;
	private String unum;
	private String fwnum;
}
