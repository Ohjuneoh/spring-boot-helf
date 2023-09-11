package kr.co.helf.mapper;

import kr.co.helf.dto.MyPersonalLessonDto;
import kr.co.helf.vo.Consultation;
import kr.co.helf.vo.Lesson;
import kr.co.helf.vo.LessonApply;
import kr.co.helf.vo.PersonalLesson;
import kr.co.helf.vo.Trainer;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

@Mapper
public interface LessonMapper {
    //내가 신청한 모든 수업 내역 조회(유저)
    List<LessonApply> getAllMyLessons(String userId);
    // 내가 개설한 모든 수업 내역 조회(트레이너)
    List<Lesson> getAllCreateLessons(String userId);
    // 신청테이블에 레슨번호에 해당하는 수강생 전체 조회(트레이너)
    List<LessonApply> getAllUsersByNo(int lessonNo);
    // 수강생 출석체크
    void updateAttendance(@Param("no") int lessonNo, @Param("userId") String userId, @Param("status") String status);
    // 신청테이블에 저장되어 있는 목록 조회하기
    LessonApply getLessonApplyByNo(int no);
    //내가 개설한 모든 개인수업 내역 조회(트레이너) by 준오
	List<PersonalLesson> getAllPersonalLesson(int trainerNo);
	//트레이너 아이디로 트레이너 번호 찾기 by 준오
	Trainer getTrainerNoByUserId(String userId);
	//모달창 유저의 수업목록들 조회
	List<PersonalLesson> getAllPersonalLessonByUser(Map<String, Object> params);
	//트레이너 번호를 기준으로 상담내역 조회 by 준오
	List<Consultation> getAllConsultationByTrainerNo(int trainerNo);
	void updatePersonalLessonAttendance(@Param("no") int lessonNo,@Param("status") String status);
	List<MyPersonalLessonDto> getAllMyTrainerByUserId(String id);

    // 홈페이지 모든 개설된 수업 조회(예광)
    Integer getAllLessonForHome();
}
