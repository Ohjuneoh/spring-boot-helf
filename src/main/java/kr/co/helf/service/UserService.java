package kr.co.helf.service;

import java.util.List;

import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import kr.co.helf.form.AddUserForm;
import kr.co.helf.mapper.UserDao;
import kr.co.helf.vo.User;

@Service
public class UserService {
	
	@Autowired
	private UserDao userDao;
	
	@Autowired
	private PasswordEncoder passwordEncoder;
	
	public void createUser(AddUserForm form) {
		User user = new User();
		
		BeanUtils.copyProperties(form, user);
		
		//비밀번호를 암호화해서 저장시키기
		//String encryptedPassword = passwordEncoder.encode(form.getPassword());
		//user.setEncryptedPassword(encryptedPassword);
		
		userDao.insertUser(user);
		
	}

	public List<User> getUsersWithFourDigits(String fourDigits) {
		return userDao.getUsersByDigits(fourDigits);
	}
}














