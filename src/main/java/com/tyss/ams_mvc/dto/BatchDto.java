package com.tyss.ams_mvc.dto;

import com.tyss.ams_mvc.util.BatchMode;
import com.tyss.ams_mvc.util.BatchStatus;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class BatchDto {
	private int batchId;
	private String batchCode;
	private String subjectName;
	private BatchStatus batchStatus;
	private String batchStartDate;
	private String batchEndtDate;
	private String loginTime;
	private String logoutTime;
	private int totalDays;
	private BatchMode batchMode;
	private String instituteName;
	private String location;
}
