package kr.co.helf.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.co.helf.vo.Career;
import kr.co.helf.vo.User;

@Mapper
public interface PersonalLessonMapper {
	
	//전체 트레이너 조회
	List<User> getAllTrainers();
	//트레이너 아이디로 경력조회
	List<Career> getCareerByTrainerNo();

}
