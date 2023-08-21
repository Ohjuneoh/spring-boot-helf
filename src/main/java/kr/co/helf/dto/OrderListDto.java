package kr.co.helf.dto;

import java.util.List;

import org.apache.ibatis.type.Alias;

import lombok.Data;

@Data
@Alias("orderListDto")
public class OrderListDto {

	private List<OrderJoin> orders;
	private Pagination pagination;
}
