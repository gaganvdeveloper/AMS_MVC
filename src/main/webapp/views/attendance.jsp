<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Attendance Form</title>
</head>
<body>

<form:form action="saveattendance" method="post" modelAttribute="attendance">
    <form:label path="date">Date</form:label>
    <form:input path="date" type="date" id="date" /><br>

    <form:label path="loginTime">Login Time</form:label>
    <form:input path="loginTime" type="text" id="loginTime" /><br>

    <form:label path="logoutTime">Logout Time</form:label>
    <form:input path="logoutTime" type="text" id="logoutTime" /><br>

    <form:label path="totalWorkingHours">Total Working Hours</form:label>
    <form:input path="totalWorkingHours" type="text" id="totalWorkingHours" /><br>

    <form:label path="attendanceStatus">Attendance Status</form:label>
    <form:select path="attendanceStatus">
        <form:option value="PRESENT">PRESENT</form:option>
        <form:option value="ABSENT">ABSENT</form:option>
        <form:option value="PRESENT_WFH">PRESENT_WFH</form:option>
        <form:option value="ABSENT_WFH">ABSENT_WFH</form:option>
        <form:option value="WFH">WFH</form:option>
        <form:option value="COLLEGE_TRAINING">COLLEGE_TRAINING</form:option>
    </form:select><br>

    <input type="submit" value="Submit">
</form:form>

</body>
</html>
