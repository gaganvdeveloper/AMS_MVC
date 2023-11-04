<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
    <title>Attendance List</title>
</head>
<body>

<h2>Attendance List</h2>

<table border="1">
    <tr>
        <th>Attendance ID</th>
        <th>Date</th>
        <th>Login Time</th>
        <th>Logout Time</th>
        <th>Attendance Status</th>
        <th>Total Working Hours</th>
    </tr>

    
        <tr>
            <td>${att.getAttendanceId()}</td>
            <td>${att.getDate()}</td>
            <td>${att.getLoginTime()}</td>
            <td>${att.getLogoutTime()}</td>
            <td>${att.getAttendanceStatus()}</td>
            <td>${att.getTotalWorkingHours()}</td>
        </tr>
</table>

</body>
</html>
