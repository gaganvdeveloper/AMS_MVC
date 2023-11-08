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
	<c:if test="${ not empty timeSheets}">
		<p>
			All employees timeSheets are fetched month: <strong>${month }</strong>
			and year : <strong>${year }</strong>
		</p>
	</c:if>
	<c:if test="${ empty timeSheets}">
		<p>
			timeSheets for month: <strong>${month }</strong> and year : <strong>${year }</strong>
			were not there
		</p>
	</c:if>


	<table border="2" cellpadding="10" cellmargin="15">
		<tr>
			<th>S.No</th>
			<th>Started Date</th>
			<th>Ended Date</th>
			<th>AttendenceDetails</th>
		</tr>
		<c:forEach var="timesheet" items="${timeSheets}">
			<tr>
				<td>${timesheet.getTimesheetId() }</td>
				<td>${timesheet.getStart_date() }</td>
				<td>${timesheet.getEnd_date() }</td>
				<td><a
					href="findAllattendance?id=${timeSheet.getTimesheetId()}">attendance</a></td>
			</tr>
		</c:forEach>


	</table>
</body>
</html>