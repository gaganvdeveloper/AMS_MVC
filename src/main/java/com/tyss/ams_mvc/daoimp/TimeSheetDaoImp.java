package com.tyss.ams_mvc.daoimp;

import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.EntityTransaction;
import javax.persistence.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import com.tyss.ams_mvc.dao.TimeSheetDao;
import com.tyss.ams_mvc.dao.UserDao;
import com.tyss.ams_mvc.entity.TimeSheet;

@Component
public class TimeSheetDaoImp implements TimeSheetDao {

	@Autowired
	EntityManager entityManager;

	@Autowired
	UserDao userDao;

	@Override
	public TimeSheet saveTimeSheet(TimeSheet timeSheet) {
		EntityTransaction transaction = entityManager.getTransaction();
		transaction.begin();
		entityManager.persist(timeSheet);
		transaction.commit();
		return timeSheet;
	}

	@Override
	public TimeSheet updateTimeSheet(TimeSheet timeSheet) {
		EntityTransaction transaction = entityManager.getTransaction();
		transaction.begin();
		entityManager.merge(timeSheet);
		transaction.commit();
		return timeSheet;
	}

	@Override
	public void deleteTimeSheetById(int id) {
		EntityTransaction transaction = entityManager.getTransaction();
		transaction.begin();
		entityManager.remove(findBytimesheet_id(id));
		transaction.commit();
	}

	@Override
	public List<TimeSheet> findAllTimeSheetByUserId(int userId) {
		return userDao.findUserById(userId).getTimeSheets();
	}

	@Override
	public TimeSheet findBytimesheet_id(int id) {
		return (TimeSheet) entityManager.createQuery("select t TimeSheet t where timesheetId='" + id + "'")
				.getSingleResult();
	}

	@Override
	public List<TimeSheet> findAllTimeSheets() {
		return entityManager.createQuery("select t from TimeSheet t").getResultList();
	}

}
