<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>All Employees Current month TimeSheet</h1>
	<table border="2" cellpadding="10" cellmargin="15">
		<tr>
			<th>timesheet id</th>
			<th>timesheet start date</th>
			<th>timesheet end date</th>
			<th>attendence details</th>
		</tr>
		<tr>
			<c:forEach var="timesheet" items="${timeSheets}">
				<tr>
					<td>${timesheet.getTimesheetId() }</td>
					<td>${timesheet.getStart_date() }</td>
					<td>${timesheet.getEnd_date() }</td>
					<td><a
						href="findAllattendance?id=${timeSheet.getTimesheetId()}">attendance</a></td>
				</tr>
			</c:forEach>
		</tr>
</body>
</html>