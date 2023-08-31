package kr.co.helf.service;

import kr.co.helf.mapper.LessonMapper;
import kr.co.helf.vo.Lesson;
import kr.co.helf.vo.LessonApply;
import kr.co.helf.vo.PersonalLesson;
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
    // 개설한 수업에 대해 유저목록 조회
    public List<LessonApply> getAllUsers(int lessonNo){
        return lessonMapper.getAllUsersByNo(lessonNo);
    }
    // 개설한 수업에 대한 유저 출석체크
    public void updateAttendance(int lessonNo, String userId,String status){
        lessonMapper.updateAttendance(lessonNo,userId,status);
    }
    // 내가 개설한 모든 개인수업 조회(트레이너) by 준오
	public List<PersonalLesson> getAllPersonalLessons(String userId) {
		return lessonMapper.getAllPersonalLesson(userId);
	}

}
