package com.tyss.ams_mvc.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.tyss.ams_mvc.entity.User;
@Service
public interface UserService {
	
	User saveUser(User user);
	
	User updateUser(User user);
	
	User findUserById(int id);
	
	boolean deleteUserById(int id);
	
	User findUserByEmailAndPassword(String email, String password);
	
	List<User> findAllUsers();
	
	
}
