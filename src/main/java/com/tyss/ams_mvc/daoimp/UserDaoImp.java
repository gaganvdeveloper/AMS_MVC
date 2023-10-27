package com.tyss.ams_mvc.daoimp;

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
public class UserDaoImp implements UserDao {

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
		Query q = manager.createQuery("select u from User u where u.empid=?1");
		q.setParameter(1, empId);
		List<User> users = q.getResultList();
		if (users.size() > 0)
			return users.get(0);
		return null;
	}

	@Override
	public List<User> findUserByRole(UserRole role) {
		Query q = manager.createQuery("select u from User u where u.userRole=?1");
		q.setParameter(1, role);
		return q.getResultList();
	}

	@Override
	public List<User> findUserByCategory(UserCategory category) {
		Query q = manager.createQuery("select u from User u where u.userCategory=?1");
		q.setParameter(1, category);
		return q.getResultList();
	}

	@Override
	public List<User> findAllUsers() {
		return manager.createQuery("from User u").getResultList();
	}

	@Override
	public User findUserByPhoneNumber(long phone) {
		Query q = manager.createQuery("select u from User u where u.phone=?1");
		q.setParameter(1, phone);
		List<User> users = q.getResultList();
		if (users.size() > 0)
			return users.get(0);
		return null;
	}

	@Override
	public User findUserByEmail(String email) {
		Query q = manager.createQuery("select u from User u where u.email=?1");
		q.setParameter(1, email);
		List<User> users = q.getResultList();
		if (users.size() > 0)
			return users.get(0);
		return null;
	}

	@Override
	public List<User> findUserByStatus(UserStatus status) {
		Query q = manager.createQuery("select u from User u where u.userStatus=?1");
		q.setParameter(1, status);
		return q.getResultList();
	}

	@Override
	public User findUserByEmailAndPassword(String email, String password) {
		Query q = manager.createQuery("select u from User u where u.email=?1 u.password=?2");
		q.setParameter(1, email);
		q.setParameter(2, password);
		List<User> users = q.getResultList();
		if (users.size() > 0)
			return users.get(0);
		return null;
	}

	@Override
	public User findUserByPhoneAndPassword(long phone, String password) {
		Query q = manager.createQuery("select u from User u where u.phone=?1 u.password=?2");
		q.setParameter(1, phone);
		q.setParameter(2, password);
		List<User> users = q.getResultList();
		if (users.size() > 0)
			return users.get(0);
		return null;
	}

}
