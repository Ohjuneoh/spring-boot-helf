package kr.co.helf.form;

import java.util.Date;
import java.util.List;

import javax.validation.constraints.NotBlank;

import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.web.multipart.MultipartFile;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
@NoArgsConstructor
public class AddUserForm {

	//트레이너 가입 2단계 파라미터 값
	List<String> careerNames;
	List<String> careerStartDates;
	List<String> careerEndDates;
	private MultipartFile photofile;
	
	
	@NotBlank(message = "아이디는 필수")
	private String id;
	
	private String password;
	
	private String email1;
	
	private String email2;
	
	private String name;
	
	private String gender;
	
	private String tel;
	
	private String mobileCarrier;
	
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date createDate;
	
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date updateDate;
	
}
