package kr.co.helf.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.co.helf.vo.Category;
import kr.co.helf.vo.Membership;
import kr.co.helf.vo.MembershipJoinCategory;
import kr.co.helf.vo.Option;
import kr.co.helf.vo.OptionJoinDetaile;
import kr.co.helf.vo.Period;

@Mapper
public interface OrderMapper {

	List<Membership> getMemberships();

	List<Period> getPeriodsByType(String type);

	Period getPeriodsByOne(String type);

	Period getPeriodByNo(int no);

	MembershipJoinCategory getMembershipJoinCatByNo(int no);

	Category getCategoryByNo(int no);
	
	List<OptionJoinDetaile> getOptionDetailes();

	List<Option> getOptions(); 

	OptionJoinDetaile getOptionDetaileByNo(int no);
}
