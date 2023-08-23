package kr.co.helf.mapper;

import kr.co.helf.vo.Lesson;
import kr.co.helf.vo.LessonApply;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

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

}
