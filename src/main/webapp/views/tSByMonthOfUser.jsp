<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="/ams_mvc/byMonth/User">
		<input readonly="readonly" value=${param.id } name="id"> Month
		<input type="text" name="month" placeholder="month"> Year <input
			type="text" name="year" placeholder="YYYY">
		<button type="submit">submit</button>
	</form>
</body>
</html>