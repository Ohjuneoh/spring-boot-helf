package kr.co.helf.service;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import static kr.co.helf.controller.MembershipEnum.*;

import org.springframework.beans.BeanUtils;
import org.springframework.stereotype.Service;

import kr.co.helf.dto.MembershipJoinCategory;
import kr.co.helf.dto.MembershipListDto;
import kr.co.helf.dto.MyMembershipListDto;
import kr.co.helf.dto.OrderJoin;
import kr.co.helf.dto.OrderListDto;
import kr.co.helf.dto.Pagination;
import kr.co.helf.form.AddMembershipForm;
import kr.co.helf.form.ModifyMembershipForm;
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
import kr.co.helf.vo.Refund;
import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class MembershipService {

	private final MembershipMapper membershipMapper;
	private final OrderMapper orderMapper;
	
	public List<MyMembershipListDto> getMyMembershipListById(String id) {
		
		List<MyMembershipListDto> list = new ArrayList<>();
		
		List<MyMembership> myMemberships = membershipMapper.getMyMembershipsById(id);
		
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

	public MyMembership getMyMembershipByNo(int no) {
		MyMembership myMembership = membershipMapper.getMyMembershipByNo(no);

		if(myMembership == null) {
			throw new RuntimeException();
		}
		
		return myMembership;
	}

	public void updateMyMembership(MyMembership myMembership) {
		membershipMapper.updateMyMembership(myMembership);
	}

	public OrderListDto getOrdersById(int page, Map<String, Object> map) {
		
		int totalRows = membershipMapper.getOrderByIdTotalRow(map);
		Pagination pagination = new Pagination(page, totalRows);

		map.put("begin", pagination.getBegin());
		map.put("end", pagination.getEnd());
		
		List<OrderJoin> orders = membershipMapper.getOrdersById(map);
		
		OrderListDto orderList = new OrderListDto();
		orderList.setOrders(orders);
		orderList.setPagination(pagination);
		
		return orderList;
	}

	public OrderJoin getOrderDetailByNo(int no) {
		OrderJoin orderJoin = membershipMapper.getOrderJoinByNo(no);
		
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

	public MembershipListDto getAllMembership(Map<String, Object> param) {
		
		MembershipListDto dto = new MembershipListDto();
		
		int totalRow = membershipMapper.getMembershipTotalRow(param);
		int page = (int) param.get("page");
		Pagination pagination = new Pagination(page, totalRow);
		dto.setPagination(pagination);
		
		int begin = pagination.getBegin();
		int end = pagination.getEnd();
		param.put("begin", begin);
		param.put("end", end);
		
		List<MembershipJoinCategory> list = membershipMapper.getMemberships(param);
		dto.setMembershipList(list);
		
		return dto;
	}

	public MembershipJoinCategory getMembershipByNo(int no) {
		MembershipJoinCategory membership = orderMapper.getMembershipJoinCatByNo(no);
		if(membership == null) {
			throw new RuntimeException();
		}
		
		return membership;
	}

	public void deleteMembershipByNo(int no) {
		
		Membership membership = orderMapper.getMembershipByNo(no);
		
		if(membership == null) {
			throw new RuntimeException("이용권이 존재하지 않습니다.");
		}
		
		if(YES.getMembershiEnum().equals(membership.getDeleted())) {
			throw new RuntimeException("이미 삭제된 이용권입니다.");
		}
		
		membership.setDeleted(YES.getMembershiEnum());
		membership.setDeleteDate(LocalDate.now());
		
		membershipMapper.updateMembership(membership);
	}

	public void updateMembershipByNo(ModifyMembershipForm form) {
		
		Membership membership = orderMapper.getMembershipByNo(form.getNo());
		BeanUtils.copyProperties(form, membership);
		
		System.out.println(membership);
		
		membershipMapper.updateMembership(membership);
	}

	public OrderListDto getAllRefund(Map<String, Object> param) {
		
		OrderListDto dto = new OrderListDto();
		int page = (int) param.get("page");
		
		int totalRow = membershipMapper.getOrderTotalRow(param);
		Pagination pagination = new Pagination(page, totalRow);
		dto.setPagination(pagination);
		
		List<OrderJoin> refundList = membershipMapper.getOrders(param);
		dto.setOrders(refundList);
		
		return dto;
	}

	public void insertRefund(Order order) {
		Refund refund = new Refund();
		refund.setOrder(order);
		
		membershipMapper.insertRefundByNo(refund);
	}

	public Order getOrderByNo(int no) {
		Order order = membershipMapper.getOrderByNo(no);
		
		if(order == null) {
			throw new RuntimeException();
		}
		
		return order;
	}

	public void updateOrderByNo(Order order) {
		membershipMapper.updateOrder(order);
	}

	public void deleteRefund(int no) {
		membershipMapper.deleteRefund(no);
	}
}
