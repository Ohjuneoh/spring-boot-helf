package kr.co.helf.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Service;

import kr.co.helf.dto.MyMembershipListDto;
import kr.co.helf.mapper.MembershipMapper;
import kr.co.helf.mapper.OrderMapper;
import kr.co.helf.vo.Membership;
import kr.co.helf.vo.MyMembership;
import kr.co.helf.vo.MyOption;
import kr.co.helf.vo.Option;
import kr.co.helf.vo.OptionDetail;
import kr.co.helf.vo.Order;
import kr.co.helf.vo.Period;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Service
@RequiredArgsConstructor
@Slf4j
public class MembershipService {

	private final MembershipMapper membershipMapper;
	private final OrderMapper orderMapper;
	
	public List<MyMembershipListDto> getMyMembershipById(String id) {
		
		List<MyMembershipListDto> list = new ArrayList<>();
		
		List<MyMembership> myMemberships = membershipMapper.getMyMembershipById(id);
		
		if(!myMemberships.isEmpty()) {
			for(MyMembership myMembership : myMemberships) {
				Membership membership = orderMapper.getMembershipByNo(myMembership.getMembership().getNo());
				myMembership.setMembership(membership);
				
				Period period = orderMapper.getPeriodByNo(myMembership.getPeriod().getNo());
				myMembership.setPeriod(period);
				
				List<MyOption> myOptions = getMyOptions(myMembership.getNo());
				
				MyMembershipListDto dto = new MyMembershipListDto();
				dto.setMyMembership(myMembership);
				dto.setMyOptions(myOptions);
				
				list.add(dto);
			}
		}
		return list;
	}

	public List<MyOption> getMyOptions(int no) {
		List<MyOption> myOptions = membershipMapper.getMyOptions(no);
		
		if(!myOptions.isEmpty()) {
			for(MyOption myOption : myOptions) {
				OptionDetail detail = orderMapper.getOptionDetailByNo(myOption.getOptionDetail().getNo());
				Option option = membershipMapper.getOptionByNo(detail.getOption().getNo());
				
				detail.setOption(option);
				myOption.setOptionDetail(detail);
			}
		}
		
		return myOptions;
	}

	public Order getOrderByMyMembershipNo(int no) {
		Order order = membershipMapper.getOrderByMyMembershipNo(no);
		
		if(order == null) {
			throw new RuntimeException();
		}
		
		return order;
	}

	public void updateOrder(Order order) {
		membershipMapper.updateOrder(order);
	}

	public MyMembership getMyMembershipByNo(int no) {
		MyMembership myMembership = membershipMapper.getMyMembershipByNo(no);

		if(myMembership == null) {
			throw new RuntimeException();
		}
		
		return myMembership;
	}

	public void updateMyMembership(MyMembership myMembership) {
		membershipMapper.updateMyMembership(myMembership);
	}

}
