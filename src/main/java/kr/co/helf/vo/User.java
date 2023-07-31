package kr.co.helf.vo;

import java.util.Collection;
import java.util.Date;
import java.util.List;

import org.apache.ibatis.type.Alias;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;

import lombok.Data;

@Data
@Alias("User")
public class User {

	private int no;
	private String id;
	private String password;
	private String address;
	private String phoneNumber;
	private String mobileCarrier;
	private String gender;
	private Date createDate;
	private Date updateDate;
	
	public User(){}
	public User(String id) {
		this.id = id;
	}
	// 직원(사용자)의 보유권한을 반환한다.	
	public Collection<? extends GrantedAuthority> getAuthorities(){
		return List.of(new SimpleGrantedAuthority("USER_ROLE"));
	}
	
}
