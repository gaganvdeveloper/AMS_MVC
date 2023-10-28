package com.tyss.ams_mvc.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.tyss.ams_mvc.entity.User;
import com.tyss.ams_mvc.util.UserCategory;
import com.tyss.ams_mvc.util.UserRole;
import com.tyss.ams_mvc.util.UserStatus;
@Repository
public interface UserDao {

	User saveUser(User user);

	User updateUser(User user);

	User findUserById(int userId);

	void deleteUserById(int id);

	User findUserByEmpId(String empId);

	List<User> findUserByRole(UserRole role);

	List<User> findUserByCategory(UserCategory category);

	List<User> findAllUsers();

	User findUserByPhoneNumber(long phone);

	User findUserByEmail(String email);

	List<User> findUserByStatus(UserStatus status);

	User findUserByEmailAndPassword(String email, String password);

//	List<LocalTime> findBatchTimingsOfUser(int userId);

	User findUserByPhoneAndPassword(long phone, String password);

//	User setUserStatusToInAcativeByUserId(int userId);

}
