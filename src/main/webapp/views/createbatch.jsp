<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Create Batch Page</title>
</head>
<body>
		
		<h1>Create Batch Here!!!...</h1>
	
		<form action="savebatch" method="post">
		
		Batch Code : <input type="text" name="batchcode" placeholder="Enter Your name">
		Subject name : <input type="text" name="subname" placeholder="Enter Your name">
		Batch Status : <select name="batchstatus">
			<option value="NOT_YET_ASSIGNED">NOT_YET_ASSIGNED</option>
			<option value="ON_GOING">ON_GOING</option>
			<option value="COMPLETED">COMPLETED</option>
		</select>
		Batch Start Date : 
		<br>
		<br>
		Date : <select name="startday">
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
		Month : <select name="startmonth">
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
		Year :	<select name="startyear">
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
		Login Time : <select name="logintime">
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
					
					
			Logout Time : <select name="logouttime">
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
					
			Batch Mode : <select name="batchmode">
							<option value="ONLINE">ONLINE</option>
							<option value="OFFLINE">OFFLINE</option>
						</select>
					<br>
					<br>
					<br>
			Institute Name : <input type="text" name="institutename" placeholder="Enter Institute Name" value="J-Spiders">	<br><br>				
			Institute Location : <input type="text" name="institutelocation" placeholder="Enter Institute Location" value="REMOTE">
			<button type="submit">Create Batch</button>
		</form>
	
	
	
	
	

</body>
</html>