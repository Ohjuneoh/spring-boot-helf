package kr.co.helf.mapper;

import kr.co.helf.dto.CustomerAttendanceListDto;
import kr.co.helf.dto.CustomerDetailDto;
import kr.co.helf.dto.CustomerListDto;
import kr.co.helf.vo.*;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;
import java.util.Map;
import java.util.Optional;

@Mapper
public interface UserMapper {
	
	// 유저아이디로 유저정보 조회
	User getUserById(String id);

	// 유저 등록
	void insertUser(User user);

	// 트레이너 등록
	void insertTrainer(User user);

	// 트레이너 테이블 등록
	void insertTrainer2(Trainer trainer);
	
	// 트레이너 경력 등록
	void insertTrainerCareer(TrainerCareer trainerCarrer);
	
	// 트레이너 테이블 업데이트
	void updateTrainerById(Trainer trainer);
	
	// 아이디 찾기(ajax)
	List<String> getIdByTel(String name, String tel);
	
	// 비밀번호 찾기 - 인증번호 확인하기 (ajax)
	String getUserAuthById(String auth, String id);
	
	// 아이디 중복검사
	int idCheck (String userId);
	
	// 유저 업데이트
	void updateUser(User user);
	
	// 입장시 회원 휴대폰 네 자리로 조회 - 채경 
	List<User> getUsersByDigits(String fourDigits);


	// 입장시 회원권 유저 아이디로 조회 - 채경 (추후 membershipService로 이동 예정) 
	Optional<MyMembership> getMyMembership(String userId);
	
	// 시설이용 클릭시 회원 출석 테이블에 추가 - 채경 	
	void insertAttendance(Map<String, Object> param);
	
	// 직원 출퇴근 목록 페이지네이션 - 채경 
	int getTrainerTotalRows(Map<String, Object> param);
	
	// 직원 출퇴근 목록 - 채경 
	List<TrainerAttendance> getTrainerAttendances(Map<String, Object> param);
	
	// 직원 출퇴근 등록 - 채경 
	void insertTrainerAttendances(Map<String, Object> param);
	
	// 전체 고객 수 - 채경 
	int getCustomerTotalRows(Map<String, Object> param);
	
	// 고객 아이디 별 출석 수 - 채경 
	int getCustomerAttendanceTotalRowsById(Map<String, Object> param);
	
	// 고객 조회 목록 - 채경
	List<CustomerListDto> getCustomers(Map<String, Object> param);
	
	// 고객별 상세 조회 (1)인적사항 - 채경
	CustomerDetailDto getCustomerInfoDetails(String id);
	
	// 고객별 상세 조회 (2)수업내역 - 채경 
	List<LessonApply> getCustomerLessons(String id);
	
	// 고객별 상세 조회 (5)방문내역 - 채경
	List<CustomerAttendance> getCustomerAttendance(String id);

	List<User> getAllCustomer();

	// 고객별 상세 조회 - 최근 방문 내역 - 채경 
	List<CustomerAttendanceListDto> getCustomerAttendanceList(Map<String, Object> param);
	
	// 전체 직원 수 - 채경 
	int getAllTrainerTotalRows(Map<String, Object> param);
	
	// 전체 트레이너 목록 조회 - 채경 
	List<Trainer> getAllTrainers(Map<String, Object> param);
	
	// 트레이너 상세 조회 - 채경 
	MySalary getTrainerDetailById(String id);
	
	Rank getNewRank(String id);

	// 총 이용자 수 및 강사 수 조회하는 쿼리(예광)
	User getUserAndTrainerCount();
	
	// 특정 트레이너의 개인수업 수 조회(유리)
	int getPersonalLesson(String userId);
	
	// 특정 트레이너의 그룹수업 수 조회(유리) 
	int getGroupLesson(String userId);
	
	// 특정 트레이너의 경력사항 조회(유리)
	List<TrainerCareer> getTrainerCareerByNo(int trainerNo);

	Trainer getTrainerByNo(int trainerNo);

	User getTrainerUserById(String id);

	//트레이너 경력정보 merge
	void updateTrainerCareer(TrainerCareer career);

	void deleteCareer(int careerNo);

	List<Lesson> getAllLessonById(String id);

	List<PersonalLesson> getAllPersonalLessonByNo(int trainerNo);
}