package com.withus.spring.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.oauth2.client.userinfo.OAuth2UserRequest;
import org.springframework.security.oauth2.client.userinfo.OAuth2UserService;
import org.springframework.security.oauth2.core.user.OAuth2User;

import com.withus.spring.loginapi.CustomOAuth2UserService;

@Configuration
@EnableWebSecurity
public class SecurityConfig extends WebSecurityConfigurerAdapter {

	// 커스텀한 OAuth2UserService
	@Autowired
	private OAuth2UserService<OAuth2UserRequest, OAuth2User> customOAuth2UserService;

	@Bean
	public BCryptPasswordEncoder encoder() {
		return new BCryptPasswordEncoder();
	}

//	@Override
//	public void configure(WebSecurity web) throws Exception {
//		web.ignoring().mvcMatchers("/members/**","/image/**"); // /image/** 있는 모든 파일들은 시큐리티 적용을 무시한다.
//		web.ignoring().requestMatchers(PathRequest.toStaticResources().atCommonLocations()); // 정적인 리소스들에 대해서 시큐리티 적용 무시.
//	}

	@Override
	protected void configure(HttpSecurity http) throws Exception {
		http.csrf().disable(); // CSRF 비활성화
		http.authorizeRequests()
				.antMatchers("/user/**")
				.authenticated().antMatchers("/seller/**").access("hasRole('ROLE_MEMBER') or hasRole('ROLE_ADMIN')")
				.antMatchers("/admin/**").access("hasRole('ROLE_ADMIN')")
				.anyRequest().permitAll()
			.and()
				.logout()
				.clearAuthentication(true)
				.invalidateHttpSession(true)
				.deleteCookies("JSESSIONID")
				.logoutSuccessUrl("/main")
			.and()
				.formLogin()
				.loginPage("/loginForm")
				.usernameParameter("userid")
				.loginProcessingUrl("/loginOk") // "/loginOk" url 로 request 가 들어오면 시큐리티가 낚아채서 처리, 대신 로그인을 진행해준다.				
				.defaultSuccessUrl("/main") // 직접 /login → /loginOk 에서 성공하면 "/" 로 이동시키기
			.and()
				.oauth2Login()
				.defaultSuccessUrl("/main")
				.userInfoEndpoint()
				.userService(customOAuth2UserService)	// oauth2 로그인 성공 시 유저 데이터는 customOAuth2UserService에서 처리.
		;
	}
}
