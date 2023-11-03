<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>

<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<form:form action="update" modelAttribute="timeSheet">
		timesheetId<form:input path="timesheetId" readonly="true" />
		<br>
		<br>
	 start date <form:input type="date" path="start_date" />
		<br>
		<br>
	end date <form:input type="date" path="end_date" readonly="true" />
		<br>
		<br>
		

	</form:form>



</body>
</html>