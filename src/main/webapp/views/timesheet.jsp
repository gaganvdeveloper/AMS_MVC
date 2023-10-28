<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>HR</h1>
	<h1>${msg}</h1>
	<br>
	<br>
	<a href="create">create timesheet</a>
	<br>
	<br>
	<a href="display">display timesheet by user id</a>
	<br>
	<br>
	<a href="views/timeSheetByYearOfUser.jsp">findAllTimeSheetOfAYearOfUser</a>
	<br>
	<br>
	<a href="views/timeSheetByMonthOfUser.jsp">findtimeSheetByMonthOfUser</a>
	<br>
	<br>
	<a href="views/findTsByMonNameOfAllEmp.jsp">findTimeSheetByMonthNameOfAllEmployees</a>
	<br>
	<br>
	<a href="views/TSOfUserOnCustomDate.jsp">findTimeSheetOfUserOnCustomDates</a>
	<br>
	<br>
	<a href="views/TSOnCustomDatesOfAll.jsp">findTSOnCustomDatesOfAll</a>
	<br>
	<br>
	<a href="/ams_mvc/currentmonth">fetchCurrentMonthTimeSheet</a>
	<br>
	<br>
</body>
</html>