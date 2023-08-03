package kr.co.helf.service;

import java.util.List;

import org.springframework.stereotype.Service;

import kr.co.helf.mapper.MembershipDao;
import kr.co.helf.vo.Membership;
import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class MembershipService {

	private final MembershipDao membershipDao;
	
	public List<Membership> getAllMembership() {
		List<Membership> memberships = membershipDao.getMemberships();
		return memberships;
	}
}
