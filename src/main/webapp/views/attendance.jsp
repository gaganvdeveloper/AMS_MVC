<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Attendance Form</title>
</head>
<body>

	<form:form action="saveattendance" modelAttribute="attendance">
	date	<form:input path="current_date" TYPE="date" />
		<br>

		<%-- 	login time	<form:input path="loginTime" />
		<br>

	logout time	<form:input path="logoutTime" />
		<br>

	total working hours	<form:input path="totalWorkingHours" type="text"
			readonly="true" />
		<br>

		attendance status<form:select path="attendanceStatus">
			<form:option value="PRESENT">PRESENT</form:option>
			<form:option value="ABSENT">ABSENT</form:option>
			<form:option value="PRESENT_WFH">PRESENT_WFH</form:option>
			<form:option value="ABSENT_WFH">ABSENT_WFH</form:option>
			<form:option value="WFH">WFH</form:option>
			<form:option value="COLLEGE_TRAINING">COLLEGE_TRAINING</form:option>
		</form:select>
		<br> --%>
		<form:button>submit</form:button>
	</form:form>

</body>
</html>
