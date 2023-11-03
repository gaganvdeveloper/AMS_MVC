<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h3>fetching time sheet of one particular month</h3>
	<form action="/ams_mvc/byMonth/User">
		<input type="hidden" value=${param.id } name="id"><br> <br>
		Month <input type="text" name="month" placeholder="month"><br>
		<br> Year <input type="text" name="year" placeholder="YYYY"><br>
		<br>
		<button type="submit">submit</button>
	</form>
</body>
</html>