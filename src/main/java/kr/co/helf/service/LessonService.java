package kr.co.helf.service;

import kr.co.helf.dto.Pagination;
import kr.co.helf.mapper.LessonMapper;
import kr.co.helf.vo.LessonApply;
import kr.co.helf.vo.User;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;


@Service
@RequiredArgsConstructor
public class LessonService {

    private final LessonMapper lessonMapper;

    public List<LessonApply> getAllMyLessons(String userId){
        return lessonMapper.getAllMyLessons(userId);
    }

}
