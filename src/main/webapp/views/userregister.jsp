<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" isELIgnored="false"%>
    
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>User Registration Page</title>
</head>
<body>
	<h1>User Regiatration!!!...</h1>
	<form:form action="saveuser" modelAttribute="user">
		EMPID : <form:input path="empId"/>
		Name : <form:input path="name"/>
		Email : <form:input path="email"/>
		Phone : <form:input path="phone"/>
		Password : <form:input path="password"/>
		<br>
		<br>
		Role : <form:select path="userRole">
					<form:option value="---Select---"></form:option>
					<form:option value="TRAINER"></form:option>
					<form:option value="HR"></form:option>
					<form:option value="ADMIN"></form:option>
				</form:select>
		Status : <form:select path="userStatus">
					<form:option value="---Select---"></form:option>
					<form:option value="ACTIVE"></form:option>
					<form:option value="IN_ACTIVE"></form:option>
				</form:select>
		Category : <form:select path="userCategory">
					<form:option value="---Select---"></form:option>
					<form:option value="TRAINER"></form:option>
					<form:option value="LATERAL"></form:option>
				</form:select>
				<br>
				<br>
		<button type="submit">Create User</button>
	</form:form>
	
	
	
	
</body>
</html>