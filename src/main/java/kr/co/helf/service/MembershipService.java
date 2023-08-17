package kr.co.helf.service;

import java.util.List;

import org.springframework.stereotype.Service;

import kr.co.helf.mapper.MembershipMapper;
import kr.co.helf.mapper.OrderMapper;
import kr.co.helf.vo.Membership;
import kr.co.helf.vo.MyMembership;
import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class MembershipService {

	private final MembershipMapper membershipMapper;
	private final OrderMapper orderMapper;
	
	public List<MyMembership> getMyMembershipById(String id) {
		List<MyMembership> myMemberships = membershipMapper.getMyMembershipById(id);
		
		for(MyMembership myMembership : myMemberships) {
			Membership membership = orderMapper.getMembershipByNo(myMembership.getMembership().getNo());
			myMembership.setMembership(membership);
		}
		
		return myMemberships;
	}

}
