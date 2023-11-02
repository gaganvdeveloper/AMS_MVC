package com.tyss.ams_mvc.daoimp;

import javax.persistence.EntityManager;
import javax.persistence.EntityTransaction;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tyss.ams_mvc.dao.AttendanceDao;
import com.tyss.ams_mvc.entity.Attendance;

@Service
public class AttendanceDaoImpl implements AttendanceDao{

	@Autowired
	private EntityManager manager;
	
	
	@Override
	public Attendance saveAttendance(Attendance attendance) {
		EntityTransaction transaction = manager.getTransaction();
		transaction.begin();
		manager.persist(attendance);
		transaction.commit();
		return attendance;
	}
	
}
