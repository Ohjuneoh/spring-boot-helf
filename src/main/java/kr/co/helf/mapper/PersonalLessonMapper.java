package kr.co.helf.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.co.helf.vo.Career;
import kr.co.helf.vo.Trainer;
import kr.co.helf.vo.User;

@Mapper
public interface PersonalLessonMapper {
	
	//경력을 가진 트레이너 조회
	List<Trainer> getAllTrainersWithCareer();
	//트레이너 아이디로 경력조회
	List<Career> getCareerByTrainerNo();
	//트레이너 번호로 트레이너 조회
	Trainer getTrainerByTrainerNo(int no);


}
