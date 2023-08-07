package kr.co.helf.service;

import java.util.List;
import java.util.Optional;

import org.springframework.stereotype.Service;

import kr.co.helf.mapper.OrderMapper;
import kr.co.helf.vo.Category;
import kr.co.helf.vo.Membership;
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

	public Optional<Membership> getMembershipByNo(int no) {
		Membership membership = orderMapper.getMembershipByNo(no);
		return Optional.of(membership);
	}

	public Optional<Category> getCategortyByNo(int no) {
		Category category = orderMapper.getCategoryByNo(no);
		
		return Optional.of(category);
	}
}
