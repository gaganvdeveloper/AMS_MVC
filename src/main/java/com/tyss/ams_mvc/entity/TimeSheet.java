package com.tyss.ams_mvc.entity;

import java.time.LocalDate;
import java.util.List;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;

import org.springframework.context.annotation.Scope;
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
	private LocalDate start_date;
	private LocalDate end_date;
	@OneToMany
	private List<Attendance> attendences;
}
