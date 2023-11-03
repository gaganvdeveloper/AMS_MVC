<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

	<%-- <form:form action="saveupdate" modelAttribute="attendance">

		<form:input path="attendanceId" readonly="true" /><br>
		<form:input path="date" readonly="true" /><br>
		<form:input path="loginTime" /><br>
		<form:input path="logoutTime" /><br>
		<form:input path="attendanceStatus" /><br>
		<form:input path="totalWorkingHours" /><br>
		<button type="submit">Update</button>
	</form:form> --%>
	
	<h2>Mark Your Attendance Here!!!...</h2>
    <form id="attendanceform" action="saveupdate" method="get">
    
        <label for="attendanceId">Id:</label>
      <input type="text" name="attendanceId" id="attendanceId" value="${attendance.getAttendanceId()}" readonly="readonly" />
       
      <label for="date">Date:</label>
      <input type="date" name="date" id="date" value="${attendance.getDate()}" readonly="readonly" />

      <label for="logintime">Login Time:</label>
      <input type="time" name="logintime" id="logintime" value="${attendance.getLoginTime()}" readonly="readonly" />

      <label for="logouttime">Logout Time:</label>
      <input type="time" name="logouttime" id="logouttime" value="${attendance.getLogoutTime()}" />
		
      <label for="status">Status:</label>
      <select name="batchStatus" id="status" value="${attendance.getAttendanceStatus()}">
        <option value="PRESENT" selected>PRESENT</option>
        <option value="ABSENT">ABSENT</option>
        <option value="WFH">WFH</option>
        <option value="PRESENT_WFH">PRESENT + WFH</option>
        <option value="ABSENT_WFH">ABSENT + WFH</option>
        <option value="COLLEGE_TRAINING">COLLEGE TRAINING</option>
      </select>
      <br /><br />
      <label for="totalWorkingHours">Total Working Hours:</label>
      <input type="time" name="totalWorkingHours" id="totalWorkingHours" value="${attendance.getTotalWorkingHours()}" />
      
      <!-- <div id="totalhours"></div> -->
      
      <br><br>
      <input id="butt" type="submit" value="Update Attendance" />
    </form>


</body>
</html>