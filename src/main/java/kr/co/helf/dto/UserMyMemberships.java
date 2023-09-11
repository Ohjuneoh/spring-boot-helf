package kr.co.helf.dto;


import org.apache.ibatis.type.Alias;

import kr.co.helf.vo.Membership;
import kr.co.helf.vo.MyMembership;
import lombok.Data;

@Data
@Alias("UserMyMemberships")
public class UserMyMemberships {
	
	private MyMembership myMembership;
	private Membership membership;
}
