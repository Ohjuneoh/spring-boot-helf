package kr.co.helf.form;

import org.apache.ibatis.type.Alias;

import lombok.Data;

@Data
@Alias("addMembershipForm")
public class AddMembershipForm {

	private String name;
	private int price;
	private int no;
	private String description;
}
