package kr.co.helf.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.co.helf.vo.Membership;

@Mapper
public interface MembershipDao {

	List<Membership> getMemberships();
}
