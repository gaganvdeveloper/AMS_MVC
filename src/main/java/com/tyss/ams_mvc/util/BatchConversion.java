package com.tyss.ams_mvc.util;

import java.time.LocalDate;

import com.tyss.ams_mvc.dto.BatchDto;
import com.tyss.ams_mvc.entity.Batch;

public class BatchConversion {

	public static BatchDto convert(Batch batch) {

		return new BatchDto(batch.getBatchId(), batch.getBatchCode(), batch.getSubjectName(), batch.getBatchStatus(),
				batch.getBatchStartDate().toString(), batch.getLoginTime().toString(), batch.getLogoutTime().toString(),
				batch.getTotalDays(), batch.getBatchMode(), batch.getInstituteName(), batch.getLocation());
	}

	public Batch convert(BatchDto batchDto) {
		return new  Batch(batchDto.getBatchId(), batchDto.getBatchCode(), batchDto.getSubjectName(), batchDto.getBatchStatus(), getDate(batchDto.getBatchStartDate()), null, null, 0, null, null, null, null);
	}

	private LocalDate getDate(String batchStartDate) {

		return LocalDate.of(0, 0, 0);
	}

}
