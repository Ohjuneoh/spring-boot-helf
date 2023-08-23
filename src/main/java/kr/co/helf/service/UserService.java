package kr.co.helf.service;

import java.util.List;
import java.util.Map;
import java.util.Optional;

import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import kr.co.helf.dto.AttendanceList;
import kr.co.helf.dto.Pagination;
import kr.co.helf.form.AddUserForm;
import kr.co.helf.mapper.UserMapper;
import kr.co.helf.vo.MyMembership;
import kr.co.helf.vo.Rank;
import kr.co.helf.vo.Trainer;
import kr.co.helf.vo.TrainerCareer;
import kr.co.helf.vo.TrainerAttendance;
import kr.co.helf.vo.User;

@Service
public class UserService {
	
	@Autowired
	private UserMapper userMapper;
	
	@Autowired
	private PasswordEncoder passwordEncoder;
	
	
	public void createUser(AddUserForm form) {
		User user = new User();
		
		BeanUtils.copyProperties(form, user);
		
		user.setEmail(form.getEmail1() + form.getEmail2());
		
		//비밀번호를 암호화해서 저장시키기
		String encryptedPassword = passwordEncoder.encode(form.getPassword());
		user.setEncryptedPassword(encryptedPassword);
		
		// 등급, 타입,포인트 담기
		user.setType("ROLE_USER");
		Rank rank = new Rank();
		rank.setNo(1);
		user.setRank(rank);
		user.setPoint(1000);
		
		userMapper.insertUser(user);
		
	}

	
	public void createTrainer(AddUserForm form) {
		User user = new User();
		
		BeanUtils.copyProperties(form, user);
		
		user.setEmail(form.getEmail1() + form.getEmail2());
		
		//비밀번호를 암호화해서 저장시키기
		String encryptedPassword = passwordEncoder.encode(form.getPassword());
		user.setEncryptedPassword(encryptedPassword);
		
		// (1단계)유저 객체 - 타입,상태 담기
 		user.setType("ROLE_TRAINER");
		user.setStatus("R");
		
		// (2단계)트레이너 객체에 사진파일 담기
		Trainer trainer = new Trainer();
		
		trainer.setTrainerFile("sample.png");
		trainer.setUser(user);
		
		//(2단계)트레이너 경력객체에 담기
		TrainerCareer trainerCareer = new TrainerCareer();
		trainerCareer.setTrainer(trainer);
		trainerCareer.setName(form.getName());
		trainerCareer.setStartDate(form.getCareerStartDate());
		trainerCareer.setEndDate(form.getCareerEndDate());
		
		userMapper.insertTrainer(user);
		userMapper.insertTrainer2(trainer);
		userMapper.insertTrainerCareer(trainerCareer);
	}
	
	public List<User> getUsersWithFourDigits(String fourDigits) {
		return userMapper.getUsersByDigits(fourDigits);

	}
	
	// 아이디 중복검사
	public int idCheck(String userId) throws Exception {
		return userMapper.idCheck(userId);
	}
	
	// // 입장시 회원권 유저 아이디로 조회 - 채경 (추후 membershipService로 이동 예정) 
	public Optional<MyMembership> getMyMembershipDetail(String userId){
		return userMapper.getMyMembership(userId);
	}
	
	public void createAttendance(String userId) {
		userMapper.insertAttendance(userId);
	}
	
	
	//직원 출석 목록 조회 - 채경 
	public AttendanceList getTrainerAttendances(Map<String, Object> param) {
		
		int totalRows = userMapper.getTotalRows(param);
		
		int page = (int) param.get("page");
		Pagination pagination = new Pagination(page, totalRows);
		
		int begin = pagination.getBegin();
		int end = pagination.getEnd();
		param.put("begin", begin);
		param.put("end", end);
		
		AttendanceList result = new AttendanceList();
		List<TrainerAttendance> attendances = userMapper.getTrainerAttendances(param);
		
		result.setPagination(pagination);
		result.setAttendances(attendances);
		
 		return result;
	}
	
	// 직원 출퇴근 등록 - 채경
	public void createTrainerAttendance(Map<String, Object> param) {
		userMapper.insertTrainerAttendances(param);
	}
}














