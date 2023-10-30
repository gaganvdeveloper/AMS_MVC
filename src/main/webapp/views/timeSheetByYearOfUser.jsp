<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="/ams_mvc/byYearofUser?userId=1" method="post">
		<!-- heree i have pass user id from the session object -->
		Year <input type="text" name="year" placeholder="YYYY"> <input
			type="hidden" value="">
		<button type="submit">submit</button>
	</form>
</body>
</html>