package com.suse.eet.security.repository;

import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;

import com.suse.eet.core.security.domain.User;

public interface UserRepository extends JpaRepository<User, Integer> {
	Optional<User> findUserByUserName(String userName);

}
