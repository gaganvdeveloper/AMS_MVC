<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>User Login Page</title>
</head>
<body>
	<h1>${msg }</h1>
	<h1>Login Here!!!...</h1>
	<form action="userloginvalidate">
		Email : <input type="text" name="email" placeholder="Enter Your Email">
		Password : <input type="text" name="password" placeholder="Enter Password">
		<button type="submit">Login</button>
	</form>
	
	
</body>
</html>