package kr.co.helf.mapper;

import kr.co.helf.form.ModifyForm;
import kr.co.helf.vo.Lesson;
import kr.co.helf.vo.LessonApply;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

@Mapper
public interface GroupLessonMapper {
    // 레슨 등록
    void insertLesson(Lesson lesson);
    // 레슨번호로 레슨 조회
    Lesson getLessonByNo(int no);
    // 페이징 처리
    int getTotalRows(Map<String,Object> param);
    // 전체 게시글 목록 조회(페이징처리 포함)
    List<Lesson> getAllLessons(Map<String,Object> param);
    // 레슨번호에 해당하는 개설된 레슨 수정
    void updateLesson(ModifyForm form);
    // 신청인원 증가(구현중)
    void updateReqCount(Lesson lesson);
    // 신청인원 = 모집총원 변경(모집여부 변경)
    void updateReservation(Lesson lesson);
    // 레슨 삭제(lesson_disabled 상태 -> 'Y')로 변경
    void deleteLesson(Lesson lesson);


    // 유저가 레슨신청 -> lessonApply 테이블에 저장
    void insertApplyLesson(LessonApply lessonApply);
    // 유저가 동일 수업 신청 x
    // @Param은 mapper에서도 적을 수 있고, 저 이름으로 담긴 변수는 xml에서 사용된다.
    LessonApply getLessonApplyByLessonNoAndUserID(@Param("no") int no, @Param("userId") String userId);

}
