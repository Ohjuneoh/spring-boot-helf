package kr.co.helf.form;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

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
	
	private MultipartFile photofile;
	
	private List<String> updateCareerNames;
	
	private List<String> updateCareerStartDates;
	
	private List<String> updateCareerEndDates;
	
	private List<String> updateCareerNo;
	
}
