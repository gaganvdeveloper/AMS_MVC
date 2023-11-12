package com.tyss.ams_mvc.daoimp;

import java.time.LocalDate;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityTransaction;
import javax.persistence.Query;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.tyss.ams_mvc.dao.BatchDao;
import com.tyss.ams_mvc.entity.Batch;
import com.tyss.ams_mvc.util.BatchMode;
import com.tyss.ams_mvc.util.BatchStatus;

@Component
public class BatchDaoImp implements BatchDao {

	@Autowired
	private EntityManager manager;

	@Override
	public Batch saveBatch(Batch batch) {
		EntityTransaction transaction = manager.getTransaction();
		transaction.begin();
		manager.persist(batch);
		transaction.commit();
		return batch;
	}

	@Override
	public Batch findBatchById(int batchId) {

		return manager.find(Batch.class, batchId);
	}

	@Override
	public Batch updateBatch(Batch batch) {
		EntityTransaction transaction = manager.getTransaction();
		transaction.begin();
		manager.merge(batch);
		transaction.commit();
		return batch;
	}

	@Override
	public void deleteBatch(int batchId) {
		EntityTransaction transaction = manager.getTransaction();
		transaction.begin();
		manager.remove(findBatchById(batchId));
		transaction.commit();
	}

	@Override
	public List<Batch> findAllBatchs() {
		Query query = manager.createQuery("from Batch b");
		return query.getResultList();
	}
	
	@Override
	public List<Batch> findAllOnGoingBatchs() {
		return manager.createQuery("select b from Batch b where b.batchStatus='ON_GOING'").getResultList();
	}


	@Override
	public List<Batch> findAllCompletedBatchs() {
		return manager.createQuery("select b from Batch b where b.batchStatus='COMPLETED'").getResultList();
	}

	@Override
	public Batch findBatchByBatchCode(String batchCode) {
		Query query = manager.createQuery("select b from Batch b where b.batchCode=?1");
		query.setParameter(1, batchCode);
		return (Batch) query.getSingleResult();
	}

	@Override
	public List<Batch> findBatchBySubjectName(String subjectName) {
		Query query = manager.createQuery("select b from Batch b where b.subjectName=?1");
		query.setParameter(1, subjectName);
		return query.getResultList();
	}

	@Override
	public List<Batch> findBatchBySubjectNameAndBatchStatus(String subjectName, BatchStatus batchStatus) {
		Query query = manager.createQuery("select b from Batch b where b.subjectName=?1 and b.batchStatus=?2");
		query.setParameter(1, subjectName);
		query.setParameter(2, batchStatus);
		return query.getResultList();
	}

	@Override
	public List<Batch> findBatchByStartedDate(LocalDate batchStartDate) {
		Query query = manager.createQuery("select b from Batch b where b.batchStartDate=?1");
		query.setParameter(1, batchStartDate);
		return query.getResultList();
	}

	@Override
	public List<Batch> findBatchByBatchMode(BatchMode batchMode) {
		Query query = manager.createQuery("select b from Batch b where b.batchMode=?1");
		query.setParameter(1, batchMode);
		return query.getResultList();
	}

	@Override
	public List<Batch> findByUserUserIdAndBatchStatus(int userId, BatchStatus batchStatus) {
		Query query = manager.createQuery("select b from Batch b where b.userId=?1 and b.batchStatus=?2");
		query.setParameter(1, userId);
		query.setParameter(2, batchStatus);
		return query.getResultList();
	}

	@Override
	public List<Batch> findBatchBetweenDates(LocalDate batchStartDate, LocalDate batchEndDate) {
		Query query = manager.createQuery("select b from Batch b where b.batchStartDate BETWEEN ?1 and ?2");
		query.setParameter(1, batchStartDate);
		query.setParameter(2, batchEndDate);
		return query.getResultList();
	}

	@Override
	public List<Batch> findAllNotAssignedBatchs() {
		return manager.createQuery("select b from Batch b where b.batchStatus='NOT_YET_ASSIGNED'").getResultList();
	}

	@Override
	public List<Batch> findAllBatchsOfAUserId(int userId) {
		Query query= manager.createQuery("select b from Batch b where b.user.userId=?1");
		query.setParameter(1, userId);
		return query.getResultList();
	}

}
