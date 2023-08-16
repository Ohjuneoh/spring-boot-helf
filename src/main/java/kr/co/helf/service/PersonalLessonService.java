package kr.co.helf.service;


import java.util.List;

import org.springframework.stereotype.Service;

import kr.co.helf.dto.UserMyMemberships;
import kr.co.helf.mapper.PersonalLessonMapper;
import kr.co.helf.vo.Consultation;
import kr.co.helf.vo.LessonApply;
import kr.co.helf.vo.Trainer;
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
	
	


	
}

