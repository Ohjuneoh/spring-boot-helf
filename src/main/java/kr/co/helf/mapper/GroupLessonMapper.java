package kr.co.helf.mapper;

import kr.co.helf.vo.Lesson;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;
import java.util.Map;

@Mapper
public interface GroupLessonMapper {
    // 레슨 등록
    void insertLesson(Lesson lesson);
    // 레슨번호로 레슨 조회
    Lesson getLessonByNo(int lessonNo);
    // 페이징 처리
    int getTotalRows(Map<String,Object> param);
    // 전체 게시글 목록 조회(페이징처리 포함)
    List<Lesson> getAllLessons(Map<String,Object> param);
}
