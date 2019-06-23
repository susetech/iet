package com.suse.eet.security.service;

import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import com.suse.eet.core.security.domain.CustomUserDetails;
import com.suse.eet.core.security.domain.User;
import com.suse.eet.security.repository.UserRepository;
@Service
public class CustomUserDetailsService implements UserDetailsService {
	@Autowired
	private UserRepository userRepository;

	@Override
	public UserDetails loadUserByUsername(String userName)
			throws UsernameNotFoundException {
		Optional<User> optionalUser = userRepository.findUserByUserName(userName);
		optionalUser.orElseThrow(() -> new UsernameNotFoundException(
				"Username not found"));
		return optionalUser.map(CustomUserDetails::new).get();
		//return new CustomUserDetails(optionalUser);
	}

}
