package kr.co.helf.service;


import java.util.List;

import org.springframework.stereotype.Service;

import kr.co.helf.mapper.PersonalLessonMapper;
import kr.co.helf.vo.Career;
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
	

	// 나의 오늘 수업 리스트 조회(개인+그룹) - 채경 작성
	public List<LessonApply> getMyTodayLessons(String userId){
		return personalLessonMapper.getMyTodayLessonsByUserId(userId);
	}
	
}

