package kr.co.helf.service;

import kr.co.helf.dto.Pagination;
import kr.co.helf.form.ModifyGroupLessonForm;
import kr.co.helf.mapper.GroupLessonMapper;
import kr.co.helf.mapper.LessonMapper;
import kr.co.helf.vo.Lesson;
import kr.co.helf.vo.LessonApply;
import kr.co.helf.vo.MyMembership;
import kr.co.helf.vo.User;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.BeanUtils;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
@RequiredArgsConstructor
public class GroupLessonService {

    private final GroupLessonMapper groupLessonMapper;

    private final LessonMapper lessonMapper;

    // 레슨 등록
    public void createLesson(Lesson lesson) {
        groupLessonMapper.insertLesson(lesson);
    }
    // 레슨번호로 레슨 상세조회
    public Lesson getLessonByNo(int no) {
        Lesson lesson = groupLessonMapper.getLessonByNo(no);
        return lesson;
    }
    //
    // 레슨 목록 조회(페이징처리)
    public Map<String,Object> getAllLessons(String userId, String type, Map<String,Object> param) {
        Map<String, Object> result = new HashMap<>();
        MyMembership m = groupLessonMapper.getMyMembershipById(userId);
        // 멤버십을 가진 유저거나, 유저 타입이 트레이너,매니저이면 수업을 조회할 수 있는 로직
        if (m != null || type.equals("ROLE_TRAINER") || type.equals("ROLE_MANAGER")) {
            int totalRows = groupLessonMapper.getTotalRows(param);
            int page = (int) param.get("page");

            Pagination pagination = new Pagination(page, totalRows);
            int begin = pagination.getBegin();
            int end = pagination.getEnd();
            param.put("begin", begin);
            param.put("end", end);

            List<Lesson> lessons = groupLessonMapper.getAllLessons(param);

            result.put("lessons", lessons);
            result.put("pagination", pagination);
        }

        return result;

    }
    // 유저가 수업신청 시 신청인원 증가 , LessonApply 테이블에 저장, 이용권 횟수 차감, 이용권 횟수 모두 차감시 이용권 상태 변경
    public void updateApplyLesson(int lessonNo,User user) {
        LessonApply lessonApply = groupLessonMapper.getLessonApplyByLessonNoAndUserID(lessonNo, user.getId());
        if (lessonApply != null) {
            throw new RuntimeException("이미 신청한 레슨입니다.");
        }
        MyMembership myMembership = groupLessonMapper.getMyMembershipByUserId(user.getId());
        myMembership.setRemainderCnt(myMembership.getRemainderCnt() - 1);
        groupLessonMapper.loseMyMembership(myMembership);
        if (myMembership.getRemainderCnt() == 0) {
            groupLessonMapper.updateMembershipState(myMembership);
        }
        lessonApply = new LessonApply();
        lessonApply.setUser(user);

        Lesson lesson = groupLessonMapper.getLessonByNo(lessonNo);
        lessonApply.setLesson(lesson);
        lesson.setReqCnt(lesson.getReqCnt() + 1);

        groupLessonMapper.insertApplyLesson(lessonApply);
        groupLessonMapper.updateReqCount(lesson);
    }
    // 레슨 번호로 레슨 수정
    public void updateLesson(ModifyGroupLessonForm form, User user) {
        Lesson lesson = groupLessonMapper.getLessonByNo(form.getNo());
        BeanUtils.copyProperties(form,lesson);
        groupLessonMapper.updateLesson(form);
    }
    // 레슨 번호로 레슨 삭제
    public void deleteLesson(int lessonNo,User user) {
        Lesson lesson = groupLessonMapper.getLessonByNo(lessonNo);
        lesson.setDisabled("Y");
        groupLessonMapper.deleteLesson(lesson);
    }

    // 관리자로 로그인 시(해당 수업번호에 해당하는 수강생 조회하기 -디테일에서(예광) )
    public List<LessonApply> getAllDetailUsers(int lessonNo){
        return lessonMapper.getAllUsersByNo(lessonNo);
    }
}
