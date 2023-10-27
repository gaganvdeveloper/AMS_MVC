package com.tyss.ams_mvc.entity;

import java.time.LocalDate;
import java.time.LocalTime;
import java.util.List;

import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToMany;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;

import com.tyss.ams_mvc.util.AttendanceStatus;

import lombok.Getter;
import lombok.Setter;

@Component
@Scope(scopeName = "prototype")
@Entity
@Getter
@Setter
public class Attendance {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int attendanceId;
	private LocalDate date;
	private LocalTime loginTime;
	private LocalTime logoutTime;
	@Enumerated(EnumType.STRING)
	private AttendanceStatus attendanceStatus;
	private double totalWorkingHours;
	@ManyToMany
	private List<Batch> batchs;
}
