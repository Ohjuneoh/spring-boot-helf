package kr.co.helf.form;

import org.springframework.web.multipart.MultipartFile;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
@NoArgsConstructor
public class AddInquiryForm {

	private int no;
	private String type;
	private String title;
	private String secret;
	private MultipartFile photofile;
	private String content;
}
