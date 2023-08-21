package kr.co.helf.dto;

import java.util.List;

import kr.co.helf.vo.Order;
import lombok.Data;

@Data
public class OrderListDto {

	private List<Order> order;
	private Pagination paginaiton;
}
