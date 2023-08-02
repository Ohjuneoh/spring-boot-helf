package kr.co.helf.vo;

import java.util.Collection;
import java.util.Date;
import java.util.List;

import org.apache.ibatis.type.Alias;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

import lombok.Data;

@Data
@Alias("User")
public class User implements UserDetails{

	private String id;
	private String email;
	private String name;
	private String tel;
	private String encryptedPassword;
	private String gender;
	private String status;
	private String mobileCarrier;
	private Date createDate;
	private Date updateDate;
	private int point;
	private Rank rank;
	
	public User(){}
	public User(String id) {
		this.id = id;
	}
	
	// 직원(사용자)의 보유권한을 반환한다.
	@Override
	public Collection<? extends GrantedAuthority> getAuthorities() {
		return List.of(new SimpleGrantedAuthority("USER_ROLE"));
	}
	// 직원(사용자)의 비밀번호를 반환한다.
	@Override
	public String getPassword() {
		return encryptedPassword;
	}
	// 직원(사용자)의 고유한 식별정보를 반환한다.
	@Override
	public String getUsername() {
		return id;
	}
	//직원(사용자)의 계정 만료여부를 반환한다. true - 계정만료되지 않았음
	@Override
	public boolean isAccountNonExpired() {
		return true;
	}
	// 직원(사용자)의 계정잠김여부를 반환한다. true- 계정잠김되지 않았음
	@Override
	public boolean isAccountNonLocked() {
		return true;
	}
	// 직원(사용자)의 비밀번호 만료여부를 반환한다. true- 비밀번호 만료되지 않았음
	@Override
	public boolean isCredentialsNonExpired() {
		return true;
	}
	// 직원(사용자)의 활성화 여부를 반환한다. true - 계정이 사용가능함.
	@Override
	public boolean isEnabled() {
		return true;
	}
	
}
