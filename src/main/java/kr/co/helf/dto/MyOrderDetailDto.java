package kr.co.helf.dto;

import java.util.List;

import kr.co.helf.vo.MyOption;
import kr.co.helf.vo.Order;
import lombok.Data;

@Data
public class MyOrderDetailDto {

	private Order order;
	List<MyOption> myOptions; 
}
