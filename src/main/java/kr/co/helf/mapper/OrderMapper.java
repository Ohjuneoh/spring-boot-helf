package kr.co.helf.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import kr.co.helf.dto.CustomerOrderDto;
import kr.co.helf.dto.MembershipJoinCategory;
import kr.co.helf.dto.OptionJoinDetail;
import kr.co.helf.vo.Membership;
import kr.co.helf.vo.MyMembership;
import kr.co.helf.vo.MyOption;
import kr.co.helf.vo.Option;
import kr.co.helf.vo.OptionDetail;
import kr.co.helf.vo.Order;
import kr.co.helf.vo.Period;
import kr.co.helf.vo.PointHistory;
import kr.co.helf.vo.Rank;
import kr.co.helf.vo.User;

@Mapper
public interface OrderMapper {

	List<Membership> getMemberships();

	List<Period> getPeriodsByType(String type);

	Period getPeriodsByOne(String type);

	Period getPeriodByNo(int no);

	MembershipJoinCategory getMembershipJoinCatByNo(int no);

	List<OptionJoinDetail> getOptionJoinDetails();

	List<Option> getOptions(); 

	OptionJoinDetail getOptionJoinDetailByNo(int no);

	void updateUserById(User user);

	Membership getMembershipByNo(int membershipNo);

	OptionDetail getOptionDetailByNo(int lockerNo);
	
	void insertMyMembership(MyMembership myMembership);

	void insertHistory(PointHistory pointHistory);

	void insertMyOption(MyOption myOptionLocker);

	Rank getRankByNo(int no);

	void insertOrder(Order order);

	MyMembership getUseMyMembershipByNoById(Map<String, Object> map);

	void updateMyMembership(MyMembership myMembership);

	List<MyMembership> getMyMembershipStartToday();

	List<MyMembership> getMyMembershipEndToday();

	List<MyOption> getMyOptionEndToday(int no);
	
	// 고객별 상세 조회 (3)주문내역 - 채경
	List<CustomerOrderDto> getCustomerOrders(String id);
	
	// 고객별 상세 조회 (4)나의 이용권 내역 - 채경
	List<MyMembership> getCustomerMyMemberships(String id);

	List<Order> getMonthOrderById(String id);

	void updateStartMyMemberships(List<Integer> noList);
	
	void updateEndMyMemberships(List<Integer> noList);
}
