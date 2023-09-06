package kr.co.helf.mapper;

import java.util.List;
import java.util.Map;
import java.util.Optional;

import org.apache.ibatis.annotations.Mapper;

import kr.co.helf.dto.CustomerAttendanceListDto;
import kr.co.helf.dto.CustomerDetailDto;
import kr.co.helf.dto.CustomerListDto;
import kr.co.helf.vo.CustomerAttendance;
import kr.co.helf.vo.LessonApply;
import kr.co.helf.vo.MyMembership;
import kr.co.helf.vo.MySalary;
import kr.co.helf.vo.Rank;
import kr.co.helf.vo.Trainer;
import kr.co.helf.vo.TrainerCareer;
import kr.co.helf.vo.TrainerAttendance;
import kr.co.helf.vo.User;

@Mapper
public interface UserMapper {
	
	User getUserById(String id);

	void insertUser(User user);

	void insertTrainer(User user);
	
	void insertTrainer2(Trainer trainer);
	
	void insertTrainerCareer(TrainerCareer trainerCarrer);
	
	// 아이디 찾기(ajax)
	List<String> getIdByTel(String name, String tel);
	
	// 비밀번호 찾기 - 인증번호 확인하기 (ajax)
	String getUserAuthById(String auth, String id);
	
	// 아이디 중복검사
	int idCheck (String userId);
	
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
	int getCustomerTotalRows();
	
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
	
}