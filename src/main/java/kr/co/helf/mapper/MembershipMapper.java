package kr.co.helf.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import kr.co.helf.dto.OrderJoin;
import kr.co.helf.form.OrderSearchForm;
import kr.co.helf.vo.Category;
import kr.co.helf.vo.Membership;
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

	List<OrderJoin> getOrdersById(Map<String, Object> map);

	PointHistory getPointHistoryByNo(int no);

	OrderJoin getOrderByNo(int no);

	int getTotalRows(Map<String, Object> map);

	List<Category> getCategorys();

	void insertMembership(Membership membership);

	Category getcategoryByNo(int no);
}
