package kr.co.helf.vo;

import java.util.Date;

import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@Data
public class PointHistory {

	private int no;
	private int usePoint;
	private Date userDate;
	private User user;
}
