package kr.co.helf.vo;

import org.apache.ibatis.type.Alias;

import lombok.Data;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@Data
@Alias("cat")
public class Category {

	private int no;
	private String name;
	private String property;
	private String useOption;
}
