<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="/ams_mvc/BtwnMonthsOfYear?userId=1" method="post">
		From Month<input type="text" name="fMonth"
			placeholder="enter full month name"><br> To Month<input
			type="text" name="tMonth" placeholder="enter full month name"><br>
		Year <input type="text" name="year" placeholder="YYYY"><br>
		<button type="submit">submit</button>
	</form>
</body>
</html>