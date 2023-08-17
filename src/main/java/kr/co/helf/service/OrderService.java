package kr.co.helf.service;

import static kr.co.helf.controller.OrderEnum.*;

import java.time.LocalDate;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Optional;

import org.springframework.beans.BeanUtils;
import org.springframework.stereotype.Service;

import kr.co.helf.form.AddOrderForm;
import kr.co.helf.mapper.OrderMapper;
import kr.co.helf.vo.Membership;
import kr.co.helf.vo.MembershipJoinCategory;
import kr.co.helf.vo.MyMembership;
import kr.co.helf.vo.MyOption;
import kr.co.helf.vo.Option;
import kr.co.helf.vo.OptionDetail;
import kr.co.helf.vo.OptionJoinDetail;
import kr.co.helf.vo.Order;
import kr.co.helf.vo.Period;
import kr.co.helf.vo.PointHistory;
import kr.co.helf.vo.Rank;
import kr.co.helf.vo.User;
import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class OrderService {

	private final OrderMapper orderMapper;
	
	public List<Membership> getAllMembership() {
		return orderMapper.getMemberships();
	}

	public List<Period> getAllPeriodByType(String type) {
		return orderMapper.getPeriodsByType(type);
	}

	public Period getPeriodByNo(int no) {
		Period period =  orderMapper.getPeriodByNo(no);
		if(period == null) {
			throw new RuntimeException();
		}
		return period;
	}

	public MembershipJoinCategory getMembershipJoinCatByNo(int no) {
		MembershipJoinCategory membershipJoinCat = orderMapper.getMembershipJoinCatByNo(no);
		Optional<MembershipJoinCategory> optionalMembershipJoinCat = Optional.of(membershipJoinCat);
		membershipJoinCat = 
					optionalMembershipJoinCat.orElseThrow(() -> new RuntimeException("번호에 해당하는 이용권이 없다."));
		
		return membershipJoinCat;
	}

	public List<OptionJoinDetail> getAllOptionJoinDetail() {
		List<OptionJoinDetail> optionDetails = orderMapper.getOptionJoinDetails();
		return optionDetails;
	}

	public OptionJoinDetail getOptionJoinDetailByNo(int no) {
		OptionJoinDetail joinDetail = orderMapper.getOptionJoinDetailByNo(no);
		if(joinDetail == null) {
			throw new RuntimeException();
		}
		return joinDetail;
	}

	public List<Option> getOptions() {
		return orderMapper.getOptions();
	}

	public void setOneDay(MembershipJoinCategory catProperty, AddOrderForm form, User user) {
		Period onePeriod = orderMapper.getPeriodsByOne(catProperty.getCatProperty());
		
		if(onePeriod == null) {
			throw new RuntimeException();
		}
		
		form.setPeriodNo(onePeriod.getNo());
		form.setPeriodDuration(onePeriod.getDuration());
		form.setRemainderCnt(onePeriod.getProperty());
		
		Rank rank = getRankByNo(user.getRank().getNo());
		int savePoint = (int)(form.getMembershipDefaltPrice() *rank.getPointRate());
		form.setSavePoint(savePoint);
		
		form.setMembershipPrice(form.getMembershipDefaltPrice());
		form.surtax(form.getLockerPrice(), form.getWearPrice());
		form.membershipOptionPrice(form.getLockerPrice(), form.getWearPrice());
		form.totalPrice(form.getMembershipOptionPrice(), form.getSurtax());
	}

	public void updateUser(AddOrderForm form, User user) {
		if(form.getUsePoint() != 0) {
			user.setPoint(user.getPoint() - form.getUsePoint());
			orderMapper.updateUserById(user);
		}
		
		int savePoint = (int)form.getSavePoint();
		user.setPoint(user.getPoint() + savePoint);
		
		orderMapper.updateUserById(user);
	}

	public void insertOrder(AddOrderForm form, User user) {
		// 내 이용권 
		MyMembership myMembership = new MyMembership();
		
		BeanUtils.copyProperties(form, myMembership);
		
		myMembership.setUser(user);
		Period period = orderMapper.getPeriodByNo(form.getPeriodNo());
		myMembership.setPeriod(period);
		Membership membership = orderMapper.getMembershipByNo(form.getMembershipNo());
		myMembership.setMembership(membership);
		myMembership.setState(WAITING.getOrderEnum());
		
		if(form.getStartDate().isEqual(LocalDate.now())) {
			myMembership.setState(POSSIBILITY.getOrderEnum());
		}
		orderMapper.insertMyMembership(myMembership);
		
		// 내 옵션
		if(form.getLockerPeriod() != 0) {
			MyOption myOptionLocker = new MyOption();
			
			BeanUtils.copyProperties(form, myOptionLocker);
			myOptionLocker.setMyMembership(myMembership);
			myOptionLocker.setEndDate(form.getLockerEndDate());
			myOptionLocker.setDuration(form.getLockerPeriod());
			OptionDetail optionDetail = orderMapper.getOptionDetailByNo(form.getLockerNo());
			myOptionLocker.setOptionDetail(optionDetail);
			
			orderMapper.insertMyOption(myOptionLocker);
		}
		
		if(form.getWearPeriod() != 0) {
			MyOption myOptionWear = new MyOption();
			
			BeanUtils.copyProperties(form, myOptionWear);
			myOptionWear.setMyMembership(myMembership);
			myOptionWear.setEndDate(form.getWearEndDate());
			myOptionWear.setDuration(form.getWearPeriod());
			OptionDetail optionDetail = orderMapper.getOptionDetailByNo(form.getWearNo());
			myOptionWear.setOptionDetail(optionDetail);
			
			orderMapper.insertMyOption(myOptionWear);
		}
		
		// 결제 
		Order order = new Order();

		BeanUtils.copyProperties(form, order);
		order.setOptionPrice(form.getLockerPrice() + form.getWearPrice());
		order.setUser(user);
		order.setMyMembership(myMembership);
			
		// 포인트 내역
		if(form.getUsePoint() != 0) {
			PointHistory pointHistory = new PointHistory();
			
			BeanUtils.copyProperties(form, pointHistory);
			pointHistory.setUser(user);
			orderMapper.insertHistory(pointHistory);
			order.setPointHistory(pointHistory);
		}
		orderMapper.insertOrder(order);
	}

	public Rank getRankByNo(int no) {
		return orderMapper.getRankByNo(no);
	}

	public void checkUseMyMembership(int no, String id) {
		Map<String, Object> map = new HashMap<>();
		map.put("no", no);
		map.put("id", id);
		
		List<MyMembership> useMyMembership = orderMapper.getUseMyMembershipByNoById(map);
		
		if(!useMyMembership.isEmpty()) {
			throw new RuntimeException("이미 구매하신 이용권입니다.");
		}
	}

	public void getMyMembershipStartToday() {
		List<MyMembership> todayStartMyMemberships = orderMapper.getMyMembershipStartToday();
		
		for(MyMembership todayStartMyMembership : todayStartMyMemberships) {
			todayStartMyMembership.setState(POSSIBILITY.getOrderEnum());
			orderMapper.updateMyMembership(todayStartMyMembership);
		}
	}

	public void getMyMembershipEndToday() {
		List<MyMembership> todayEndMyMemberships = orderMapper.getMyMembershipEndToday();
		
		for(MyMembership todayEndMyMembership : todayEndMyMemberships) {
			todayEndMyMembership.setState(IMPOSSIBILITY.getOrderEnum());
			orderMapper.updateMyMembership(todayEndMyMembership);
		}
	}

	public void getMyOptionEndToday() {
		List<MyOption> todayEndMyOptions = orderMapper.getMyOptionEndToday();
		
		for(MyOption todayEndMyOption : todayEndMyOptions) {
			todayEndMyOption.setState(IMPOSSIBILITY.getOrderEnum());
			orderMapper.updateMyOption(todayEndMyOption);
		}
	}
}
