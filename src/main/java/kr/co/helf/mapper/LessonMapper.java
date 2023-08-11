package kr.co.helf.mapper;

import kr.co.helf.vo.Lesson;
import kr.co.helf.vo.LessonApply;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface LessonMapper {
    //내가 신청한 모든 수업 내역 조회(유저)
    List<LessonApply> getAllMyLessons(String userId);
    // 내가 개설한 모든 수업 내역 조회(트레이너)
    List<Lesson> getAllCreateLessons(String userId);
}
