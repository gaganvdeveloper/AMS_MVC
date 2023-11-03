<!DOCTYPE html>
<html>
<head>
    <title>Attendance Form</title>
</head>
<body>

<form action="saveAttendance" >
    <label for="date">Date:</label>
    <input type="date" id="date" name="date"><br>

    <label for="loginTime">Login Time:</label>
    <input type="text" id="loginTime" name="loginTime" placeholder="HH:mm"><br>

    <label for="logoutTime">Logout Time:</label>
    <input type="text" id="logoutTime" name="logoutTime" placeholder="HH:mm"><br>

    <label for="attendanceStatus">Attendance Status:</label>
    <select id="attendanceStatus" name="attendanceStatus">
        <option value="PRESENT">PRESENT</option>
        <option value="ABSENT">ABSENT</option>
        <option value="PRESENT_WFH">PRESENT_WFH</option>
        <option value="ABSENT_WFH">ABSENT_WFH</option>
        <option value="WFH">WFH</option>
        <option value="COLLEGE_TRAINING">COLLEGE_TRAINING</option>
    </select><br>

    <label for="totalWorkingHours">Total Working Hours:</label>
    <input type="number" id="totalWorkingHours" name="totalWorkingHours"><br>

    <!-- Input for batchs (might be a dropdown or multi-select) -->
    <!-- <select id="batchs" name="batchs" multiple="true"> ... </select> -->

    <input type="submit" value="Submit">
</form>

</body>
</html>
