package kr.co.helf.service;

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
	private UserMapper userMapper;
	
		
	@Override
	public UserDetails loadUserByUsername(String id) throws UsernameNotFoundException {
		
		User user = userMapper.getUserById(id);
		if(user == null) {
			throw new UsernameNotFoundException("고객 정보가 존재하지 않습니다.");
			
		}
		return user;
	}
}
