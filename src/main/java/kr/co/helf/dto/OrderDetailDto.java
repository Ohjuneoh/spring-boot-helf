package kr.co.helf.dto;

import java.util.List;

import kr.co.helf.vo.MyOption;
import kr.co.helf.vo.Refund;
import lombok.Data;

@Data
public class OrderDetailDto {

	private OrderJoin orderJoin;
	List<MyOption> myOptions;
	Refund refund;
}
