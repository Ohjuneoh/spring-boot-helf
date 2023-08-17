package kr.co.helf.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.co.helf.vo.MyMembership;

@Mapper
public interface MembershipMapper {

	List<MyMembership> getMyMembershipById(String id);

}
