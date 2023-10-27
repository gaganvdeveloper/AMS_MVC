package com.tyss.ams_mvc.daoimp;

import java.time.LocalTime;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityTransaction;
import javax.persistence.Query;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.tyss.ams_mvc.dao.UserDao;
import com.tyss.ams_mvc.entity.User;
import com.tyss.ams_mvc.util.UserCategory;
import com.tyss.ams_mvc.util.UserRole;
import com.tyss.ams_mvc.util.UserStatus;

@Repository
public class UserDaoImp  implements UserDao{

	@Autowired
	private EntityManager manager;
	
	
	@Override
	public User saveUser(User user) {
		EntityTransaction transaction = manager.getTransaction();
		transaction.begin();
		manager.persist(user);
		transaction.commit();
		return user;
	}

	@Override
	public User updateUser(User user) {
		EntityTransaction transaction = manager.getTransaction();
		transaction.begin();
		manager.merge(user);
		transaction.commit();
		return user;
	}

	@Override
	public User findUserById(int userId) {
		return manager.find(User.class, userId);
	}

	@Override
	public void deleteUserById(int id) {
		EntityTransaction transaction = manager.getTransaction();
		transaction.begin();
		manager.remove(findUserById(id));
		transaction.commit();
	}

	@Override
	public User findUserByEmpId(String empId) {
			Query q =manager.createQuery("select u from User u where u.empid=?1");
			q.setParameter(1, empId);
			List<User> users = q.getResultList();
			if(users.size()>0)
				return users.get(0);
		return null;
	}

	@Override
	public List<User> findUserByRole(UserRole role) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<User> findUserByCategory(UserCategory category) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<User> findAllUsers() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public User findUserByPhoneNumber(long phone) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public User findUserByEmail(String email) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<User> findUserByStatus(UserStatus status) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public User findUserByEmailAndPassword(String email, String password) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<LocalTime> findBatchTimingsOfUser(int userId) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public User findUserByPhoneAndPassword(long phone, String password) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public User setUserStatusToInAcativeByUserId(UserStatus userStatus, int userId) {
		// TODO Auto-generated method stub
		return null;
	}


}
