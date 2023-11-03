<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Update Batch Page</title>

<style>
#update-form {
	display: flex;
	flex-direction: column;
	width: 30%;
	margin: auto;
	padding: 10px;
}
</style>


</head>
<body>


	<h1>update Batch Here!!!...</h1>

	<form:form id="update-form" action="updatebatchlogic" modelAttribute="bat">
	<form:input path="batchId" readonly="true" />
	<form:input path="userId" type="hidden"/>
	Batch Code : <form:input path="batchCode" />
	Subject Name : <form:input path="subjectName" />
	Batch Status : <form:select path="batchStatus">
			<form:option value="NOT_YET_ASSIGNED"></form:option>
			<form:option value="ON_GOING"></form:option>
			<form:option value="COMPLETED"></form:option>
		</form:select>
	Batch Start Date : <form:input path="batchStartDate" />
	Batch End Date : <form:input path="batchEndtDate" />
	Login Time : <form:input path="loginTime" />
	Logout Time : <form:input path="logoutTime" />
	Total Days : <form:input path="totalDays" />
	Batch Mode : <form:select path="batchMode">
			<form:option value="ONLINE"></form:option>
			<form:option value="OFFLINE"></form:option>
		</form:select>
	Institute Name : <form:input path="instituteName" />
	Institute Location : <form:input path="location" />
		<button type="submit">Update Batch</button>
	</form:form>



	<%-- <form action="updatebatchlogic" method="post">
		Batch Id:<input type="text" name="batchid" value="${bat.getBatchId() }" readonly="true">
		Batch Code : <input type="text" name="batchcode" value="${bat.getBatchCode() }" placeholder="Enter Your name">
		Subject name : <input type="text" name="subname" value="${bat.getSubjectName() }" placeholder="Enter Your name">
		Batch Status : <select name="batchstatus" value="${bat.getBatchStatus()}">
			<option value="NOT_YET_ASSIGNED">NOT_YET_ASSIGNED</option>
			<option value="ON_GOING">ON_GOING</option>
			<option value="COMPLETED">COMPLETED</option>
		</select>
		Batch Start Date : 
		<br>
		<br>
		Date : <select id="startday" name="startday" value="${bat.getBatchStartDate().getDayOfMonth() }">
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
		Month : <select id="startmonth" name="startmonth" value="${bat.getBatchStartDate().getMonthValue() }">
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
		Year :	<select id="startyear" name="startyear" value="${bat.getBatchStartDate().getYear() }">
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
		
		<br>
		<br>
		<br>
		Login Time : <select id="logintime" name="logintime" value="${bat.getLoginTime() }">
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
					<select>
						<option value="AM">AM</option>
						<option value="PM">PM</option>
					</select>
					
					
			Logout Time : <select id="logouttime" name="logouttime" value="${bat.getLogoutTime() }">
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
					<select>
						<option value="AM">AM</option>
						<option value="PM">PM</option>
					</select>
					
					
					
					<br>
					<br>
					<br>
					<br>
					
			Batch Mode : <select name="batchmode" value="${bat.getBatchMode() }">
							<option value="ONLINE">ONLINE</option>
							<option value="OFFLINE">OFFLINE</option>
						</select>
					<br>
					<br>
					<br>
			Institute Name : <input type="text" name="institutename" placeholder="Enter Institute Name" value="${bat.getInstituteName() }">	<br><br>				
			Institute Location : <input type="text" name="institutelocation" placeholder="Enter Institute Location" value="${bat.getLocation() }">
			<button type="submit">update Batch</button>
		</form>
	
	
	
	
	
	
	
	<script>
	
	
	document.getElementById("startday").value="${bat.getBatchStartDate().getDayOfMonth() }";
	document.getElementById("logintime").value="${bat.getLoginTime() }";
	
	
	
	
	
	
	
	</script>
	 --%>

























</body>
</html>