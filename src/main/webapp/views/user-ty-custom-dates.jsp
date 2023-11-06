<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<c:if test="${not empty timeSheets}">
		<p>
			Time sheet based on from Year <strong>: ${fYear}</strong> and month:
			<strong>${fMonth}</strong> month: <strong>${tMonth}</strong> to Year:
			<strong>: ${tYear}</strong> and

		</p>
	</c:if>
	<c:if test="${ empty timeSheets}">
		<p>
			Time sheet based on from Year <strong>: ${fYear}</strong> and month:
			<strong>${fMonth}</strong> to Year: <strong>: ${tYear}</strong> and
			month: <strong>${tMonth} was not presented</strong>
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
				<c:if test="${timesheet.getTimesheetId()!=null}">
					<td><a href="#">attendance</a></td>
				</c:if>
			</tr>
		</c:forEach>
	</table>
</body>
</html>