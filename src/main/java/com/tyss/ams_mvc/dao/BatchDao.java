package com.tyss.ams_mvc.dao;

import java.time.LocalDate;
import java.util.List;
import java.util.Optional;

import com.tyss.ams_mvc.entity.Batch;
import com.tyss.ams_mvc.util.BatchMode;
import com.tyss.ams_mvc.util.BatchStatus;

public interface BatchDao {

	Batch findBatchById(int batchId);

	Batch saveBatch(Batch batch);

	Batch updateBatch(Batch batch);

	void deleteBatch(int batchId);

	List<Batch> findAllBatchs();

	Batch findBatchByBatchCode(String batchCode);

	List<Batch> findBatchBySubjectName(String subjectName);

	List<Batch> findBatchBySubjectNameAndBatchStatus(String subjectName, BatchStatus status);

	List<Batch> findBatchByStartedDate(LocalDate startDate);

	List<Batch> findBatchByBatchMode(BatchMode mode);

	List<Batch> findByUserUserIdAndBatchStatus(int userId, BatchStatus batchStatus);

	List<Batch> findBatchBetweenDates(LocalDate fromDate, LocalDate toDate);

}
