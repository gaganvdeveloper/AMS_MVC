package com.tyss.ams_mvc.serviceimp;

import java.time.LocalDate;
import java.util.List;

import com.tyss.ams_mvc.entity.Batch;
import com.tyss.ams_mvc.service.BatchService;
import com.tyss.ams_mvc.util.BatchMode;
import com.tyss.ams_mvc.util.BatchStatus;

public class BatchServiceImp implements BatchService {

	@Override
	public Batch findBatchById(int batchId) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Batch saveBatch(Batch batch) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Batch updateBatch(Batch batch) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void deleteBatch(int batchId) {
		// TODO Auto-generated method stub

	}

	@Override
	public List<Batch> findAllBatchs() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Batch findBatchByBatchCode(String batchCode) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Batch> findBatchBySubjectName(String subjectName) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Batch> findBatchBySubjectNameAndBatchStatus(String subjectName, BatchStatus status) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Batch> findBatchByStartedDate(LocalDate startDate) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Batch> findBatchByBatchMode(BatchMode mode) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Batch> findByUserUserIdAndBatchStatus(int userId, BatchStatus batchStatus) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Batch> findBatchBetweenDates(LocalDate fromDate, LocalDate toDate) {
		// TODO Auto-generated method stub
		return null;
	}

}
