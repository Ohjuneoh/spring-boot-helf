package kr.co.helf.dto;

import java.util.List;

import lombok.Data;

@Data
public class MembershipListDto {

	private List<MembershipJoinCategory> membershipList;
	private Pagination pagination;
}
