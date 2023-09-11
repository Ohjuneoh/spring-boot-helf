package kr.co.helf.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import kr.co.helf.dto.MembershipJoinCategory;
import kr.co.helf.dto.MyMembershipJoinDto;
import kr.co.helf.dto.MyOptionJoinDto;
import kr.co.helf.dto.OrderJoin;
import kr.co.helf.vo.Category;
import kr.co.helf.vo.Membership;
import kr.co.helf.vo.MyMembership;
import kr.co.helf.vo.Order;
import kr.co.helf.vo.PointHistory;
import kr.co.helf.vo.Refund;
import kr.co.helf.vo.RefundOrderPoint;

@Mapper
public interface MembershipMapper {

	List<MyMembershipJoinDto> getMyMembershipsJoinById(String id);

	List<MyOptionJoinDto> getMyOptionJoins(int no);

	Order getOrderByMyMembershipNo(int no);

	void updateOrder(Order order);

	MyMembership getMyMembershipByNo(int no);

	void updateMyMembership(MyMembership myMembership);

	List<OrderJoin> getOrdersById(Map<String, Object> map);

	PointHistory getPointHistoryByNo(int no);

	OrderJoin getOrderJoinByNo(int no);

	int getOrderByIdTotalRow(Map<String, Object> map);

	List<Category> getCategorys();

	void insertMembership(Membership membership);

	Category getcategoryByNo(int no);

	List<MembershipJoinCategory> getMemberships(Map<String, Object> param);

	int getMembershipTotalRow(Map<String, Object> param);

	void updateMembership(Membership updateMembership);

	List<OrderJoin> getOrders(String keyword);

	int getOrderTotalRow(Map<String, Object> param);

	List<OrderJoin> getOrders(Map<String, Object> param);

	void insertRefundByNo(Refund refund);

	Order getOrderByNo(int no);

	void deleteRefund(int no);

	OrderJoin getRefundDetailByNo(int no);

	Refund getRefundByNo(int refundNo);

	Refund getRefundByOrderNo(int no);

	void updateRefund(Refund refund);

	List<PointHistory> getPointHistoryByOrderNo(int no);

	void updatePointHistory(PointHistory point);

	List<RefundOrderPoint> getOrderByNoList(List<Integer> noList);

	void updateRefundUserPoint(Map<String, Object> param);
	
	void updateRefundOrderState(List<Integer> orderIds);
	
	void updateRefundPointState(Map<String, Object> param);

	void updateRefundState(List<Integer> refundNoList);
	
	void updateRefundAmount(Map<String, Integer> map);

	Refund getRefundMyMembershipNo(int no);
}
