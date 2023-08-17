package kr.co.helf.service;

import kr.co.helf.dto.Pagination;
import kr.co.helf.form.ModifyForm;
import kr.co.helf.mapper.GroupLessonMapper;
import kr.co.helf.vo.Lesson;
import kr.co.helf.vo.LessonApply;
import kr.co.helf.vo.User;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.BeanUtils;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service
@RequiredArgsConstructor
public class GroupLessonService {

    private final GroupLessonMapper groupLessonMapper;

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
    public Map<String,Object> getAllLessons(Map<String,Object> param) {
        int totalRows = groupLessonMapper.getTotalRows(param);
        int page = (int) param.get("page");

        Pagination pagination = new Pagination(page, totalRows);
        int begin = pagination.getBegin();
        int end = pagination.getEnd();
        param.put("begin", begin);
        param.put("end", end);

        List<Lesson> lessons = groupLessonMapper.getAllLessons(param);

        return Map.of("lessons", lessons, "pagination", pagination);
    }
    // 유저가 수업신청 시 조회수 증가 , LessonApply 테이블에 저장
    public void updateApplyLesson(int lessonNo,User user) {
        LessonApply lessonApply = groupLessonMapper.getLessonApplyByLessonNoAndUserID(lessonNo, user.getId());
        if (lessonApply != null) {
            throw new RuntimeException("이미 신청한 레슨입니다.");
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
    public void updateLesson(ModifyForm form, User user) {
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

}
