package kr.co.helf.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;


import kr.co.helf.vo.LessonApply;
import kr.co.helf.vo.MyMembership;
import kr.co.helf.vo.PersonalLesson;
import kr.co.helf.dto.UserConsultations;
import kr.co.helf.dto.UserMyMemberships;
import kr.co.helf.vo.Consultation;
import kr.co.helf.vo.Trainer;

@Mapper
public interface PersonalLessonMapper {
	
	//경력을 가진 트레이너 조회
	List<Trainer> getAllTrainersWithCareer(String userId);
	//1대1 PT 예약
	void insertConsultation(Consultation consultation);

	List<UserMyMemberships> getUserMyMembershipById(String userId);
	 //나의 오늘 수업 리스트 조회(그룹) - 채경 작성
	List<LessonApply> getMyTodayLessonsByUserId(String userId);
	 //나의 오늘 수업 리스트 조회(개인) - 채경 작성
	List<PersonalLesson> getMyTodayPcl(String userId);
	 
	//트레이너 번호로 상담내역 조회
	List<UserConsultations> getAllConsultationByTrainerNo(int trainerNo);
	//아이디로 트레이너 조회
	Trainer getTrainerByUserId(String userId);
	//개인수업 예약
	void insertPersonalLesson(PersonalLesson personalLesson);
	//나의 이용권 번호로 이용권 조회
	MyMembership getMyMembershipByNo(int myMembershipNo);
	//나의 이용권 수정
	void updateMyMembership(MyMembership myMembership);
	//상담번호로 상담찾기
	Consultation getConsultationByNo(int consultationNo);
	//상담상태 변경
	void updatedConsultation(@Param("consultationNo") int consultationNo, @Param("status") String status);
	void updateExpiredConsultation(@Param("id") String id, @Param("no") int no, @Param("status") String status);
	//유저 아이디로 상담내역 조회
	List<UserConsultations> getConsultationByUserId(String id);
	List<Trainer> getTrainersWithCareerByUserId(String id);

	// 고객관리 - 그룹 수업 totalRows 조회 - 채경 
	int getGclTotalRowsById(Map<String, Object> param);
	// 고객관리 - 그룹 수업 조회 -  채경 
	List<LessonApply> getGroupLessonsById(Map<String, Object> param);
	
	// 고객관리 - 개인 수업 totalRows 조회 - 채경
	int getPclTotalRowsById(Map<String, Object> param);
	// 고객관리 - 개인 수업 조회 - 채경
	List<PersonalLesson> getPersonalLessonById(Map<String, Object> param);
	// 고객관리 개인수업 3개 조회 - 채경
	List<PersonalLesson> getThreePersonalLessonById(String userId);

}
