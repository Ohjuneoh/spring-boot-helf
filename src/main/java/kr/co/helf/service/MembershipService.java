package kr.co.helf.service;

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
import kr.co.helf.dto.OrderDetailDto;
import kr.co.helf.dto.OrderJoin;
import kr.co.helf.dto.OrderListDto;
import kr.co.helf.dto.Pagination;
import kr.co.helf.exception.MembershipException;
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

	public OrderDetailDto getOrderDetailByNo(int no) {
		OrderJoin orderJoin = membershipMapper.getOrderJoinByNo(no);
		
		if(orderJoin == null) {
			throw new RuntimeException("주문번호에 해당하는 구매내역이 없습니다.");
		}
		
		Period period = orderMapper.getPeriodByNo(orderJoin.getPeriod().getNo());
		orderJoin.setPeriod(period);
		
		List<PointHistory> points = membershipMapper.getPointHistoryByOrderNo(orderJoin.getNo());
		orderJoin.setPoints(points);
		
		OrderDetailDto dto = new OrderDetailDto();
		dto.setOrderJoin(orderJoin);
		
		List<MyOptionJoinDto> myOptions = getMyOptions(orderJoin.getMyMembershipNo());
		dto.setMyOptionJoins(myOptions);
		if(!orderJoin.isPayment()) {
			Refund refund = getRefundByOrderNo(orderJoin.getNo());
			dto.setRefund(refund);
		}
		
		return dto;
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
		
		if(membership.yesDeleted()) {
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
		if(form.isDeleted()) {
			membership.setDeleteDate(LocalDate.now());
		}
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
		Refund check = membershipMapper.getRefundMyMembershipNo(no);
		if(check != null) {
			throw new RuntimeException("해당 이용권은 이미 환불처리가 완료된 이용권입니다.");
		}
		
		Order order = membershipMapper.getOrderByMyMembershipNo(no);
		OrderJoin orderJoin = membershipMapper.getOrderJoinByNo(order.getNo());
		Period period = orderMapper.getPeriodByNo(orderJoin.getPeriod().getNo());

		int totalPrice = orderJoin.getTotalPrice();
		int surtax = orderJoin.getSurtax();

		Refund refund = new Refund();
		if(period.isPeriod()) {
			LocalDate start = orderJoin.getStartDate();
			LocalDate end = orderJoin.getEndDate();
			
			refund.periodAmount(start, end, totalPrice, surtax);
		}
		
		if(period.isTime()) {
			int remainCnt = orderJoin.getRemainderCnt();
			int totalCnt = period.getProperty();
			
			refund.timeAmount(totalPrice, surtax, remainCnt, totalCnt);
		}
		refund.setOrder(order);
		membershipMapper.insertRefundByNo(refund);
	}

	@Transactional
	public void cancleRefund(int no) {
		Order order = membershipMapper.getOrderByNo(no);
		
		if(order == null) {
			throw new RuntimeException("번호에 해당하는 주문내역이 존재하지 않습니다.");
		}
		
		order.setPayment();
		membershipMapper.updateOrder(order);
		
		List<MyMembershipJoinDto> useMyMemberships = membershipMapper.getMyMembershipsJoinById(order.getUser().getId());
		MyMembership myMembership = membershipMapper.getMyMembershipByNo(order.getMyMembership().getNo());
		
		for(MyMembershipJoinDto useMyMembership : useMyMemberships) {
			if(useMyMembership.getMembershipNo() == myMembership.getMembership().getNo()) {
				throw new MembershipException("현재 사용중인 이용권이 존재하기 때문에 환불취소가 불가합니다.");
			}
		}
		
		if(myMembership == null) {
			throw new RuntimeException("환불 취소를 진행할 이용권이 존재하지 않습니다.");
		}
		if(!myMembership.isImpossibility()) {
			throw new RuntimeException("이용권의 상태가 사용불가가 아니므로 해당 이용권은 환불 요청을 신청한 이용권이 아닙니다.");
		}
		
		myMembership.setPossibility();
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
		List<Integer> paymentPointNoList = orderList.stream()
				.filter(order -> order.isPaymentPoint())
				.map(RefundOrderPoint::getPointNo)
				.collect(Collectors.toList());
		if(!paymentPointNoList.isEmpty()) {
			updatePointHistoryState(paymentPointNoList, REFUNDPOINT.getValue());
		}
		
		List<Integer> getbackPointNoList = orderList.stream()
				.filter(order -> order.isSavePoint())
				.map(RefundOrderPoint::getPointNo)
				.collect(Collectors.toList());
		System.out.println(getbackPointNoList);
		updatePointHistoryState(getbackPointNoList, GETBACKPOINT.getValue());
	}
	
	private void updatePointHistoryState(List<Integer> pointNoList, String type) {
		Map<String, Object> map = new HashMap<>();
		map.put("type", type);
		map.put("pointNoList", pointNoList);
		membershipMapper.updateRefundPointState(map);
	}

	private void updateRefundState(List<RefundOrderPoint> orderList) {
		List<Integer> refundNoList = orderList.stream()
				.map(RefundOrderPoint::getRefundNo)
				.distinct()
				.collect(Collectors.toList());
		membershipMapper.updateRefundState(refundNoList);
	}

	private void updateRefundOrder(List<RefundOrderPoint> orderList) {
		for(RefundOrderPoint order : orderList) {
			if(order.isRefundCompleted()) {
				throw new MembershipException("이미 환불이 완료된 상품입니다.");
			}
		}

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
					// 환불 요청을 한 회원에 대한 RefundOrderPoint 객체
					List<RefundOrderPoint> userPoints = pointMap.get(key);
					
					// 회수할 포인트 + 돌려줄 포인트
					int point = userPoints.stream()
							.mapToInt(this::convertPointByType)
							.sum();
					
					int userRemainPoint = userPoints.get(0).getUserPoint();
					int minusPoint = userRemainPoint + point;
					if(minusPoint < 0) {
						minusPoint = 0;
						changeRefundAmount(userPoints, point);
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
	
	private void changeRefundAmount(List<RefundOrderPoint> userList, int point) {
		for(RefundOrderPoint user : userList) {
			int newRefundAmount = user.getRefundAmount() + point;
			
			Map<String, Integer> map = new HashMap<>();
			map.put("refundNo", user.getRefundNo());
			map.put("newRefundAmount", newRefundAmount);
			membershipMapper.updateRefundAmount(map);
		}
	}

	private int convertPointByType(RefundOrderPoint orderPoint) {
		if(orderPoint.isSavePoint()) {
			return orderPoint.getPointUse() * -1;
		}
		
		return orderPoint.getPointUse();
	}

	@Transactional
	public void updateWaitRefund(int no, String userId) {
		getRefundMyMembershipByNo(no, userId);
		updateRefundMyMembership(no);
		updateRefundOrder(no);
		insertRefund(no);
	}
	
	
	public MyMembership getRefundMyMembershipByNo(int no, String userId) {
		MyMembership myMembership = membershipMapper.getMyMembershipByNo(no);
		if(myMembership.isImpossibility()) {
			throw new RuntimeException("해당 이용권은 현재 사용할 수 없기 때문에 환불요청이 불가합니다.");
		}
		
		if(myMembership.remainPeriod() <= 30) {
			throw new MembershipException("환불요청 기간이 지났습니다.");
		}
		
		if(!myMembership.isUserId(userId)) {
			throw new RuntimeException("이용권을 구매한 본인만 환불요청이 가능합니다.");
		}
		
		return myMembership;
	}

	public void updateRefundMyMembership(int no) {
		MyMembership myMembership = membershipMapper.getMyMembershipByNo(no);
		myMembership.setImpossibility();

		membershipMapper.updateMyMembership(myMembership);
	}

	public void updateRefundOrder(int no) {
		Order order = membershipMapper.getOrderByMyMembershipNo(no);
		
		if(order == null) {
			throw new RuntimeException("내 이용권 번호에 해당하는 주문내역이 존재하지 않습니다.");
		}
		
		order.setWaitRefund();
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
