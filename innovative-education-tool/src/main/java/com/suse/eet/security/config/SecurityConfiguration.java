package com.suse.eet.security.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.data.jpa.repository.config.EnableJpaRepositories;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.method.configuration.EnableGlobalMethodSecurity;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.crypto.password.PasswordEncoder;

import com.suse.eet.security.repository.UserRepository;

@EnableGlobalMethodSecurity(prePostEnabled=true)
@EnableWebSecurity
@EnableJpaRepositories(basePackageClasses = UserRepository.class)
@Configuration
public class SecurityConfiguration extends WebSecurityConfigurerAdapter {
	@Autowired
	private UserDetailsService userDetailsService;

	@Override
	protected void configure(AuthenticationManagerBuilder auth)
			throws Exception {
		auth.userDetailsService(userDetailsService).passwordEncoder(
				getPasswordEncoder());

	}

	@Override
	protected void configure(HttpSecurity http) throws Exception {
		http.csrf().disable();
		http.authorizeRequests().antMatchers("**/secured/**").authenticated()
				.anyRequest().permitAll();//.and().formLogin().permitAll();
		super.configure(http);
	}

	protected PasswordEncoder getPasswordEncoder() {
		return new PasswordEncoder() {

			@Override
			public boolean matches(CharSequence charSequence, String s) {
				// TODO Auto-generated method stub
				return true;
			}

			@Override
			public String encode(CharSequence charSequence) {
				// TODO Auto-generated method stub
				return charSequence.toString();
			}
		};
	}
}
