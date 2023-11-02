package com.tyss.ams_mvc.util;

import java.time.LocalDate;
import java.time.LocalTime;
import java.time.format.DateTimeFormatter;

import com.tyss.ams_mvc.dto.BatchDto;
import com.tyss.ams_mvc.entity.Batch;
import com.tyss.ams_mvc.serviceimp.UserServiceImp;

public class BatchConversion {

	public static BatchDto convert(Batch batch) {
		return new BatchDto(batch.getBatchId(), batch.getBatchCode(), batch.getSubjectName(), batch.getBatchStatus(),
				batch.getBatchStartDate().toString(), batch.getBatchEndDate().toString(),
				batch.getLoginTime().toString(), batch.getLogoutTime().toString(), batch.getTotalDays(),
				batch.getBatchMode(), batch.getInstituteName(), batch.getLocation(), batch.getUser().getUserId());
	}
	public static BatchDto convert1(Batch batch) {
		return new BatchDto(batch.getBatchId(), batch.getBatchCode(), batch.getSubjectName(), batch.getBatchStatus(),
				batch.getBatchStartDate().toString(), batch.getBatchEndDate().toString(),
				batch.getLoginTime().toString(), batch.getLogoutTime().toString(), batch.getTotalDays(),
				batch.getBatchMode(), batch.getInstituteName(), batch.getLocation(), 0);
	}

	public static Batch convert(BatchDto batchDto) {
		return new Batch(batchDto.getBatchId(), batchDto.getBatchCode(), batchDto.getSubjectName(),
				batchDto.getBatchStatus(), getDate(batchDto.getBatchStartDate()), getDate(batchDto.getBatchEndtDate()),
				getTime(batchDto.getLoginTime()), getTime(batchDto.getLogoutTime()), batchDto.getTotalDays(),
				batchDto.getBatchMode(), batchDto.getInstituteName(), batchDto.getLocation(),
				null);
	}
	public static Batch convert1(BatchDto batchDto) {
		return new Batch(batchDto.getBatchId(), batchDto.getBatchCode(), batchDto.getSubjectName(),
				batchDto.getBatchStatus(), getDate(batchDto.getBatchStartDate()), getDate(batchDto.getBatchEndtDate()),
				getTime(batchDto.getLoginTime()), getTime(batchDto.getLogoutTime()), batchDto.getTotalDays(),
				batchDto.getBatchMode(), batchDto.getInstituteName(), batchDto.getLocation(),
				null);
	}

	private static LocalDate getDate(String batchDate) {
		return LocalDate.parse(batchDate, DateTimeFormatter.ofPattern("yyyy-MM-dd"));
	}

	private static LocalTime getTime(String batchTime) {
		return LocalTime.parse(batchTime);
	}

}