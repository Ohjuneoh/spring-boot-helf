package kr.co.helf.service;

import kr.co.helf.dto.MyPersonalLessonDto;
import kr.co.helf.dto.TrainerDto;
import kr.co.helf.mapper.LessonMapper;
import kr.co.helf.mapper.PersonalLessonMapper;
import kr.co.helf.vo.*;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;


@Service
@RequiredArgsConstructor
public class LessonService {

    private final LessonMapper lessonMapper;

	private final PersonalLessonMapper personalLessonMapper;

    // 내가 신청한 모든 수업 조회(유저)
    public List<LessonApply> getAllMyLessons(String userId){
        return lessonMapper.getAllMyLessons(userId);
    }
    // 내가 개설한 모든 수업 조회(트레이너)
    public List<Lesson> getAllCreateLessons(String userId){
        return lessonMapper.getAllCreateLessons(userId);
    }
    // 개설한 수업에 대해 유저목록 조회
    public List<LessonApply> getAllUsers(int lessonNo){
        return lessonMapper.getAllUsersByNo(lessonNo);
    }
    // 개설한 수업에 대한 유저 출석체크
    public void updateAttendance(int lessonNo, String userId,String status){
        lessonMapper.updateAttendance(lessonNo,userId,status);
    }
    // 트레이너 아이디로 트레이너 번호 조회
	public Trainer getTrainerNo(String userId) {
		
		return lessonMapper.getTrainerNoByUserId(userId);
	}
	// 내가 개설한 모든 개인수업 조회 by 준오
	public List<PersonalLesson> getAllPersonalLessons(int trainerNo) {
		return lessonMapper.getAllPersonalLesson(trainerNo);
	}
	public List<PersonalLesson> getAllPersonalLessonByUser(Map<String, Object> params) {
		return lessonMapper.getAllPersonalLessonByUser(params);
	}
	//트레이너 번호를 기준으로 상담내역 조회 by 준오
	public List<Consultation> getAllConsultationList(int trainerNo) {
		
		return lessonMapper.getAllConsultationByTrainerNo(trainerNo);
	}
	public void updatePersonalLessonAttendance(int lessonNo, String status) {
		lessonMapper.updatePersonalLessonAttendance(lessonNo,status);
	}
	
	public List<MyPersonalLessonDto> getAllMyTrainers(String id) {
		
		return lessonMapper.getAllMyTrainerByUserId(id);
	}


	// 모든 개설된 수업 수 확인하는 로직
	public TrainerDto getAllCountLessons(){
		TrainerDto dto = new TrainerDto();

		Integer personalLessonCount = personalLessonMapper.getAllPersonalLesson();
		Integer groupLessonCount = lessonMapper.getAllLessonForHome();

		dto.setLessonCount(personalLessonCount + groupLessonCount);

		return dto;
	}

}
