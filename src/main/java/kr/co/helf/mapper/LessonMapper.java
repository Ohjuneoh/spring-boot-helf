package kr.co.helf.mapper;

import kr.co.helf.vo.LessonApply;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface LessonMapper {
    // 유저가 레슨 신청
    void insertApplyLesson(LessonApply lessonApply);
}
