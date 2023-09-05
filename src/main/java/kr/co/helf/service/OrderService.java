package kr.co.helf.service;

import java.time.LocalDate;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

import org.springframework.beans.BeanUtils;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

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
			throw new RuntimeException("해당 기간 데이터가 존재하지 않습니다.");
		}
		return period;
	}

	public MembershipJoinCategory getMembershipJoinCatByNo(int no) {
		MembershipJoinCategory membershipJoinCat = orderMapper.getMembershipJoinCatByNo(no);
		if(membershipJoinCat == null) {
			throw new RuntimeException("번호에 해당하는 기본 이용권 정보가 없습니다.");
		}
		
		return membershipJoinCat;
	}

	public List<OptionJoinDetail> getAllOptionJoinDetail() {
		return orderMapper.getOptionJoinDetails();
	}

	public OptionJoinDetail getOptionJoinDetailByNo(int no) {
		OptionJoinDetail joinDetail = orderMapper.getOptionJoinDetailByNo(no);
		if(joinDetail == null) {
			throw new RuntimeException("번호에 해당하는 옵션 정보가 없습니다.");
		}
		return joinDetail;
	}

	public List<Option> getOptions() {
		return orderMapper.getOptions();
	}

	@Transactional
	public void setOneDay(MembershipJoinCategory catProperty, AddOrderForm form, User user) {
		Period onePeriod = orderMapper.getPeriodsByOne(catProperty.getCatProperty());
		
		if(onePeriod == null) {
			throw new RuntimeException("하루 이용권에 해당하는 기간 정보가 없습니다.");
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
		
		int savePoint = form.getSavePoint();
		user.setPoint(user.getPoint() + savePoint);
		
		orderMapper.updateUserById(user);
	}

	@Transactional
	public void insertOrder(AddOrderForm form, User user) {
		// 내 이용권 
		MyMembership myMembership = new MyMembership();
		addMyMembership(form, myMembership, user);
		
		// 내 옵션
		if(form.getLockerPrice() != 0) {
			MyOption myOptionLocker = new MyOption();
			addMyOption(form.getLockerPrice(), form.getLockerNo(), myMembership, myOptionLocker);
		}
		
		if(form.getWearPrice() != 0) {
			MyOption myOptionWear = new MyOption();
			addMyOption(form.getWearPrice(), form.getWearNo(), myMembership, myOptionWear);
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
			usePoint.setPaymentPoint();
			addPointHistory(usePoint, user, order, form.getUsePoint());
		}
		
		// 적립 포인트
		PointHistory savePoint = new PointHistory();
		savePoint.setSavePoint();
		addPointHistory(savePoint, user, order, form.getSavePoint());
	}

	private void addPointHistory(PointHistory usePoint, User user, Order order, int point) {
		usePoint.setUsePoint(point);
		usePoint.setUser(user);
		usePoint.setOrder(order);
		orderMapper.insertHistory(usePoint);
	}

	private void addMyOption(int price, int no, MyMembership myMembership, MyOption myOption) {
		myOption.setPrice(price);
		myOption.setMyMembership(myMembership);
		OptionDetail optionDetail = orderMapper.getOptionDetailByNo(no);
		myOption.setOptionDetail(optionDetail);
		
		orderMapper.insertMyOption(myOption);
	}

	private void addMyMembership(AddOrderForm form, MyMembership myMembership, User user) {
		BeanUtils.copyProperties(form, myMembership);
		
		myMembership.setUser(user);
		Period period = orderMapper.getPeriodByNo(form.getPeriodNo());
		myMembership.setPeriod(period);
		Membership membership = orderMapper.getMembershipByNo(form.getMembershipNo());
		myMembership.setMembership(membership);
		myMembership.setWaitState();
		
		if(form.getStartDate().isEqual(LocalDate.now())) {
			myMembership.setPossibility();
		}
		orderMapper.insertMyMembership(myMembership);
	}

	public Rank getRankByNo(int no) {
		return orderMapper.getRankByNo(no);
	}

	public MyMembership checkUseMyMembership(int no, String id) {
		Map<String, Object> map = new HashMap<>();
		map.put("no", no);
		map.put("id", id);
		
		return orderMapper.getUseMyMembershipByNoById(map);
	}

	public void getMyMembershipStartToday() {
		List<MyMembership> todayStartMyMemberships = orderMapper.getMyMembershipStartToday();
		
		List<Integer> noList = todayStartMyMemberships.stream()
				.map(MyMembership::getNo)
				.collect(Collectors.toList());
		orderMapper.updateStartMyMemberships(noList);
	}

	public void getMyMembershipEndToday() {
		List<MyMembership> todayEndMyMemberships = orderMapper.getMyMembershipEndToday();
		List<Integer> noList = todayEndMyMemberships.stream()
				.map(MyMembership::getNo)
				.collect(Collectors.toList());
		orderMapper.updateEndMyMemberships(noList);
	}
}
