package kr.co.helf.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;


import kr.co.helf.vo.LessonApply;
import kr.co.helf.dto.UserMyMemberships;
import kr.co.helf.vo.Consultation;
import kr.co.helf.vo.Trainer;

@Mapper
public interface PersonalLessonMapper {
	
	//경력을 가진 트레이너 조회
	List<Trainer> getAllTrainersWithCareer();
	
	//1대1 PT 예약
	void insertConsultation(Consultation consultation);

	List<UserMyMemberships> getUserMyMembershipById(String userId);


	// 나의 오늘 수업 리스트 조회(개인+그룹) - 채경 작성
	 List<LessonApply> getMyTodayLessonsByUserId(String userId);

}
