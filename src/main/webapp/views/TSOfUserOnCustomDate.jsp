<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="/ams_mvc/custom-user" method="get">
		<h1>From:</h1>
		<input type="hidden" name="id" value="${param.id}"> Month<input
			type="text" name="fMonth" placeholder="enter full month name"><br>
		<br> Year <input type="text" name="fYear" placeholder="YYYY"><br>
		<h1>TO:</h1>
		Month<input type="text" name="tMonth"
			placeholder="enter full month name"><br> <br> Year
		<input type="text" name="tYear" placeholder="YYYY"><br> <br>
		<button type="submit">submit</button>
	</form>

</body>
</html>