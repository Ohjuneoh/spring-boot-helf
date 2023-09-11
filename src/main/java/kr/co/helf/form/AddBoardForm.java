package kr.co.helf.form;

import kr.co.helf.vo.User;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
@NoArgsConstructor
public class AddBoardForm {

	private String title;
	private String content;
	private String main;

}
