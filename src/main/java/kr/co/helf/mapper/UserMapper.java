package kr.co.helf.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.co.helf.vo.User;

@Mapper
public interface UserMapper {
	
	User getUserById(String id);

	void insertUser(User user);
	
	// 입장시 회원 휴대폰 네 자리로 조회 - 채경 
	List<User> getUsersByDigits(String fourDigits);

	void insertTrainer(User user);
	
	int idCheck (String userId);
}
