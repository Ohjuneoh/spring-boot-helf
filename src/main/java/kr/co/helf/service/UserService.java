package kr.co.helf.service;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import kr.co.helf.form.AddUserForm;
import kr.co.helf.mapper.UserMapper;
import kr.co.helf.vo.MyMembership;
import kr.co.helf.vo.Rank;
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
		
		//비밀번호를 암호화해서 저장시키기
		String encryptedPassword = passwordEncoder.encode(form.getPassword());
		user.setEncryptedPassword(encryptedPassword);
		
		// 타입,상태 담기
		user.setType("ROLE_TRAINER");
		user.setStatus("R");
		
		userMapper.insertTrainer(user);
		
	}

	public List<User> getUsersWithFourDigits(String fourDigits) {
		return userMapper.getUsersByDigits(fourDigits);

	}
	
	
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
	
}














