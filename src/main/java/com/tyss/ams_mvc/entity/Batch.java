package com.tyss.ams_mvc.entity;

import java.time.LocalDate;
import java.time.LocalTime;

import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;

import com.tyss.ams_mvc.util.BatchMode;
import com.tyss.ams_mvc.util.BatchStatus;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Component
@Scope(scopeName = "prototype")
@Entity
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class Batch {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int batchId;
	private String batchCode;
	private String subjectName;
	@Enumerated(EnumType.STRING)
	private BatchStatus batchStatus;
//	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private LocalDate batchStartDate;
//	@DateTimeFormat(pattern = "yyyy-MM-dd")
//	private LocalDate batchEndDate;

	private LocalTime loginTime;
	private LocalTime logoutTime;
//	private String loginTime;
//	private String logoutTime;
	private int totalDays;
	@Enumerated(EnumType.STRING)
	private BatchMode batchMode;
	private String instituteName;
	private String location;
	@ManyToOne
	private User user;

}
