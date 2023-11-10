<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>fetch time-sheet between custom Dates</h2>
	<form action="/ams_mvc/custom-All">
		<h4>From:</h4>
		Month:<select id="month" name="fMonth">
			<option value="January">January</option>
			<option value="February">February</option>
			<option value="march">march</option>
			<option value="april">april</option>
			<option value="may">may</option>
			<option value=june>june</option>
			<option value="july">july</option>
			<option value="august">august</option>
			<option value="september">september</option>
			<option value="october">october</option>
			<option value=november>november</option>
			<option value="december">december</option>
		</select> Year:<input type="number" id="year" name="fYear" min="2022" max="2099">
		<br> <br>
		<h4>TO:-</h4>
		<label for="tMonth">Month:</label> <select id="month" name="tMonth">
			<option value="January">January</option>
			<option value="February">February</option>
			<option value="march">march</option>
			<option value="april">april</option>
			<option value="may">may</option>
			<option value=june>june</option>
			<option value="july">july</option>
			<option value="august">august</option>
			<option value="september">september</option>
			<option value="october">october</option>
			<option value=november>november</option>
			<option value="december">december</option>
		</select> Year:<input type="number" id="year" name="tYear" min="2022"
			max="2099">


		<button type="submit">Submit</button>
	</form>

	<!-- 	<div id="result"></div> -->



	<!-- Month
	<input type="text" name="fMonth" placeholder="enter full month name">
	<br>
	<br> Year
	<input type="text" name="fYear" placeholder="YYYY">
	<br>
	<h4>TO:</h4>
	Month
	<input type="text" name="tMonth" placeholder="enter full month name">
	<br>
	<br> Year
	<input type="text" name="tYear" placeholder="YYYY">
	<br>
	<br>
	<button type="submit">submit</button> -->
	</form>

</body>
</html>