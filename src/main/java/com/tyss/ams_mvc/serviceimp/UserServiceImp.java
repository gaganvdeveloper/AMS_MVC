package com.tyss.ams_mvc.serviceimp;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tyss.ams_mvc.dao.UserDao;
import com.tyss.ams_mvc.entity.User;
import com.tyss.ams_mvc.service.UserService;
import com.tyss.ams_mvc.util.UserStatus;

@Service
public class UserServiceImp implements UserService {

	@Autowired
	private UserDao userDao;

	@Override
	public User saveUser(User user) {
		return userDao.saveUser(user);
	}

	@Override
	public User updateUser(User user) {
		return userDao.updateUser(user);
	}

	@Override
	public User findUserById(int id) {
		return userDao.findUserById(id);
	}

	@Override
	public boolean deleteUserById(int id) {
		User user = findUserById(id);
		if(user!=null) {
			userDao.deleteUserById(id);
			return true;
		}
		return false;
	}

	@Override
	public User findUserByEmailAndPassword(String email, String password) {
		return userDao.findUserByEmailAndPassword(email, password);
	}
	
	@Override
	public User setUserStatusToInActive(int id) {
		User user = findUserById(id);
		if(user!=null) {
			user.setUserStatus(UserStatus.valueOf("IN_ACTIVE"));
			return updateUser(user);
		}
		return null;
	}

	@Override
	public List<User> findAllUsers() {
		return userDao.findAllUsers();
	}

	@Override
	public List<User> findAllActiveUsers() {
		return userDao.findAllActiveUsers();
	}

	@Override
	public List<User> findAllInActiveUsers() {
		return userDao.findAllInActiveUsers();
	}

	

}
