package kr.co.helf.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.co.helf.vo.Consultation;
import kr.co.helf.vo.Trainer;

@Mapper
public interface PersonalLessonMapper {
	
	//경력을 가진 트레이너 조회
	List<Trainer> getAllTrainersWithCareer();
	
	//1대1 PT 예약
	void insertConsultation(Consultation consultation);



}
