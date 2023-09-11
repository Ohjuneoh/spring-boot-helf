package kr.co.helf.security;

import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.oauth2.client.userinfo.DefaultOAuth2UserService;
import org.springframework.security.oauth2.client.userinfo.OAuth2UserRequest;
import org.springframework.security.oauth2.client.userinfo.OAuth2UserService;
import org.springframework.security.oauth2.core.OAuth2AuthenticationException;
import org.springframework.security.oauth2.core.user.OAuth2User;
import org.springframework.stereotype.Service;

import kr.co.helf.mapper.UserMapper;
import kr.co.helf.security.oauth.info.OAuth2UserInfo;
import kr.co.helf.vo.Rank;
import kr.co.helf.vo.User;


@Service
public class CustomOAuth2UserService implements OAuth2UserService<OAuth2UserRequest, OAuth2User> {

	@Autowired
	private UserMapper userMapper;

	@Override
	public OAuth2User loadUser(OAuth2UserRequest userRequest) throws OAuth2AuthenticationException {
		OAuth2UserService<OAuth2UserRequest, OAuth2User> delegate = new DefaultOAuth2UserService();
		
		OAuth2User oAuth2User = delegate.loadUser(userRequest);
		OAuth2UserInfo userInfo = new OAuth2UserInfo(oAuth2User.getAttributes());

		User savedUser = userMapper.getUserById(userInfo.getId());

		if (savedUser == null) {
			savedUser = createUser(userInfo);
		}
		
		savedUser.setAttributes(userInfo.getAttributes());
		
		return savedUser;
	}
	
	private User createUser(OAuth2UserInfo userInfo) {
		User user = new User();
		user.setId(userInfo.getId());
		user.setName(userInfo.getName());
		user.setEmail(userInfo.getEmail());
		user.setSocial("kakao");
		user.setType("ROLE_USER");
		user.setCreateDate(new Date());
		user.setUpdateDate(new Date());
		user.setPoint(1000);
		
		Rank rank = new Rank();
		rank.setNo(1);
		user.setRank(rank);
		
		userMapper.insertUser(user);
		
		return user;
	}
	
}