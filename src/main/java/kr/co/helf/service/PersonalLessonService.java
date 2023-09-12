package kr.co.helf.service;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import kr.co.helf.dto.Pagination;
import kr.co.helf.dto.UserConsultations;
import kr.co.helf.dto.UserMyMemberships;
import kr.co.helf.mapper.PersonalLessonMapper;
import kr.co.helf.mapper.UserMapper;
import kr.co.helf.vo.Consultation;
import kr.co.helf.vo.LessonApply;
import kr.co.helf.vo.MyMembership;
import kr.co.helf.vo.PersonalLesson;
import kr.co.helf.vo.Trainer;
import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class PersonalLessonService {
	
	private final PersonalLessonMapper personalLessonMapper;
	private final UserMapper userMapper; // 채경 추가 

	//전체 트레이너 조회
	public List<Trainer> getTrainers(String userId){
		return personalLessonMapper.getAllTrainersWithCareer(userId);
	}
	
	// 트레이너 상세 조회 (유리)
	public Trainer getTrainerById(String userId) {
		return personalLessonMapper.getTrainerAndCareer(userId);
	}
	
	//1대1 PT 예약 추가
	public void createConsultation(Consultation consultation) {
		personalLessonMapper.insertConsultation(consultation);
	}
	//유저 ID로 회원권 조회
	public List<UserMyMemberships> getUserMembershipById(String userId) {
		return personalLessonMapper.getUserMyMembershipById(userId);
	}
	
	
	// 나의 오늘 수업 리스트 조회(그룹수업) - 채경 작성
	public List<LessonApply> getMyTodayLessons(String userId){
		return personalLessonMapper.getMyTodayLessonsByUserId(userId);
	}
	
	// 나의 오늘 수업 리스트 조회(개인수업) - 채경 작성 on September 10th
	public List<PersonalLesson> getMyTodayPcl(String userId){
		return personalLessonMapper.getMyTodayPcl(userId);
	}
	
	// 트레이너 Id로 신청 유저조회
	public List<UserConsultations> getUserConsultationsByTrainerNo(String userId) {
		//트레이너 ID로 트레이너 조회
		Trainer trainer = personalLessonMapper.getTrainerByUserId(userId);
		//trainerNo로 상담내역 및 유저정보 조회
		List<UserConsultations> userConsultationsList = personalLessonMapper.getAllConsultationByTrainerNo(trainer.getTrainerNo());
		
		return userConsultationsList;
	}

	public void createPersonalLesson(PersonalLesson personalLesson, Consultation consultation) {
		
		//나의 멤버십 번호로 멤버십 정보 조회
		MyMembership myMembership = personalLessonMapper.getMyMembershipByNo(personalLesson.getMyMembership().getNo());
		
		//남은 회원권 회수를 1 차감
		int updatedRemainderCnt = myMembership.getRemainderCnt() - 1;
		myMembership.setRemainderCnt(updatedRemainderCnt);
	    // 남은 회원권 회수에 따라 상태 업데이트
	    if (updatedRemainderCnt <= 0) {
	        myMembership.setState("사용불가");
	        personalLessonMapper.updatedConsultation(consultation.getConsultationNo(), "수강완료");
	    } else {
	        myMembership.setState("사용중");
	        personalLessonMapper.updatedConsultation(consultation.getConsultationNo(), "수강중");
	    }
		personalLessonMapper.updateMyMembership(myMembership);
		personalLessonMapper.insertPersonalLesson(personalLesson);
		
		personalLessonMapper.updateExpiredConsultation(personalLesson.getUser().getId(), personalLesson.getMyMembership().getNo(), "상담만료");
		
	}
	//유저 id를 기준으로 상담테이블 조회
	public List<UserConsultations> getUserConsultationsByUserId(String id) {
		
		List<UserConsultations> userConsultation = personalLessonMapper.getConsultationByUserId(id);
		return userConsultation;
	}

	public List<Trainer> getTrainerByConsultationWithUserId(String id) {
		return personalLessonMapper.getTrainersWithCareerByUserId(id);
	}
	
	// 고객별 그룹 수업 조회 
	public List<LessonApply> getGroupThreeLessonsById(String userId){
		List<LessonApply> groupThreeLessonList = personalLessonMapper.getGroupThreeLessonsById(userId);
		return groupThreeLessonList;
	}
	
	// 고객별 개인 수업 3개 조회 
		public List<PersonalLesson> getThreePersonalLessonById(String userId){
			List<PersonalLesson> result = personalLessonMapper.getThreePersonalLessonById(userId);
			return result;
		}
	
	// 고객별 그룹 수업 조회 
	public Map<String, Object> getGroupLessonsById(Map<String, Object> param){
		// 총 행의 갯수
		int totalRows = personalLessonMapper.getGclTotalRowsById(param);
		int page = (int) param.get("page");
		int rows = 10;
		Pagination pagination = new Pagination(rows, page, totalRows);

		int begin = pagination.getBegin();
		int end = pagination.getEnd();
		param.put("begin", begin);
		param.put("end", end);
		
		List<LessonApply> groupLessonList = personalLessonMapper.getGroupLessonsById(param);
		
		Map<String, Object> result = new HashMap<>();
		result.put("totalRows", totalRows);
		result.put("pagination", pagination);
		result.put("groupLessonList", groupLessonList);
		return result;
	}
	
	// 고객별 개인 수업 조회
	public List<PersonalLesson> getPersonalLessonById(Map<String, Object> param){
		// 총 행의 갯수
				int totalRows = personalLessonMapper.getPclTotalRowsById(param);
				int page = (int) param.get("page");
				int rows = 10;
				Pagination pagination = new Pagination(rows, page, totalRows);

				int begin = pagination.getBegin();
				int end = pagination.getEnd();
				param.put("begin", begin);
				param.put("end", end);
		
		List<PersonalLesson> result = personalLessonMapper.getPersonalLessonById(param);
		return result;
	}
	
	

	public Consultation getConsultationByUserId(String id, int trainerNo) {
		
		return personalLessonMapper.getConsultationByTrainerNo(id, trainerNo);
	}
	//상담번호를 기준으로 상담번호 조회
	public void updateConsultationStatus(String id, int consultationNo) {
		personalLessonMapper.updatedConsultation(consultationNo,"상담만료");
		
	}

}

