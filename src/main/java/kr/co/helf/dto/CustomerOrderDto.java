package kr.co.helf.dto;

import kr.co.helf.vo.MyOption;
import kr.co.helf.vo.Order;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class CustomerOrderDto {

	Order order;
	MyOption myOption;
}
