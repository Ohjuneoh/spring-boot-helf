package kr.co.helf.security;


import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.authentication.dao.DaoAuthenticationProvider;
import org.springframework.security.config.annotation.method.configuration.EnableGlobalMethodSecurity;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;

import org.springframework.security.core.AuthenticationException;
import org.springframework.security.core.userdetails.UserDetailsService;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.SecurityFilterChain;

@Configuration
@EnableWebSecurity
@EnableGlobalMethodSecurity(prePostEnabled = true, securedEnabled = true)
public class WebSecurityConfig {
	
	@Autowired
	CustomOAuth2UserService oAuth2UserService;
	
	@Autowired
	UserDetailsService userDetails;
	
	@Bean
	public SecurityFilterChain formLoginFilterChaing(HttpSecurity http) throws Exception {
		 http
				.csrf()
					.disable()
				.formLogin()
					.loginPage("/user/loginform")
					.usernameParameter("id")
					.passwordParameter("password")
					.loginProcessingUrl("/user/login")
					.defaultSuccessUrl("/")
					.failureHandler((request, response, exception) -> {
						request.getSession().setAttribute("loginErrorMessage", exception.getMessage());
						response.sendRedirect("/user/loginform?error=fail");
					})
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
	                .oauth2Login()
	                .loginPage("/user/loginform")
	                .defaultSuccessUrl("/")
	                .userInfoEndpoint()
	                .userService(oAuth2UserService);
				
		return http.build();
		
		
	}


	@Bean
	public DaoAuthenticationProvider daoAuthenticationProvider() {
        DaoAuthenticationProvider authenticationProvider = new DaoAuthenticationProvider();
        authenticationProvider.setUserDetailsService(userDetails);
        authenticationProvider.setPasswordEncoder(passwordEncoder());
        authenticationProvider.setHideUserNotFoundExceptions(false);
        return authenticationProvider;
    }


	@Bean
	public PasswordEncoder passwordEncoder() {
		return new BCryptPasswordEncoder();
	}
}
