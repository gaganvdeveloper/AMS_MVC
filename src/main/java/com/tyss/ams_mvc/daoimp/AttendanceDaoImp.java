package com.tyss.ams_mvc.daoimp;

import java.time.LocalDate;
import java.util.List;
import java.util.Optional;

import javax.persistence.EntityManager;
import javax.persistence.EntityTransaction;
import javax.persistence.Query;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.tyss.ams_mvc.dao.AttendanceDao;
import com.tyss.ams_mvc.entity.Attendance;
import com.tyss.ams_mvc.entity.TimeSheet;
import com.tyss.ams_mvc.util.AttendanceStatus;

@Repository
public class AttendanceDaoImp implements AttendanceDao {
	
	@Autowired
	EntityManager entityManager;


	public Attendance saveAttendance(Attendance attendance) {
		
	    EntityTransaction transaction = entityManager.getTransaction() ;
	    transaction.begin();
	    entityManager.persist(attendance);
	    transaction.commit();
	    return attendance ;
	}

	public Attendance findById(int id) {
		
		return entityManager.find(Attendance.class, id) ;
		
	}

	public Attendance updateAttendance(Attendance attendance) {
		
		EntityTransaction transaction = entityManager.getTransaction() ;
	    transaction.begin();
	    entityManager.merge(attendance);
	    transaction.commit();
	    return attendance ;
	}

	public boolean deleteAttendance(int id) {
		
		Attendance attendance = findById(id) ;
		EntityTransaction transaction = entityManager.getTransaction() ;
	    transaction.begin();
	    entityManager.remove(attendance);
	    transaction.commit();
	    return true ;
	}

	@Override
	public List<Attendance> findAllAttendanceByAttendanceStatus(AttendanceStatus attendanceStatus) {
		
		Query query = entityManager.createQuery("select a Attendance from a where a.attendanceStatus = ?1");
		query.setParameter(1, attendanceStatus) ;
		return query.getResultList() ;
		
	}

	@Override
	public List<Attendance> findAllAttendenceByDate(LocalDate date) {
		
		Query query = entityManager.createQuery("select a Attendance from a where a.date = ?1");
		query.setParameter(1, date) ;
		return query.getResultList() ;
		
	}

	@Override
	public  List<Attendance> findAllAttendanceByAttendanceStatusAndDate(AttendanceStatus status, LocalDate date) {
		
		Query query = entityManager.createQuery("select a Attendance from a where a.attendanceStatus = ?1 and a.date = ?2");
		query.setParameter(1, status) ;
		query.setParameter(2, date) ;
		return query.getResultList() ;
		
	}

	@Override
	public List<Attendance> findAllAttendace() {
		
		return entityManager.createQuery("from Attendance a").getResultList() ;
	}

	@Override
	public List<Attendance> findAttendanceByTimeSheetId(int attendanceStatus) {
		
		TimeSheet timeSheet = entityManager.find(TimeSheet.class, attendanceStatus);
		
		return timeSheet.getAttendences() ;
	}

}
