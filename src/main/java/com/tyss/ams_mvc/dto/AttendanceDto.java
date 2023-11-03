package com.tyss.ams_mvc.dto;

import java.util.List;

import javax.persistence.ManyToMany;

import org.springframework.stereotype.Component;

import com.tyss.ams_mvc.entity.Batch;
import com.tyss.ams_mvc.util.AttendanceStatus;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Component
@Setter
@Getter
@NoArgsConstructor
public class AttendanceDto {

	private String current_date;
	private String loginTime;
	private String logoutTime;
	private AttendanceStatus attendanceStatus;
	private double totalWorkingHours;
	private List<Batch> batchs;

}
