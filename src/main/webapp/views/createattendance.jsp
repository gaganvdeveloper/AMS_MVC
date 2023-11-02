<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" isELIgnored="false"%>
    <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

	
	<!--<form:form action="saveattendance" modelAttribute="attendance">
		Date : <select name="date">
					<option value="01">01</option>
					<option value="02">02</option>
					<option value="03">03</option>
					<option value="04">04</option>
					<option value="05">05</option>
					<option value="06">06</option>
					<option value="07">07</option>
					<option value="08">08</option>
					<option value="09">09</option>
					<option value="10">10</option>
					<option value="11">11</option>
					<option value="12">12</option>
					<option value="13">13</option>
					<option value="14">14</option>
					<option value="15">15</option>
					<option value="16">16</option>
					<option value="17">17</option>
					<option value="18">18</option>
					<option value="19">19</option>
					<option value="20">20</option>
					<option value="21">21</option>
					<option value="22">22</option>
					<option value="23">23</option>
					<option value="24">24</option>
					<option value="25">25</option>
					<option value="26">26</option>
					<option value="27">27</option>
					<option value="28">28</option>
					<option value="29">29</option>
					<option value="30">30</option>
					<option value="31">31</option>
				</select>
		Month : <select name="month">
					<option value="01">01</option>
					<option value="02">02</option>
					<option value="03">03</option>
					<option value="04">04</option>
					<option value="05">05</option>
					<option value="06">06</option>
					<option value="07">07</option>
					<option value="08">08</option>
					<option value="09">09</option>
					<option value="10">10</option>
					<option value="11">11</option>
					<option value="12">12</option>
				</select>
		Year :	<select name="year">
					<option value="2023">2023</option>
					<option value="2024">2024</option>
					<option value="2025">2025</option>
					<option value="2026">2026</option>
					<option value="2027">2027</option>
					<option value="2028">2028</option>
					<option value="2029">2029</option>
					<option value="2030">2030</option>
					<option value="2031">2031</option>
					<option value="2032">2032</option>
					<option value="2033">2033</option>
					<option value="2034">2034</option>
					<option value="2035">2035</option>
				</select>
	</form:form>-->
	
	
<!DOCTYPE html>
<html lang="en">
  <head>
    <title>Create Attendance Page</title>
    <style>
      body {
        font-family: Arial, sans-serif;
        background-color: #f0f0f0;
        text-align: center;
        margin: 0;
        padding: 0;
      }

      h2 {
        color: #333;
      }

      form {
        background-color: #fff;
        border: 1px solid #ccc;
        border-radius: 5px;
        width: 300px;
        margin: 0 auto;
        padding: 20px;
        box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
      }

      label {
        display: block;
        font-weight: bold;
        margin-top: 10px;
      }

      input[type="date"],
      input[type="time"],
      select {
        width: 100%;
        padding: 10px;
        margin-top: 5px;
        border: 1px solid #ccc;
        border-radius: 4px;
        box-sizing: border-box;
      }

      select {
        appearance: none;
        -webkit-appearance: none;
        -moz-appearance: none;
        background: url("https://cdn.iconscout.com/icon/free/png-256/chevron-down-18-454643.png")
          no-repeat right center;
      }

      select::before {
        content: "";
        display: block;
        position: absolute;
        top: 50%;
        right: 10px;
        width: 12px;
        height: 12px;
        transform: translateY(-50%);
        background: url("https://cdn.iconscout.com/icon/free/png-256/chevron-down-18-454643.png")
          no-repeat;
      }

      #status::before {
        content: "";
        display: block;
        position: absolute;
        top: 50%;
        right: 10px;
        width: 12px;
        height: 12px;
        transform: translateY(-50%);
        background: url("https://cdn.iconscout.com/icon/free/png-256/chevron-down-18-454643.png")
          no-repeat;
      }

      input[type="submit"] {
        background-color: #007bff;
        color: #fff;
        border: none;
        border-radius: 4px;
        padding: 10px;
        cursor: pointer;
        margin-top: 15px;
      }

      input[type="submit"]:hover {
        background-color: #0056b3;
      }
    </style>
  </head>
  <body>
    <h2>Mark Your Attendance Here!!!...</h2>
    <form id="attendanceform" action="createattendancecreate" method="get">
      <label for="date">Date:</label>
      <input type="date" name="date" id="date" />

      <label for="logintime">Login Time:</label>
      <input type="time" name="logintime" id="logintime" />

      <label for="logouttime">Logout Time:</label>
      <input type="time" name="logouttime" id="logouttime" />
		
      <label for="status">Status:</label>
      <select name="batchStatus" id="status">
        <option value="PRESENT" selected>PRESENT</option>
        <option value="ABSENT">ABSENT</option>
        <option value="WFH">WFH</option>
        <option value="PRESENT_WFH">PRESENT + WFH</option>
        <option value="ABSENT_WFH">ABSENT + WFH</option>
        <option value="COLLEGE_TRAINING">COLLEGE TRAINING</option>
      </select>
      <br /><br />
      <div id="totalhours"></div>

      <input id="butt" type="submit" value="Mark Attendance" />
    </form>

    <script>

      function calculateWorkingHours() {
        const loginTimeInput = document.getElementById("logintime");
        const logoutTimeInput = document.getElementById("logouttime");
        const resultElement = document.getElementById("totalhours");

        if (loginTimeInput.value && logoutTimeInput.value) {
          const loginTime = new Date(`1970-01-01T${loginTimeInput.value}`);
          const logoutTime = new Date(`1970-01-01T${logoutTimeInput.value}`);

          const timeDifference = (logoutTime - loginTime) / 1000; 
          const hours = Math.floor(timeDifference / 3600); 
          const minutes = Math.floor((timeDifference % 3600) / 60); 

          resultElement.textContent = `Total Working Hours: ${hours} hours and ${minutes} minutes`;
         
          
        } else {
          resultElement.textContent =
            "Please enter both login and logout times.";
        }
      }

      document
        .getElementById("attendanceform")
        .addEventListener("submit", function (e) {
          e.preventDefault(); 
          calculateWorkingHours();
          setTimeout(()=>{document.getElementById("attendanceform").submit();},2000);
          
        });
    </script>
  </body>
</html>
