package kr.co.helf.security;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import kr.co.helf.mapper.UserMapper;
import kr.co.helf.vo.User;


@Service
public class UserDetailsServiceImpl implements UserDetailsService {
	
	@Autowired
	private UserMapper userDao;
	
	@Override
	public UserDetails loadUserByUsername(String id) throws UsernameNotFoundException {
		
		User user = userDao.getUserById(id);
		if(user == null) {
			throw new UsernameNotFoundException("고객 정보가 존재하지 않습니다.");
			
		}
		
		if (!"ROLE_USER".equals(user.getType()) && !"Y".equals(user.getStatus())) {
		    throw new UsernameNotFoundException("로그인 가능 상태가 아닙니다.");
		} else if(!"ROLE_TRAINER".equals(user.getType()) && !"Y".equals(user.getStatus())) {
			throw new UsernameNotFoundException("로그인 가능 상태가 아닙니다.");
		}
		
		return user;
	}

}