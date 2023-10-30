<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" isELIgnored="false"%>
    <%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

<table>
	<tr>
		<th>attendanceId</th>
		<th>date</th>
		<th>loginTime</th>
		<th>logoutTime</th>
		<th>attendanceStatus</th>
		<th>totalWorkingHours</th>
		<th>batchs</th>
	</tr>
	<c:forEach var="att" items="list">
	
		<tr>
			<td>${att.getAttendanceId() }</td>
			<td>${att.getDate() }</td>
		</tr>
	
	</c:forEach>
</table>
</body>
</html>