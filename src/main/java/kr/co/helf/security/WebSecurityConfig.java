package kr.co.helf.security;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.method.configuration.EnableGlobalMethodSecurity;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
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
				// 사이트간 요청위조 방지 기능을 비활성화한다. 수정 
				.csrf()
					.disable()
					// Form 로그인 인증 기능을 사용한다.
				.formLogin()
					// 사용자정의 로그인 페이지를 요청하는 URL을 지정한다.
					.loginPage("/user/loginform")
					// 아이디에 해당하는 파라미터값의 이름을 지정한다.
					.usernameParameter("id")
					// 비밀번호에 해당하는 파라미터값의 이름을 지정한다.
					.passwordParameter("password")
					// Form 로그인 인증작업을 요청하는 URL을 지정한다.
					.loginProcessingUrl("/user/login")
					// 로그인 성공시 재요청 URL을 지정한다.
					.defaultSuccessUrl("/")
					// 로그인 실패시 재요청 URL을 지정한다.
					.failureUrl("/user/loginform?error=fail")
				.and()
					.logout()
					.logoutUrl("/user/logout")
					.logoutSuccessUrl("/")
					.invalidateHttpSession(true)
				.and()
					.exceptionHandling().authenticationEntryPoint((request, response, authentication) -> {
						response.sendRedirect("/user/loginform?error=denied");
					})
				.and()
					.exceptionHandling().accessDeniedHandler((request, response, exception) -> {
						response.sendRedirect("/user/loginform?error=forbidden");
					})
				.and()
					.build();
	}

	@Bean
	public PasswordEncoder passwordEncoder() {
		return new BCryptPasswordEncoder();
	}
}
