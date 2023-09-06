package kr.co.helf.form;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
@NoArgsConstructor
public class UpdateUserForm {

	
	private String password;
	
	private String email1;
	
	private String email2;
	
	private String tel;
	
	private String mobileCarrier;
	
}
