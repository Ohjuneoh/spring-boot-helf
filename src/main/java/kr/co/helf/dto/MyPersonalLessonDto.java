package kr.co.helf.dto;

import org.apache.ibatis.type.Alias;

import kr.co.helf.vo.Consultation;
import kr.co.helf.vo.MyMembership;
import kr.co.helf.vo.PersonalLesson;
import kr.co.helf.vo.Trainer;
import kr.co.helf.vo.User;
import lombok.Data;

@Data
@Alias("MyPersonalLesson")
public class MyPersonalLessonDto {

	private PersonalLesson personalLesson;
	private MyMembership myMembership;
	private User user;
	private Trainer trainer;
	private Consultation consultation;
	
}
