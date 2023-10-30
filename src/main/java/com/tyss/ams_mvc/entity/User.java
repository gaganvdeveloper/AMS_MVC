package com.tyss.ams_mvc.entity;

import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Lob;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;

import org.springframework.context.annotation.Scope;
import org.springframework.lang.NonNull;
import org.springframework.stereotype.Component;

import com.tyss.ams_mvc.util.UserCategory;
import com.tyss.ams_mvc.util.UserRole;
import com.tyss.ams_mvc.util.UserStatus;

import lombok.Getter;
import lombok.Setter;
@Component
@Scope(scopeName = "prototype")
@Entity
@Getter
@Setter
public class User {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int userId;
	@Column(nullable = false, unique = true)
	@NonNull
	private String empId;
	private String name;
	private String email;
	private String password;
	@Column(nullable = false, unique = true)
	private long phone;
	@Enumerated(EnumType.STRING)
	private UserRole userRole;
	@Enumerated(EnumType.STRING)
	private UserStatus userStatus;
	@Enumerated(EnumType.STRING)
	private UserCategory userCategory;
	@OneToMany
	private List<TimeSheet> timeSheets;
	@OneToMany//(cascade = CascadeType.ALL)
	private List<Batch> batchs;
	@Lob
	private String img;
	
}
