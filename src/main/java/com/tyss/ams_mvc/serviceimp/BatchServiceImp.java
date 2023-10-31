package com.tyss.ams_mvc.serviceimp;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.tyss.ams_mvc.dao.BatchDao;
import com.tyss.ams_mvc.entity.Batch;
import com.tyss.ams_mvc.service.BatchService;
import com.tyss.ams_mvc.util.BatchMode;
import com.tyss.ams_mvc.util.BatchStatus;

@Component
public class BatchServiceImp implements BatchService {

	@Autowired
	private BatchDao batchDao;

	@Override
	public Batch findBatchById(int batchId) {
		return batchDao.findBatchById(batchId);
	}

	@Override
	public Batch saveBatch(Batch batch) {
		return batchDao.saveBatch(batch);
	}

	@Override
	public Batch updateBatch(Batch batch) {
		return batchDao.updateBatch(batch);
	}

	@Override
	public boolean deleteBatch(int batchId) {
		Batch batch = batchDao.findBatchById(batchId);
		if (batch != null) {
			batchDao.deleteBatch(batchId);
			return true;
		}
		return false;
	}

	@Override
	public List<Batch> findAllBatchs() {
		return batchDao.findAllBatchs();
	}

	@Override
	public Batch findBatchByBatchCode(String batchCode) {

		return batchDao.findBatchByBatchCode(batchCode);
	}

	@Override
	public List<Batch> findBatchBySubjectName(String subjectName) {
		return batchDao.findBatchBySubjectName(subjectName);
	}

	@Override
	public List<Batch> findBatchBySubjectNameAndBatchStatus(String subjectName, BatchStatus status) {
		return batchDao.findBatchBySubjectNameAndBatchStatus(subjectName, status);
	}

	@Override
	public List<Batch> findBatchByStartedDate(LocalDate startDate) {
		return batchDao.findBatchByStartedDate(startDate);
	}

	@Override
	public List<Batch> findBatchByBatchMode(BatchMode mode) {
		return batchDao.findBatchByBatchMode(mode);
	}

	@Override
	public List<Batch> findByUserUserIdAndBatchStatus(int userId, BatchStatus batchStatus) {
		return batchDao.findByUserUserIdAndBatchStatus(userId, batchStatus);
	}

	@Override
	public List<Batch> findBatchBetweenDates(LocalDate fromDate, LocalDate toDate) {
		return batchDao.findBatchBetweenDates(fromDate, toDate);
	}

	@Override
	public List<Batch> findAllNotAssignedBatches() {
		List<Batch> nonAssignedBatches=new ArrayList<Batch>();
		
		List<Batch> batchs=batchDao.findAllBatchs();
		for (Batch batch : batchs) {
			if(batch.getBatchStatus().toString().equals("NOT_YET_ASSIGNED")) {
				nonAssignedBatches.add(batch);
			}
		}
		
		return nonAssignedBatches;
	}

}
