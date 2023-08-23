package kr.co.helf.dto;

import java.util.List;

import kr.co.helf.vo.MyOption;
import lombok.Data;

@Data
public class MyOrderDetailDto {

	private OrderJoin orderJoin;
	List<MyOption> myOptions; 
}
