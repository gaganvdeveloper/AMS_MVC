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
	<h1>time sheet based on custom Dates</h1>
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
				<td><a href="#">attendance</a></td>
			</tr>
		</c:forEach>
		<tr>
			<c:if test="${monthtimeSheet.getTimesheetId()!= null}">
				<td>${monthtimeSheet.getTimesheetId() }</td>
				<td>${monthtimeSheet.getStart_date() }</td>
				<td>${monthtimeSheet.getEnd_date() }</td>
				<c:if test="${timeSheet.getTimesheetId()!= null}">
					<td><a href="#">attendance</a></td>
				</c:if>
			</c:if>
		</tr>
	</table>


</body>
</html>