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
	<table>
		<tr>
			<th>S.No</th>
			<th>Started Date</th>
			<th>Ended Date</th>
			<th>update</th>
			<th>fetch Attendances</th>
		</tr>
		<c:forEach var="timesheet" items="${findAllTimeSheetOfUser}">
			<tr>
				<td>${timesheet.getTimesheetId() }</td>
				<td>${timesheet.getStart_date() }</td>
				<td>${timesheet.getEnd_date() }</td>
				<td><a href="timesheetById?id=${timesheet.getTimesheetId() }">update</a></td>
				<td><a href="delete?id=${timesheet.getTimesheetId()}&user_id=1">get
						attendance</a></td>
			</tr>
		</c:forEach>

	</table>
</body>
</html>