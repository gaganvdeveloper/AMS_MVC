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
	<!-- <a href="create">create timesheet</a> -->


	<!-- <a href="display">display timesheet by user id</a> -->

	<!-- <a href="views/timeSheetByYearOfUser.jsp">findAllTimeSheetOfAYearOfUser</a> -->

	<!-- <a href="views/timeSheetByMonthOfUser.jsp">findtimeSheetByMonthOfUser</a> -->

	<a href="findTsByMonNameOfAllEmp.jsp">findTimeSheetByMonthNameOfAllEmployees</a>
	<br>
	<br>
	<!-- <a href="views/TSOfUserOnCustomDate.jsp">findTimeSheetOfUserOnCustomDates</a> -->
	<br>
	<br>
	<a href="TSOnCustomDatesOfAll.jsp">findTSOnCustomDatesOfAll</a>
	<br>
	<br>
	<a href="/ams_mvc/timesheet/current">fetchCurrentMonthTimeSheet</a>
	<br>
	<br>
</body>
</html>