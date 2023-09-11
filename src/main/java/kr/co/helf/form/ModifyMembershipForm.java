package kr.co.helf.form;

import org.apache.ibatis.type.Alias;

import lombok.Data;

@Data
@Alias("modifyMembershipForm")
public class ModifyMembershipForm {

	private int no;
	private String name;
	private String deleted;
	private int price;
	private int catNo;
	private String description;
	
	public boolean isDeleted() {
		return "Y".equals(this.deleted);
	}
}
