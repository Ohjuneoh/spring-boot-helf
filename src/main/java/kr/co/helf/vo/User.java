package kr.co.helf.vo;

import com.fasterxml.jackson.annotation.JsonIgnore;
import lombok.Data;
import lombok.Getter;
import lombok.Setter;

import org.apache.ibatis.type.Alias;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.oauth2.core.user.OAuth2User;

import javax.validation.constraints.NotBlank;
import java.util.Collection;
import java.util.Date;
import java.util.List;
import java.util.Map;

@Data
@Getter
@Setter
@Alias("User")
public class User implements UserDetails, OAuth2User {

	@NotBlank(message = "id를 입력해주세요.")
	private String id;
	private String email;
	private String name;
	private String tel;
	@NotBlank
	private String encryptedPassword;
	private String gender;
	private String status;
	private Date createDate;
	private Date updateDate;
	private String type;
	private Rank rank;
	private int point;
	private String mobileCarrier;
	private String authenticationNo;
	private String social;
	
	private Map<String, Object> attributes;

	// 총 회원 수, 강사수를 위한 변수
	private int totalUsers;
	private int totalTrainers;

	public User(){}
	public User(String id) {
		this.id = id;
	}
	
	public User(Map<String, Object> attributes) {
		this.attributes=attributes;
	}

	@Override
	public Map<String, Object> getAttributes() {
		return attributes;
	}

	// 직원(사용자)의 보유권한을 반환한다.
	@Override
	@JsonIgnore
	public Collection<? extends GrantedAuthority> getAuthorities() {
		return List.of(new SimpleGrantedAuthority(type));
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
		
	public String getHiddenName() {
		if (name == null) {
			return null;
		}
		if (name.length() == 2) {
			return name.charAt(0) + "*";
		}

		int size = name.length() - 2;
		StringBuilder sb = new StringBuilder();
		sb.append(name.substring(0, 1));
		for (int i=0; i<size; i++) {
			sb.append("*");
		}
		sb.append(name.substring(name.length() - 1, name.length()));

		return sb.toString();
	}
	
}