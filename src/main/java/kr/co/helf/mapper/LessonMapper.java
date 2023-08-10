package kr.co.helf.mapper;

import kr.co.helf.vo.LessonApply;
import kr.co.helf.vo.User;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface LessonMapper {
    //내가 신청한 모든 수업 내역 조회
    List<LessonApply> getAllMyLessons(String userId);
}
