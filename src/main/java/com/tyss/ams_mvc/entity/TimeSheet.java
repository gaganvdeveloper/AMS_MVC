package com.tyss.ams_mvc.entity;

import java.time.LocalDate;
import java.util.List;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;

import org.springframework.context.annotation.Scope;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Component;

import lombok.Getter;
import lombok.Setter;

@Component
@Scope(scopeName = "prototype")
@Entity
@Getter
@Setter
public class TimeSheet {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int timesheetId;
	@DateTimeFormat(pattern = "dd-MM-yyyy")
	private LocalDate start_date;
	@DateTimeFormat(pattern = "dd-MM-yyyy")
	private LocalDate end_date;
	@OneToMany
	private List<Attendance> attendences;
}
