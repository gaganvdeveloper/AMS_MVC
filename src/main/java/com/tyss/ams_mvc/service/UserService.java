package com.tyss.ams_mvc.service;

import com.tyss.ams_mvc.entity.User;

public interface UserService {
	
	User saveUser(User user);
	
	User updateUser(User user);
	
	User findUserById(int id);
	
	
}
