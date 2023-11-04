<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Attendance Form</title>
</head>
<body>
    <h1>Attendance Form</h1>
    <form action="saveattendance" method="get">
        <label for="date">Date:</label>
        <input type="date" id="date" name="date" required><br>

        <label for="loginTime">Login Time:</label>
      format HH:mm  <input type="text" id="loginTime" name="loginTime" required><br>

        <label for="logoutTime">Logout Time:</label>
      format HH:mm  <input type="text" id="logoutTime" name="logoutTime" required><br>

        <label for="totalWorkingHours">Total Working Hours:</label>
        <input type="text" id="totalWorkingHours" name="totalWorkingHours" required><br>

        <label for="attendanceStatus">Attendance Status:</label>
        <select id="attendanceStatus" name="attendanceStatus" required>
            <option value="PRESENT">PRESENT</option>
            <option value="ABSENT">ABSENT</option>
            <option value="PRESENT_WFH">PRESENT_WFH</option>
            <option value="ABSENT_WFH">ABSENT_WFH</option>
            <option value="WFH">WFH</option>
            <option value="COLLEGE_TRAINING">COLLEGE_TRAINING</option>
        </select><br>

        <input type="submit" value="Submit">
    </form>
</body>
</html>
