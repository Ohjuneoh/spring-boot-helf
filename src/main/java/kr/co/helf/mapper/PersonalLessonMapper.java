package kr.co.helf.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.co.helf.vo.LessonApply;
import kr.co.helf.vo.Trainer;

@Mapper
public interface PersonalLessonMapper {
	
	//경력을 가진 트레이너 조회
	List<Trainer> getAllTrainersWithCareer();


	// 나의 오늘 수업 리스트 조회(개인+그룹) - 채경 작성
	 List<LessonApply> getMyTodayLessonsByUserId(String userId);

}
