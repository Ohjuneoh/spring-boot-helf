package kr.co.helf.service;

import kr.co.helf.mapper.LessonMapper;
import kr.co.helf.vo.Lesson;
import kr.co.helf.vo.LessonApply;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;


@Service
@RequiredArgsConstructor
public class LessonService {

    private final LessonMapper lessonMapper;

    // 내가 신청한 모든 수업 조회(유저)
    public List<LessonApply> getAllMyLessons(String userId){
        return lessonMapper.getAllMyLessons(userId);
    }
    // 내가 개설한 모든 수업 조회(트레이너)
    public List<Lesson> getAllCreateLessons(String userId){
        return lessonMapper.getAllCreateLessons(userId);
    }


}
