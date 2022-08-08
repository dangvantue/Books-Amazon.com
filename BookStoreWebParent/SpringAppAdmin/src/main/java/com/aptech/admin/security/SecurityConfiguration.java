package com.aptech.admin.security;


import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityCustomizer;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.web.SecurityFilterChain;

@Configuration
public class SecurityConfiguration {

	@Bean
	public UserDetailsService userDetailsService() {
		return new BookStoreUserDetailsService();
	}

	@Bean
	public BCryptPasswordEncoder passwordEncoder() {
		return new BCryptPasswordEncoder();
	}

	@Bean
	public SecurityFilterChain filterChain(HttpSecurity http) throws Exception {

		http.authorizeRequests()
		.antMatchers("/users/**").hasAuthority("Admin")
		.antMatchers("/categories/**", "/authors/**").hasAnyAuthority("Admin", "Editor")
		.antMatchers("/books/**").hasAnyAuthority("Admin", "Editor", "Salesperson", "Shipper")
		.anyRequest().authenticated()
		.and()
		.formLogin()			
			.loginPage("/login")
			.usernameParameter("email")
			.permitAll()
		.and().logout().permitAll()
		.and()
			.rememberMe()
				.key("AbcDefgHijKlmnOpqrs_1234567890")
				.tokenValiditySeconds(7 * 24 * 60 * 60);
				;
		http.headers().frameOptions().sameOrigin();

		return http.build();
	}

	@Bean
	public WebSecurityCustomizer webSecurityCustomizer() {
		return (web) -> web.ignoring().antMatchers("/images/**", "/vendors/**", "/css/**", "/js/**", "/webjars/**");
	}

}

