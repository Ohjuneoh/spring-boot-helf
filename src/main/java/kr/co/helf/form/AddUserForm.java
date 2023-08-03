package kr.co.helf.form;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class AddUserForm {

	private String id;
	private String password;
	private String email;
	private String name;
	private String gender;
	private String tel;
	private String mobileCarrier;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date createDate;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date updateDate;
	
}
