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
	<h1>${user1.getName()}'s&rArr;Current-MonthTimeSheet</h1>

	<table border="2" cellpadding="10" cellmargin="15">
		<tr>
			<th>timesheet id</th>
			<th>timesheet start date</th>
			<th>timesheet end date</th>
			<th>attendence details</th>
			<th>Batch1</th>
			<th>Batch2</th>
			<th>Batch3</th>
			<th>Batch4</th>
			<th>Export to Excel</th>

		</tr>
		<tr>

			<td>${timeSheet.getTimesheetId() }</td>
			<td>${timeSheet.getStart_date()}</td>
			<td>${timeSheet.getEnd_date() }</td>
			<c:if test="${timeSheet.getTimesheetId()!= null}">
				<td><a
					href="findAllattendance?id=${timeSheet.getTimesheetId()}">attendance</a></td>
			</c:if>

			<c:choose>
				<c:when test="${condition}">
					<c:forEach var="batch" items="${batchs}">
						<td>${batch.getSubjectName()}</td>
					</c:forEach>
				</c:when>
				<c:otherwise>
					<h2
						style="color: rgb(0, 100, 0, 0.4); margin =auto; padding-left: 1vw;">NO_BATCH</h2>
				</c:otherwise>
			</c:choose>

			<%-- <c:if test="${batchs.size() > 0 }">
			
				<c:forEach var="batch" items="${batchs}" >
				
				<td>${batch.getSubjectName()}</td>
				
				 
			
			</c:if> --%>

			<td><a
				href="converttoxl?id=${timeSheet.getTimesheetId()}&userId=${user1.getUserId()}"><button
						type="submit">Export to XL</button></a></td>
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