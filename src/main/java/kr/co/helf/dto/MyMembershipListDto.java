package kr.co.helf.dto;

import java.util.List;

import kr.co.helf.vo.MyMembership;
import kr.co.helf.vo.MyOption;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class MyMembershipListDto {

	MyMembership myMembership;
	List<MyOption> myOptions;
}
