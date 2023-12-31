<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
    <title>Attendance List</title>
</head>
<body>

<h2>Attendance List</h2>
<h3>${msg}</h3>

<table border="1">
    <tr>
        <th>Attendance ID</th>
        <th>Date</th>
        <th>Login Time</th>
        <th>Logout Time</th>
        <th>Attendance Status</th>
        <th>Total Working Hours</th>
        <th>Update</th>
    </tr>

    <c:forEach var="attendance" items="${list}">
        <tr>
            <td>${attendance.attendanceId}</td>
            <td>${attendance.date}</td>
            <td>${attendance.loginTime}</td>
            <td>${attendance.logoutTime}</td>
            <td>${attendance.attendanceStatus}</td>
            <td>${attendance.totalWorkingHours}</td>
            <td> <button> <a href="getupdate?id=${attendance.attendanceId}">Update</a> </button> </td>
        </tr>
    </c:forEach>
</table>
<button><a href="trainerhome">Back</a></button>
</body>
</html>
