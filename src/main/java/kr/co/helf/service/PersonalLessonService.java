package kr.co.helf.service;


import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Service;

import kr.co.helf.dto.UserConsultations;
import kr.co.helf.dto.UserMyMemberships;
import kr.co.helf.mapper.PersonalLessonMapper;
import kr.co.helf.vo.Career;
import kr.co.helf.vo.Consultation;
import kr.co.helf.vo.LessonApply;
import kr.co.helf.vo.Trainer;
import kr.co.helf.vo.User;
import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class PersonalLessonService {
	
	private final PersonalLessonMapper personalLessonMapper;

	//전체 트레이너 조회
	public List<Trainer> getTrainers(){
		return personalLessonMapper.getAllTrainersWithCareer();
	}
	
	//1대1 PT 예약 추가
	public void createConsultation(Consultation consultation) {
		personalLessonMapper.insertConsultation(consultation);
	}
	//유저 ID로 회원권 조회
	public List<UserMyMemberships> getUserMembershipById(String userId) {
		return personalLessonMapper.getUserMyMembershipById(userId);
	}
	
	

	// 나의 오늘 수업 리스트 조회(개인+그룹) - 채경 작성
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
}

