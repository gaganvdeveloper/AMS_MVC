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

	<form:form action="update" modelAttribute="timesheet">
		<h1>format should be YY-MM-DD</h1>
		timesheetId<form:input path="timesheetId" />
	 start date <form:input path="start_date" />
	start date <form:input path="end_date" />
		<form:button>update</form:button>

	</form:form>



</body>
</html>