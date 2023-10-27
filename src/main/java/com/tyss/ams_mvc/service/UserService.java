package com.tyss.ams_mvc.service;

import org.springframework.stereotype.Service;

import com.tyss.ams_mvc.entity.User;
@Service
public interface UserService {
	
	User saveUser(User user);
	
	User updateUser(User user);
	
	User findUserById(int id);
	
	User findUserByEmailAndPassword(String email, String password);
	
}
