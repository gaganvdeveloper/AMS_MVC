<%@page import="com.tyss.ams_mvc.dao.TimeSheetDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
* {
	box-sizing: border-box;
}

nav .ts-user {
	text-decoration: none;
	font-weight: bold;
	color: green;
	width: 150px;
	height: 30px;
	display: block;
	background-color: black;
	text-align: center;
	padding-top: 5px;
	border: 3px solid green;
	color: green;
}

nav a:hover {
	text-decoration: none;
	color: white;
	background-color: green;
	color: white;
	font-size: 15px;
	font-weight: bold;
	font-size: 15px;
	border: 3px solid black;
}
</style>

</head>
<body>
	<h1>${userName }'s&rArr;Current-MonthTimeSheet</h1>
	<table border="2" cellpadding="10" cellmargin="15">
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
			<c:if test="${timeSheet.getTimesheetId()!= null}">
				<td><a href="findAllattendance?id=${timeSheet.getTimesheetId()}">attendance</a></td>
			</c:if>

		</tr>

	</table>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<h3>Fetch your Time Sheet by :</h3>
	<nav>
		<a class="ts-user"

			href="/ams_mvc/views/TSOfUserOnCustomDate.jsp?id=${userId }">
			Custom Dates</a> <br> <br> <a class="ts-user"
			href="/ams_mvc/display/user?id=${userId }">All TimeSheets</a> <br>
		<br> <a class="ts-user"
			href="/ams_mvc/views/tSByMonthOfUser.jsp?id=${userId }">Month and
			Year</a> <br> <br>
	</nav>

</body>
</html>