package kr.co.helf.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import kr.co.helf.dto.MyMembershipListDto;
import kr.co.helf.dto.OrderJoin;
import kr.co.helf.dto.OrderListDto;
import kr.co.helf.dto.Pagination;
import kr.co.helf.form.OrderSearchForm;
import kr.co.helf.mapper.MembershipMapper;
import kr.co.helf.mapper.OrderMapper;
import kr.co.helf.vo.Membership;
import kr.co.helf.vo.MyMembership;
import kr.co.helf.vo.MyOption;
import kr.co.helf.vo.Option;
import kr.co.helf.vo.OptionDetail;
import kr.co.helf.vo.Order;
import kr.co.helf.vo.Period;
import kr.co.helf.vo.PointHistory;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Service
@RequiredArgsConstructor
@Slf4j
public class MembershipService {

	private final MembershipMapper membershipMapper;
	private final OrderMapper orderMapper;
	
	public List<MyMembershipListDto> getMyMembershipById(String id) {
		
		List<MyMembershipListDto> list = new ArrayList<>();
		
		List<MyMembership> myMemberships = membershipMapper.getMyMembershipById(id);
		
		if(!myMemberships.isEmpty()) {
			for(MyMembership myMembership : myMemberships) {
				Membership membership = orderMapper.getMembershipByNo(myMembership.getMembership().getNo());
				myMembership.setMembership(membership);
				
				Period period = orderMapper.getPeriodByNo(myMembership.getPeriod().getNo());
				myMembership.setPeriod(period);
				
				List<MyOption> myOptions = getMyOptions(myMembership.getNo());
				
				MyMembershipListDto dto = new MyMembershipListDto();
				dto.setMyMembership(myMembership);
				dto.setMyOptions(myOptions);
				
				list.add(dto);
			}
		}
		return list;
	}

	public List<MyOption> getMyOptions(int no) {
		List<MyOption> myOptions = membershipMapper.getMyOptions(no);
		
		if(!myOptions.isEmpty()) {
			for(MyOption myOption : myOptions) {
				OptionDetail detail = orderMapper.getOptionDetailByNo(myOption.getOptionDetail().getNo());
				Option option = membershipMapper.getOptionByNo(detail.getOption().getNo());
				
				detail.setOption(option);
				myOption.setOptionDetail(detail);
			}
		}
		
		return myOptions;
	}

	public Order getOrderByMyMembershipNo(int no) {
		Order order = membershipMapper.getOrderByMyMembershipNo(no);
		
		if(order == null) {
			throw new RuntimeException();
		}
		
		return order;
	}

	public void updateOrder(Order order) {
		membershipMapper.updateOrder(order);
	}

	public MyMembership getUseMyMembershipByNo(int no) {
		MyMembership myMembership = membershipMapper.getUseMyMembershipByNo(no);

		if(myMembership == null) {
			throw new RuntimeException();
		}
		
		return myMembership;
	}

	public void updateMyMembership(MyMembership myMembership) {
		membershipMapper.updateMyMembership(myMembership);
	}

	public OrderListDto getOrdersById(Map<String, Object> map) {
		
		OrderSearchForm form = (OrderSearchForm) map.get("form");
		
		int totalRows = membershipMapper.getTotalRows(form);
		Pagination pagination = new Pagination(form.getPage(), totalRows);

		map.put("begin", pagination.getBegin());
		map.put("end", pagination.getEnd());
		
		System.out.println(map);
		
		List<OrderJoin> orders = membershipMapper.getOrdersById(map);
		
//		if(orders.isEmpty()) {
//			throw new RuntimeException();
//		}
		
		OrderListDto orderList = new OrderListDto();
		orderList.setOrders(orders);
		orderList.setPagination(pagination);
		
		return orderList;
	}

	public Order getOrderByNo(int no) {
		Order order = membershipMapper.getOrderByNo(no);
		
		if(order == null) {
			throw new RuntimeException("구매내역이 없습니다.");
		}
		
		MyMembership myMembership = membershipMapper.getMyMembershipByNo(order.getMyMembership().getNo());
		
		if(myMembership != null) {
			Membership membership = orderMapper.getMembershipByNo(myMembership.getMembership().getNo());
			myMembership.setMembership(membership);
			
			Period period = orderMapper.getPeriodByNo(myMembership.getPeriod().getNo());
			myMembership.setPeriod(period);
			
			order.setMyMembership(myMembership);
		}
		
		if(order.getPointHistory() != null) {
			PointHistory pointHistory = membershipMapper.getPointHistoryByNo(order.getPointHistory().getNo());
			order.setPointHistory(pointHistory);
		}
		
		return order;
	}

}
