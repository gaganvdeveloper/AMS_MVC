package com.tyss.ams_mvc.serviceimp;

import com.tyss.ams_mvc.dao.BatchDao;
import com.tyss.ams_mvc.daoimp.BatchDaoImp;
import com.tyss.ams_mvc.entity.Batch;

public class BatchDriver {
	public static void main(String[] args) {
		BatchDaoImp dao = new BatchDaoImp();
		Batch batch = new Batch();
		batch.setBatchCode("123abc");
		dao.saveBatch(batch);
	}
}
