<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<table>
		<tr>
			<th>timesheet id</th>
			<th>timesheet start date</th>
			<th>timesheet end date</th>
			<th>attendence details</th>
		</tr>
		<tr>
			<td>${timeSheet.getTimesheetId() }</td>
			<td>${timeSheet.getStart_date()}</td>
			<td>${timeSheet.getEnd_date() }</td>
			<td><a href="#">attendance</a></td>
		</tr>
	</table>

	<a href="/ams_mvc/views/TSOfUserOnCustomDate.jsp?id=${ userId }">custom
		dates</a>
	<br>
	<br>

	<a href="/ams_mvc/timesheet/display/user?id=${ userId }">find all</a>
	<br>
	<br>
	<a href="/ams_mvc/views/tSByMonthOfUser.jsp?id=${ userId }">by
		month</a>
	<br>
	<br>
</body>
</html>