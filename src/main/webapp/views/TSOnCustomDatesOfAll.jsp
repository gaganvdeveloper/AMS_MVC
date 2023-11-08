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
		<input input type="date" name="fromDate"><br>
		<br> Month<input type="text" name="fMonth"
			placeholder="enter full month name"><br> <br> Year
		<input type="text" name="fYear" placeholder="YYYY"><br>
		<h4>TO:</h4>
		Month<input type="text" name="tMonth"
			placeholder="enter full month name"><br> <br> Year
		<input type="text" name="tYear" placeholder="YYYY"><br> <br>
		<button type="submit">submit</button>
	</form>

</body>
</html>