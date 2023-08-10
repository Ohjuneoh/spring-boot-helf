package kr.co.helf.service;

import java.util.List;
import java.util.Optional;

import org.springframework.stereotype.Service;

import kr.co.helf.mapper.OrderMapper;
import kr.co.helf.vo.Category;
import kr.co.helf.vo.Membership;
import kr.co.helf.vo.MembershipJoinCategory;
import kr.co.helf.vo.Option;
import kr.co.helf.vo.OptionJoinDetaile;
import kr.co.helf.vo.Period;
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

	public Optional<Period> getPeriodByNo(int no) {
		Period period =  orderMapper.getPeriodByNo(no);
		return Optional.of(period);
	}

	public Optional<MembershipJoinCategory> getMembershipByNo(int no) {
		MembershipJoinCategory membershipJoinCat = orderMapper.getMembershipJoinCatByNo(no);
		return Optional.of(membershipJoinCat);
	}

	public Optional<Category> getCategortyByNo(int no) {
		Category category = orderMapper.getCategoryByNo(no);
		
		return Optional.of(category);
	}

	public List<OptionJoinDetaile> getAllOptionDetaile() {
		List<OptionJoinDetaile> optionDetailes = orderMapper.getOptionDetailes();
		return optionDetailes;
	}

	public Optional<OptionJoinDetaile> getOptionDetaileByNo(int no) {
		OptionJoinDetaile detaile =  orderMapper.getOptionDetaileByNo(no);
		return Optional.of(detaile);
	}

	public List<Option> getOptions() {
		return orderMapper.getOptions();
	}

	public Period getPeriodsByOne(String catProperty) {
		return orderMapper.getPeriodsByOne(catProperty);
	}
}
