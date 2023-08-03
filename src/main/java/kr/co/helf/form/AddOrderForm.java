package kr.co.helf.form;

import java.util.Date;

import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@Data
public class AddOrderForm {

	private int no;
	private int period;
	private Date startDate;
	private Date endDate;
	private String optionA;
	private int DurationA;
	private String optionB;
	private int DurationB;
	private int usePoint;
	private int optionPrice;
	private int totalPrice;
}
