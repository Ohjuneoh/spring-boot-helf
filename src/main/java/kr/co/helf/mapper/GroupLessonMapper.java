package kr.co.helf.mapper;

import kr.co.helf.form.ModifyGroupLessonForm;
import kr.co.helf.vo.Lesson;
import kr.co.helf.vo.LessonApply;
import kr.co.helf.vo.MyMembership;
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
    int getTotalRows(Map<String, Object> param);

    // 전체 게시글 목록 조회(페이징처리 포함)
    List<Lesson> getAllLessons(Map<String, Object> param);

    // 레슨번호에 해당하는 개설된 레슨 수정
    void updateLesson(ModifyGroupLessonForm form);

    // 신청인원 증가
    void updateReqCount(Lesson lesson);

    // 신청인원 = 모집총원 변경(모집여부 변경)
//    void updateReservation(Lesson lesson);
    // 레슨 삭제(lesson_disabled 상태 -> 'Y')로 변경
    void deleteLesson(Lesson lesson);


    // 유저가 레슨신청 -> lessonApply 테이블에 저장
    void insertApplyLesson(LessonApply lessonApply);

    // 유저가 동일 수업 신청 x
    // @Param은 mapper에서도 적을 수 있고, 저 이름으로 담긴 변수는 xml에서 사용된다.
    LessonApply getLessonApplyByLessonNoAndUserID(@Param("no") int no, @Param("userId") String userId);

    // 그룹 PT 멤버십을 가진 유저만 전체 리스트 조회 가능
    MyMembership getMyMembershipById(@Param("userId") String userId);

    // 유저가 레슨 신청 시 이용권 횟수 차감
    void loseMyMembership(MyMembership myMembership);

    //그룹 이용권에 해당하는 이용권 횟수 차감을 위한 myMembership 조회
    MyMembership getMyMembershipByUserId(String userId);

    // 멤버십 이용권이 모두 소진한 경우 멤버십 상태 변경
    void updateMembershipState(MyMembership membership);

    // 내가 개설한 최근 수업명, 수업날짜 조회
    List<Lesson> getRecentLessons(String userId);

    // 마이페이지(트레이너) - 더 보기(출석률 , 페이징처리)
    List<Lesson> trainerMyAllLessons(Map<String, Object> param);
}
