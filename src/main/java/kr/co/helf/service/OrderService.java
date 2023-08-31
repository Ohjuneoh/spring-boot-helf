package kr.co.helf.service;

import static kr.co.helf.enums.MembershipEnum.*;

import java.time.LocalDate;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Optional;

import org.springframework.beans.BeanUtils;
import org.springframework.stereotype.Service;

import kr.co.helf.dto.MembershipJoinCategory;
import kr.co.helf.dto.OptionJoinDetail;
import kr.co.helf.form.AddOrderForm;
import kr.co.helf.mapper.OrderMapper;
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
					optionalMembershipJoinCat.orElseThrow(() -> new RuntimeException());
		
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
		form.surtax();
		form.membershipOptionPrice();
		form.totalPrice();
	}

	public void updateUserByOrder(AddOrderForm form, User user) {
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
		myMembership.setState(WAITING.getMembershiEnum());
		
		if(form.getStartDate().isEqual(LocalDate.now())) {
			myMembership.setState(POSSIBILITY.getMembershiEnum());
		}
		orderMapper.insertMyMembership(myMembership);
		
		// 내 옵션
		if(form.getLockerPrice() != 0) {
			MyOption myOptionLocker = new MyOption();
			
			myOptionLocker.setPrice(form.getLockerPrice());
			myOptionLocker.setMyMembership(myMembership);
			OptionDetail optionDetail = orderMapper.getOptionDetailByNo(form.getLockerNo());
			myOptionLocker.setOptionDetail(optionDetail);
			
			orderMapper.insertMyOption(myOptionLocker);
		}
		
		if(form.getWearPrice() != 0) {
			MyOption myOptionWear = new MyOption();
			
			myOptionWear.setPrice(form.getWearPrice());
			myOptionWear.setMyMembership(myMembership);
			OptionDetail optionDetail = orderMapper.getOptionDetailByNo(form.getWearNo());
			myOptionWear.setOptionDetail(optionDetail);
			
			orderMapper.insertMyOption(myOptionWear);
		}
		
		// 결제 
		Order order = new Order();

		BeanUtils.copyProperties(form, order);
		order.setUser(user);
		order.setMyMembership(myMembership);
		orderMapper.insertOrder(order);

		// 포인트 내역
		// 사용 포인트
		if(form.getUsePoint() != 0) {
			PointHistory usePoint = new PointHistory();
			
			BeanUtils.copyProperties(form, usePoint);
			usePoint.setUser(user);
			usePoint.setType(PAYMENT.getMembershiEnum());
			usePoint.setOrder(order);
			orderMapper.insertHistory(usePoint);
		}
		
		// 적립 포인트
		PointHistory savePoint = new PointHistory();
		savePoint.setUsePoint(form.getSavePoint());
		savePoint.setUser(user);
		savePoint.setType(SAVEPOINT.getMembershiEnum());
		savePoint.setOrder(order);
		orderMapper.insertHistory(savePoint);
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
			throw new RuntimeException();
		}
	}

	public void getMyMembershipStartToday() {
		List<MyMembership> todayStartMyMemberships = orderMapper.getMyMembershipStartToday();
		
		for(MyMembership todayStartMyMembership : todayStartMyMemberships) {
			todayStartMyMembership.setState(POSSIBILITY.getMembershiEnum());
			orderMapper.updateMyMembership(todayStartMyMembership);
		}
	}

	public void getMyMembershipEndToday() {
		List<MyMembership> todayEndMyMemberships = orderMapper.getMyMembershipEndToday();
		
		for(MyMembership todayEndMyMembership : todayEndMyMemberships) {
			todayEndMyMembership.setState(IMPOSSIBILITY.getMembershiEnum());
			orderMapper.updateMyMembership(todayEndMyMembership);
		}
	}
}
