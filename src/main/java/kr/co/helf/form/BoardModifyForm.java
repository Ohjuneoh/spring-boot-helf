package kr.co.helf.form;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@NoArgsConstructor
@ToString
public class BoardModifyForm {

	private int no;
	private String title;
	private String content;
	private int main;
	
}
