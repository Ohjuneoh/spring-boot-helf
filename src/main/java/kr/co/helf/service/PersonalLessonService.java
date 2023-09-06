package kr.co.helf.service;


import java.util.List;

import org.springframework.stereotype.Service;

import kr.co.helf.dto.UserConsultations;
import kr.co.helf.dto.UserMyMemberships;
import kr.co.helf.mapper.PersonalLessonMapper;
import kr.co.helf.vo.Consultation;
import kr.co.helf.vo.LessonApply;
import kr.co.helf.vo.MyMembership;
import kr.co.helf.vo.PersonalLesson;
import kr.co.helf.vo.Trainer;
import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class PersonalLessonService {
	
	private final PersonalLessonMapper personalLessonMapper;

	//전체 트레이너 조회
	public List<Trainer> getTrainers(String userId){
		return personalLessonMapper.getAllTrainersWithCareer(userId);
	}
	
	//1대1 PT 예약 추가
	public void createConsultation(Consultation consultation) {
		personalLessonMapper.insertConsultation(consultation);
	}
	//유저 ID로 회원권 조회
	public List<UserMyMemberships> getUserMembershipById(String userId) {
		return personalLessonMapper.getUserMyMembershipById(userId);
	}
	
	
	// 나의 오늘 수업 리스트 조회(개a인+그룹) - 채경 작성
	public List<LessonApply> getMyTodayLessons(String userId){
		return personalLessonMapper.getMyTodayLessonsByUserId(userId);
	}
	// 트레이너 Id로 신청 유저조회
	public List<UserConsultations> getUserConsultationsByTrainerNo(String userId) {
		//트레이너 ID로 트레이너 조회
		Trainer trainer = personalLessonMapper.getTrainerByUserId(userId);
		//trainerNo로 상담내역 및 유저정보 조회
		List<UserConsultations> userConsultationsList = personalLessonMapper.getAllConsultationByTrainerNo(trainer.getTrainerNo());
		
		return userConsultationsList;
	}

	public void createPersonalLesson(PersonalLesson personalLesson, Consultation consultation) {
		
		//나의 멤버십 번호로 멤버십 정보 조회
		MyMembership myMembership = personalLessonMapper.getMyMembershipByNo(personalLesson.getMyMembership().getNo());
		
		//남은 회원권 회수를 1 차감
		int updatedRemainderCnt = myMembership.getRemainderCnt() - 1;
		myMembership.setRemainderCnt(updatedRemainderCnt);
	    // 남은 회원권 회수에 따라 상태 업데이트
	    if (updatedRemainderCnt <= 0) {
	        myMembership.setState("사용불가");
	        personalLessonMapper.updatedConsultation(consultation.getConsultationNo(), "수강완료");
	    } else {
	        myMembership.setState("사용중");
	        personalLessonMapper.updatedConsultation(consultation.getConsultationNo(), "수강중");
	    }
		personalLessonMapper.updateMyMembership(myMembership);
		personalLessonMapper.insertPersonalLesson(personalLesson);
		
		personalLessonMapper.updateExpiredConsultation(personalLesson.getUser().getId(), personalLesson.getMyMembership().getNo(), "상담만료");
		
	}
	//유저 id를 기준으로 상담테이블 조회
	public List<UserConsultations> getUserConsultationsByUserId(String id) {
		
		List<UserConsultations> userConsultation = personalLessonMapper.getConsultationByUserId(id);
		return userConsultation;
	}

	public List<Trainer> getTrainerByConsultationWithUserId(String id) {
		return personalLessonMapper.getTrainersWithCareerByUserId(id);
	}
}

