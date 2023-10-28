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

	<form:form action="savetimesheet" modelAttribute="timesheet">
		enter the start date <form:input type="date" path="start_date" />
		<form:button>create</form:button>
	</form:form>

</body>
</html>