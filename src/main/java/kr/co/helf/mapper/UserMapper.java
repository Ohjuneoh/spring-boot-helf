package kr.co.helf.mapper;

import java.util.List;
import java.util.Map;
import java.util.Optional;

import org.apache.ibatis.annotations.Mapper;

import kr.co.helf.vo.MyMembership;
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
	
	// 아이디 중복검사
	int idCheck (String userId);
		
	// 입장시 회원 휴대폰 네 자리로 조회 - 채경 
	List<User> getUsersByDigits(String fourDigits);


	// 입장시 회원권 유저 아이디로 조회 - 채경 (추후 membershipService로 이동 예정) 
	Optional<MyMembership> getMyMembership(String userId);
	
	// 시설이용 클릭시 회원 출석 테이블에 추가 - 채경 	
	void insertAttendance(String userId);
	
	// 직원 출퇴근 목록 페이지네이션 - 채경 
	int getTotalRows(Map<String, Object> param);
	
	// 직원 출퇴근 목록 - 채경 
	List<TrainerAttendance> getTrainerAttendances(Map<String, Object> param);
	
	// 직원 출퇴근 등록 - 채경 
	void insertTrainerAttendances(Map<String, Object> param);
}
