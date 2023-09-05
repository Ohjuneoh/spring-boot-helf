package kr.co.helf.dto;

import java.util.List;

import kr.co.helf.vo.Refund;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class OrderDetailDto {

	private OrderJoin orderJoin;
	private List<MyOptionJoinDto> myOptionJoins;
	private Refund refund;
}
