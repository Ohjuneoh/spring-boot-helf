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
			throw new UsernameNotFoundException("사용자 혹은 트레이너 정보가 존재하지 않습니다.");
		}
		
		if ("N".equals(user.getStatus())) {
		    throw new UsernameNotFoundException("탈퇴한 사용자 혹은 트레이너는 로그인할 수 없습니다.");
		} else if("ROLE_TRAINER".equals(user.getType()) && "R".equals(user.getStatus())) {
			throw new UsernameNotFoundException("승인 대기중인 트레이너는 로그인할 수 없습니다.");
		}
		
		return user;
	}

}