package kr.co.helf.service;

import static kr.co.helf.enums.MembershipEnum.*;
import static kr.co.helf.enums.OrderStateEnum.*;
import static kr.co.helf.enums.PointHistorySateEnum.*;

import java.time.*;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

import org.springframework.beans.BeanUtils;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.co.helf.dto.MembershipJoinCategory;
import kr.co.helf.dto.MembershipListDto;
import kr.co.helf.dto.MyMembershipJoinDto;
import kr.co.helf.dto.MyOptionJoinDto;
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
import kr.co.helf.vo.Order;
import kr.co.helf.vo.Period;
import kr.co.helf.vo.PointHistory;
import kr.co.helf.vo.Refund;
import kr.co.helf.vo.RefundOrderPoint;
import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class MembershipService {

	private final MembershipMapper membershipMapper;
	private final OrderMapper orderMapper;
	
	@Transactional
	public List<MyMembershipJoinDto> getMyMembershipListById(String id) {
		
		List<MyMembershipJoinDto> myMemberships = membershipMapper.getMyMembershipsJoinById(id);
		
		for(MyMembershipJoinDto myMembership : myMemberships) {
			List<MyOptionJoinDto> myOptions = getMyOptions(myMembership.getNo());
			
			myMembership.setMyOptionJoins(myOptions);
		}
		
		return myMemberships;
	}

	public List<MyOptionJoinDto> getMyOptions(int no) {

		return membershipMapper.getMyOptionJoins(no);
	}

	public Order getOrderByMyMembershipNo(int no) {
		Order order = membershipMapper.getOrderByMyMembershipNo(no);
		
		if(order == null) {
			throw new RuntimeException("내 이용권 번호에 해당하는 구매내역이 존재하지 않습니다.");
		}
		
		return order;
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
			throw new RuntimeException("주문번호에 해당하는 구매내역이 없습니다.");
		}
		
		Period period = orderMapper.getPeriodByNo(orderJoin.getPeriod().getNo());
		orderJoin.setPeriod(period);
		
		List<PointHistory> points = membershipMapper.getPointHistoryByOrderNo(orderJoin.getNo());
		orderJoin.setPoints(points);
		
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
			throw new RuntimeException("번호에 해당하는 기본 이용권 정보가 없습니다.");
		}
		
		return membership;
	}

	public void deleteMembershipByNo(int no) {
		
		Membership membership = orderMapper.getMembershipByNo(no);
		
		if(membership == null) {
			throw new RuntimeException("번호에 해당하는 기본 이용권이 존재하지 않습니다.");
		}
		
		if("Y".equals(membership.getDeleted())) {
			throw new RuntimeException("이미 삭제된 이용권입니다.");
		}
		
		membership.setDeleted("Y");
		membership.setDeleteDate(LocalDate.now());
		
		membershipMapper.updateMembership(membership);
	}

	public void updateMembershipByNo(ModifyMembershipForm form) {
		
		Membership membership = orderMapper.getMembershipByNo(form.getNo());
		membership.setName(form.getName());
		membership.setDeleted(form.getDeleted());
		membership.setPrice(form.getPrice());
		Category cat = membershipMapper.getcategoryByNo(form.getCatNo());
		membership.setCategory(cat);
		membership.setDescription(form.getDescription());
		
		membershipMapper.updateMembership(membership);
	}

	public OrderListDto getAllRefund(Map<String, Object> param) {
		
		OrderListDto dto = new OrderListDto();
		int page = (int) param.get("page");
		
		int totalRow = membershipMapper.getOrderTotalRow(param);
		Pagination pagination = new Pagination(page, totalRow);
		dto.setPagination(pagination);
		int begin = pagination.getBegin();
		int end = pagination.getEnd();
		param.put("begin", begin);
		param.put("end", end);
		
		List<OrderJoin> refundList = membershipMapper.getOrders(param);
		dto.setOrders(refundList);
		
		return dto;
	}

	@Transactional
	public void insertRefund(int no) {
		Refund check = membershipMapper.getRefundByOrderNo(no);
		if(check != null) {
			throw new RuntimeException("해당 이용권은 이미 환불처리가 완료된 이용권입니다.");
		}
		
		Order order = membershipMapper.getOrderByMyMembershipNo(no);
		OrderJoin orderJoin = membershipMapper.getOrderJoinByNo(order.getNo());
		Period period = orderMapper.getPeriodByNo(orderJoin.getPeriod().getNo());

		int totalPrice = orderJoin.getTotalPrice();
		int surtax = orderJoin.getSurtax();

		Refund refund = new Refund();
		if(period.getType().equals(PERIOD.getValue())) {
			LocalDate start = orderJoin.getStartDate();
			LocalDate end = orderJoin.getEndDate();
			
			int amount = refund.periodAmount(start, end, totalPrice, surtax);
			refund.setAmount(amount);
			System.out.println(amount);
		}
		
		if(period.getType().equals(TIME.getValue())) {
			int remainCnt = orderJoin.getRemainderCnt();
			int totalCnt = period.getProperty();
			
			int amount = refund.timeAmount(totalPrice, surtax, remainCnt, totalCnt);
			refund.setAmount(amount);
			System.out.println(amount);
		}
		refund.setOrder(order);
		membershipMapper.insertRefundByNo(refund);
	}

	public void cancleRefund(int no) {
		Order order = membershipMapper.getOrderByNo(no);
		
		if(order == null) {
			throw new RuntimeException("번호에 해당하는 주문내역이 존재하지 않습니다.");
		}
		
		order.setState(PAYMENT.getValue());
		membershipMapper.updateOrder(order);
		
		MyMembership myMembership = membershipMapper.getMyMembershipByNo(order.getMyMembership().getNo());
		
		if(myMembership == null) {
			throw new RuntimeException();
		}
		if(!IMPOSSIBILITY.getValue().equals(myMembership.getState())) {
			throw new RuntimeException("이용권의 상태가 사용불가가 아니므로 해당 이용권은 환불 요청을 신청한 이용권이 아닙니다.");
		}
		
		myMembership.setState(POSSIBILITY.getValue());
		membershipMapper.updateMyMembership(myMembership);
		
		membershipMapper.deleteRefund(order.getNo());
	}

	public void deleteRefund(int no) {
		membershipMapper.deleteRefund(no);
	}

	public OrderJoin getRefundDetailByNo(int no) {
		OrderJoin orderJoin = membershipMapper.getRefundDetailByNo(no);
		if(orderJoin == null) {
			throw new RuntimeException("번호에 해당하는 주문내역이 존재하지 않습니다.");
		}
		
		List<PointHistory> points = membershipMapper.getPointHistoryByOrderNo(orderJoin.getNo());
		orderJoin.setPoints(points);
		
		return orderJoin;
	}

	@Transactional
	public void refundApproved(List<Integer> noList) {
		List<RefundOrderPoint> orderList = membershipMapper.getOrderByNoList(noList);
		
		// 회원 포인트 업데이트
		updateUser(orderList);
		
		// Order 상태 변경
		updateRefundOrder(orderList);
		
		// Refund상태 변경
		updateRefundState(orderList);
		
		// 포인트 상태 변경 시작
		List<Integer> paymentPointIds = orderList.stream()
				.filter(order -> order.isPaymentPoint())
				.map(RefundOrderPoint::getPointNo)
				.collect(Collectors.toList());
		updatePointHistoryState(paymentPointIds, REFUNDPOINT.getValue());
		
		List<Integer> getbackPointIds = orderList.stream()
				.filter(order -> order.isSavePoint())
				.map(RefundOrderPoint::getPointNo)
				.collect(Collectors.toList());
		updatePointHistoryState(getbackPointIds, GETBACKPOINT.getValue());
	}
	
	private void updatePointHistoryState(List<Integer> ids, String value) {
		Map<String, Object> paymentMap = new HashMap<>();
		paymentMap.put("type", value);
		paymentMap.put("pointIds", ids);
		membershipMapper.updateRefundPointState(paymentMap);
		
	}

	private void updateRefundState(List<RefundOrderPoint> orderList) {
		List<Integer> refundNoList = orderList.stream()
				.map(RefundOrderPoint::getRefundNo)
				.distinct()
				.collect(Collectors.toList());
		membershipMapper.updateRefundState(refundNoList);
	}

	private void updateRefundOrder(List<RefundOrderPoint> orderList) {
		List<Integer> orderIds = orderList.stream()
				.map(RefundOrderPoint::getOrderId)
				.distinct()
				.collect(Collectors.toList());
		
		membershipMapper.updateRefundOrderState(orderIds);		
	}

	private void updateUser(List<RefundOrderPoint> orderList) {
		Map<String, List<RefundOrderPoint>> pointMap = orderList.stream()
				.collect(Collectors.groupingBy(RefundOrderPoint::getUserId));
				
				Map<String, Integer> userRefundPoints = new HashMap<>();
				for(String key : pointMap.keySet()) {
					List<RefundOrderPoint> userPoints = pointMap.get(key);
					
					int point = userPoints.stream()
					.mapToInt(this::convertPointByType)
					.sum();
					
					int userRemainPoint = userPoints.get(0).getUserPoint();
					int minusPoint = userRemainPoint + point;
					if(minusPoint < 0) {
						minusPoint = 0;
					}	
					
					userRefundPoints.put(key, minusPoint);
				}
				
				userRefundPoints.entrySet().forEach(entry->{
					Map<String, Object> param = new HashMap<>();
					param.put("id", entry.getKey());
					param.put("point", entry.getValue());
					
					membershipMapper.updateRefundUserPoint(param);
				});
		
	}

	private int convertPointByType(RefundOrderPoint orderPoint) {
		if(orderPoint.isSavePoint()) {
			return orderPoint.getPointUse() * -1;
		}
		
		return orderPoint.getPointUse();
	}

	public MyMembership getRefundMyMembershipByNo(int no) {
		MyMembership myMembership = membershipMapper.getMyMembershipByNo(no);
		if(IMPOSSIBILITY.getValue().equals(myMembership.getState())) {
			throw new RuntimeException("해당 이용권은 현재 사용할 수 없기 때문에 환불요청이 불가합니다.");
		}
		
		return myMembership;
	}

	public void updateRefundMyMembership(int no) {
		MyMembership myMembership = membershipMapper.getMyMembershipByNo(no);
		myMembership.setState(IMPOSSIBILITY.getValue());

		membershipMapper.updateMyMembership(myMembership);
	}

	public void updateRefundOrder(int no) {
		Order order = membershipMapper.getOrderByMyMembershipNo(no);
		
		if(order == null) {
			throw new RuntimeException("내 이용권 번호에 해당하는 주문내역이 존재하지 않습니다.");
		}
		
		order.setState(WAITREFUND.getValue());
		membershipMapper.updateOrder(order);
	}

	public Refund getRefundByOrderNo(int no) {
		Refund refund = membershipMapper.getRefundByOrderNo(no);
		if(refund == null) {
			throw new RuntimeException("주문내역에 해당하는 환불정보가 존재하지 않습니다.");
		}
		
		return refund;
	}
}
