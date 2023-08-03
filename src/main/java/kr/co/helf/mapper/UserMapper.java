package kr.co.helf.mapper;

import org.apache.ibatis.annotations.Mapper;

import kr.co.helf.vo.User;

@Mapper
public interface UserMapper {
	
	User getUserById(String id);

	void insertUser(User user);

	void insertTrainer(User user);

}
