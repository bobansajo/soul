package boot.data.dto;

import org.apache.ibatis.type.Alias;

import lombok.Data;

@Data
@Alias("BestfriendDto")
public class BestfriendDto {
	private String bestnum;
	private String unum;
	private String bfunum;
}
