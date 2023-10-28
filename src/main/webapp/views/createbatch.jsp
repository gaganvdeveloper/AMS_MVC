<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<form:form action="savebatch" modelAttribute="u">

		Batch Code:<form:input path="batchCode" />
		<br>
		Subject Name:<form:input path="subjectName" />
		<br>
		Batch Status:<form:select path="batchStatus">
			<br>
			<form:option value="NOT_YET_ASSIGNED"></form:option>
			<form:option value="ON_GOING"></form:option>
			<form:option value="COMPLETED"></form:option>
		</form:select>
		<br>
		Batch StartDate:<form:input type="date" path="batchStartDate" pattern="yyyy-MM-dd" />
		<br>
		Batch EndDate:<form:input type="date" path="batchEndDate"  pattern="yyyy-MM-dd"/>
		<br>
		<%-- Login Time:<form:input path="loginTime" />
		<br>
		Logout Time:<form:input path="logoutTime" /> --%>
		<br>
		Batch Mode:<form:select path="batchMode">
			<form:option value="ONLINE"></form:option>
			<form:option value="OFFLINE"></form:option>
		</form:select>
		Institute Name:<form:input path="instituteName" />
		<br>
		Location:<form:input path="location" value="REMOTE" />
		<br>
		<form:button>submit</form:button>
	</form:form>
</body>
</html>