package kr.co.helf.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.BeanUtils;
import org.springframework.stereotype.Service;

import ch.qos.logback.core.joran.util.beans.BeanUtil;
import kr.co.helf.dto.MyMembershipListDto;
import kr.co.helf.dto.OrderJoin;
import kr.co.helf.dto.OrderListDto;
import kr.co.helf.dto.Pagination;
import kr.co.helf.form.AddMembershipForm;
import kr.co.helf.form.OrderSearchForm;
import kr.co.helf.mapper.MembershipMapper;
import kr.co.helf.mapper.OrderMapper;
import kr.co.helf.vo.Category;
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

	public OrderListDto getOrdersById(int page, Map<String, Object> map) {
		
		int totalRows = membershipMapper.getTotalRows(map);
		Pagination pagination = new Pagination(page, totalRows);

		map.put("begin", pagination.getBegin());
		map.put("end", pagination.getEnd());
		
		List<OrderJoin> orders = membershipMapper.getOrdersById(map);
		
		OrderListDto orderList = new OrderListDto();
		orderList.setOrders(orders);
		orderList.setPagination(pagination);
		
		return orderList;
	}

	public OrderJoin getOrderByNo(int no) {
		OrderJoin orderJoin = membershipMapper.getOrderByNo(no);
		
		if(orderJoin == null) {
			throw new RuntimeException("구매내역이 없습니다.");
		}
		
		Period period = orderMapper.getPeriodByNo(orderJoin.getPeriod().getNo());
		orderJoin.setPeriod(period);
			
		if(orderJoin.getPointHistory() != null) {
			PointHistory pointHistory = membershipMapper.getPointHistoryByNo(orderJoin.getPointHistory().getNo());
			orderJoin.setPointHistory(pointHistory);
		}
		
		return orderJoin;
	}

	public List<Category> getAllCategory() {
		return membershipMapper.getCategorys();
	}

	public void addMembership(AddMembershipForm form) {
		
		Membership membership = new Membership();
		Category cat = membershipMapper.getcategoryByNo(form.getNo());
		
		BeanUtils.copyProperties(form, membership);
		membership.setCategory(cat);
		
		membershipMapper.insertMembership(membership);
	}

}
