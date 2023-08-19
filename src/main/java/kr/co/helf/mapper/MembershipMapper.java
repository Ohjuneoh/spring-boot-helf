package kr.co.helf.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.co.helf.vo.MyMembership;
import kr.co.helf.vo.MyOption;
import kr.co.helf.vo.Option;
import kr.co.helf.vo.Order;

@Mapper
public interface MembershipMapper {

	List<MyMembership> getMyMembershipById(String id);

	List<MyOption> getMyOptions(int no);

	Option getOptionByNo(int no);

	Order getOrderByMyMembershipNo(int no);

	void updateOrder(Order order);

	MyMembership getMyMembershipByNo(int no);

	void updateMyMembership(MyMembership myMembership);
}
