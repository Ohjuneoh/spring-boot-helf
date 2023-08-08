package kr.co.helf.service;


import java.util.List;

import org.springframework.stereotype.Service;

import kr.co.helf.dto.TrainerWithCareer;
import kr.co.helf.mapper.PersonalLessonMapper;
import kr.co.helf.vo.Career;
import kr.co.helf.vo.Trainer;
import kr.co.helf.vo.User;
import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class PersonalLessonService {
	
	private final PersonalLessonMapper personalLessonMapper;

	//전체 트레이너 조회
	public List<Trainer> getAllTrainers(){
		return personalLessonMapper.getAllTrainersWithCareer();
	}
	
	//트레이너 번호로 경력을 조회
	public List<Career> getCareerByTrainerId(){
		return personalLessonMapper.getCareerByTrainerNo();
	}

	
}

