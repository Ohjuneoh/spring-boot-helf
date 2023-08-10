package kr.co.helf.service;

import kr.co.helf.mapper.LessonMapper;
import kr.co.helf.vo.LessonApply;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
public class LessonService {

    private final LessonMapper lessonMapper;
    // 유저가 신청 시 레슨신청 테이블 저장
    public void insertApplyLesson(LessonApply lessonApply){
        lessonMapper.insertApplyLesson(lessonApply);
    }
}
