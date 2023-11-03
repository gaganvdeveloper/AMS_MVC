<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>Fetch Your TimeSheet between two dates</h1>
	<form action="/ams_mvc/custom-user" method="get">
		<h3>From Date:</h3>
		<input type="hidden" name="id" value="${param.id}"> Month<input
			type="text" name="fMonth" placeholder="enter full month name"><br>
		<br> Year <input type="text" name="fYear" placeholder="YYYY"><br>
		<h3>TO Date:</h3>
		Month<input type="text" name="tMonth"
			placeholder="enter full month name"><br> <br> Year
		<input type="text" name="tYear" placeholder="YYYY"><br> <br>
		<button type="submit">submit</button>
	</form>

</body>
</html>