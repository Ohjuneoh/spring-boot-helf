package kr.co.helf.form;

import java.util.Date;

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
	
	// 트레이너 두번째 폼
	private MultipartFile photofile;
	private String careerName;
	private Date careerStartDate;
	private Date careerEndDate;
}
