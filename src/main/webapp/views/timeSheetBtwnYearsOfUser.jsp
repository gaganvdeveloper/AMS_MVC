<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="/ams_mvc/BtwnYears?userId=1" method="post">
		from Year <input type="text" name="fYear" placeholder="YYYY"><br>
		To Year <input type="text" name="tYear" placeholder="YYYY"><br>
		<button type="submit">submit</button>
	</form>
</body>
</html>