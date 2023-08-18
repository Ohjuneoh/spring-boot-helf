package kr.co.helf.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;


import kr.co.helf.vo.LessonApply;
import kr.co.helf.dto.UserConsultations;
import kr.co.helf.dto.UserMyMemberships;
import kr.co.helf.vo.Consultation;
import kr.co.helf.vo.Trainer;
import kr.co.helf.vo.User;

@Mapper
public interface PersonalLessonMapper {
	
	//경력을 가진 트레이너 조회
	List<Trainer> getAllTrainersWithCareer();
	//1대1 PT 예약
	void insertConsultation(Consultation consultation);

	List<UserMyMemberships> getUserMyMembershipById(String userId);
	 //나의 오늘 수업 리스트 조회(개인+그룹) - 채경 작성
	List<LessonApply> getMyTodayLessonsByUserId(String userId);
	 
	//트레이너 번호로 상담내역 조회
	List<UserConsultations> getAllConsultationByTrainerNo(int trainerNo);
	//아이디로 트레이너 조회
	Trainer getTrainerByUserId(String userId);
	

}
