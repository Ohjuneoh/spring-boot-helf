package kr.co.helf.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.co.helf.vo.MyMembership;
import kr.co.helf.vo.MyOption;
import kr.co.helf.vo.Option;
import kr.co.helf.vo.Order;
import kr.co.helf.vo.PointHistory;

@Mapper
public interface MembershipMapper {

	List<MyMembership> getMyMembershipById(String id);

	List<MyOption> getMyOptions(int no);

	Option getOptionByNo(int no);

	Order getOrderByMyMembershipNo(int no);

	void updateOrder(Order order);

	MyMembership getUseMyMembershipByNo(int no);
	
	MyMembership getMyMembershipByNo(int no);

	void updateMyMembership(MyMembership myMembership);

	List<Order> getOrdersById(String id);

	PointHistory getPointHistoryByNo(int no);

	Order getOrderByNo(int no);
}
