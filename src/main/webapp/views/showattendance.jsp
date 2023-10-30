<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" isELIgnored="false"%>
    <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>


	<form:form action="" modelAttribute="att">
		<form:input path="attendabceId" type="hidden"/>
		Date : <form:input path="date"/>
		Login Time : <form:input path="loginTime"/>
		Date : <form:input path="logoutTime"/>
		Attendance : <form:select path="attendanceStatus">
					<form:option value="PRESENT"></form:option>
					<form:option value="ABSENT"></form:option>
					<form:option value="WFH"></form:option>
					</form:select>
		Date : <form:input path="totalWorkingHours"/>
	</form:form>

</body>
</html>