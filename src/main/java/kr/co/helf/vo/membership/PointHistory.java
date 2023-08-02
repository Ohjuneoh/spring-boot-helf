package kr.co.helf.vo.membership;

import java.util.Date;

import kr.co.helf.vo.User;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class PointHistory {

	private int no;
	private int usePoint;
	private Date userDate;
	private User user;
}
