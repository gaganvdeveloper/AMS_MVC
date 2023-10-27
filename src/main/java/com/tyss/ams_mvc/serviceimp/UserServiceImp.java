package com.tyss.ams_mvc.serviceimp;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tyss.ams_mvc.daoimp.UserDaoImp;
import com.tyss.ams_mvc.entity.User;
import com.tyss.ams_mvc.service.UserService;

@Service
public class UserServiceImp implements UserService {

	@Autowired
	private UserDaoImp userDaoImp;

	@Override
	public User saveUser(User user) {
		return userDaoImp.saveUser(user);
	}

	@Override
	public User updateUser(User user) {
		return userDaoImp.updateUser(user);
	}

	@Override
	public User findUserById(int id) {
		return userDaoImp.findUserById(id);
	}

}
