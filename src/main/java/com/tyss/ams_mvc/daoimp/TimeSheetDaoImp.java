package com.tyss.ams_mvc.daoimp;

import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.EntityTransaction;
import javax.persistence.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import com.tyss.ams_mvc.dao.TimeSheetDao;
import com.tyss.ams_mvc.entity.TimeSheet;

@Component
public class TimeSheetDaoImp implements TimeSheetDao {

	@Autowired
	EntityManager entityManager;

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
	public TimeSheet findTimeSheetById(int id) {
		return entityManager.find(TimeSheet.class, id);
	}

	@Override
	public void deleteTimeSheetById(int id) {
		EntityTransaction transaction = entityManager.getTransaction();
		transaction.begin();
		entityManager.remove(findTimeSheetById(id));
		transaction.commit();
	}

	@Override
	public List<TimeSheet> findAllTimeSheets() {
		Query query = entityManager.createQuery("select t TimeSheet t");
		return query.getResultList();
	}

	@Override
	public List<TimeSheet> findAllTimeSheetByUserId(int userId) {
//get the user from userdao and return the timesheets

		return null;
	}

	@Override
	public TimeSheet findBytimesheet_id(int id) {
		Query query = entityManager.createQuery("select t TimeSheet t where timesheetId='" + id + "'");
		return (TimeSheet) query.getSingleResult();
	}

}
