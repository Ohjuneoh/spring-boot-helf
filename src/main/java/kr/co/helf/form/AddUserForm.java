package kr.co.helf.form;

import java.util.Date;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Pattern;
import javax.validation.constraints.Size;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class AddUserForm {

	@NotBlank(message = "아이디를 입력하세요.")
	@Size(min = 5, max = 20, message = "아이디는 5~20자 입력이 가능합니다.")
	private String id;
	
	@NotBlank(message = "비밀번호를 입력하세요.")
	@Size(min = 8, max = 20, message = "비밀번호는 8~20자 입력이 가능합니다.")
	private String password;
	
	@NotBlank(message = "이메일을 입력하세요.")
	@Pattern(regexp = "^(?:\\w+\\.?)*\\w+@(?:\\w+\\.)+\\w+$", message = "이메일 형식이 올바르지 않습니다.")
	private String email;
	
	@NotBlank(message = "이름을 입력하세요.")
	@Pattern(regexp = "^[가-힣a-zA-Z]+$", message = "이름은 한글과 영문 대소문자만 입력 가능합니다.")
	@Size(min = 2, max = 20, message = "이름은 2~20자 입력이 가능합니다.")
	private String name;
	
	private String gender;
	
	@NotBlank(message = "전화번호를 입력하세요.")
	private String tel;
	
	private String mobileCarrier;
	
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date createDate;
	
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date updateDate;
	
	
}
