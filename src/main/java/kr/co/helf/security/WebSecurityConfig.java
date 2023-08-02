package kr.co.helf.security;


import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.method.configuration.EnableGlobalMethodSecurity;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.SecurityFilterChain;


@Configuration
@EnableWebSecurity
@EnableGlobalMethodSecurity(prePostEnabled = true, securedEnabled = true)
public class WebSecurityConfig {

	
	@Bean
	public SecurityFilterChain filterChain(HttpSecurity http) throws Exception {
		return http
				// 사이트간 요청위조 방지 기능을 비활성화한다.
				.csrf()
					.disable()
					// Form 로그인 인증 기능을 사용한다.
				.formLogin()
					// 사용자정의 로그인 페이지를 요청하는 URL을 지정한다.
					.loginPage("/login")
					// 아이디에 해당하는 파라미터값의 이름을 지정한다.
					.usernameParameter("email")
					// 비밀번호에 해당하는 파라미터값의 이름을 지정한다.
					.passwordParameter("password")
					// Form 로그인 인증작업을 요청하는 URL을 지정한다.
					.loginProcessingUrl("/emp/login")
					// 로그인 성공시 재요청 URL을 지정한다.
					.defaultSuccessUrl("/")
					// 로그인 실패시 재요청 URL을 지정한다.
					.failureUrl("/emp/loginform?error=fail")
				.and()
					// 로그아웃 기능을 사용한다. 
					.logout()
					// 로그아웃을 요청하는 URL을 지정한다.
					.logoutUrl("//logout")
					// 로그아웃 성공시 재요청 URL을 지정한다.
					.logoutSuccessUrl("/")
					// 세션객체를 무효화 시킨다.
					.invalidateHttpSession(true)
				.and()
				//인증 안되었을 때 오는곳
					.exceptionHandling().authenticationEntryPoint((request, response, authentication) -> {
						response.sendRedirect("//loginform?error=denied");
					})
				.and()
					.exceptionHandling().accessDeniedHandler((request, response, exception) -> {
						response.sendRedirect("//loginform?error=forbidden");
					})
				.and()
					.build();
	}

	/*
	 * 비밀번호 인코딩을 지원하는 BCryptPasswordEncoder객체를 스프링 컨테이너의 빈으로 등록시킨다.
	 */
	@Bean
	public PasswordEncoder passwordEncoder() {
		return new BCryptPasswordEncoder();
	}
}
