<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="refresh" content="10">
<title>Login Page</title>
<style>
body {
	font-family: Arial, sans-serif;
	background-color: #f0f0f0;
	text-align: center;
	margin: 0;
	padding: 0;
	background-image:
		url("https://www.testyantra.com/sites/default/files/tylog1.png");
	background-repeat: no-repeat;
	background-attachment: fixed;
	background-size: 80%;
	background-position: 100px;
}

h1 {
	color: #333;
}

form {
	background-color: rgb(0, 0, 0, 0.4);
	padding: 20px 20px;
	border-radius: 5px;
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.2);
	width: 300px;
	margin: 0 auto;
}

input[type="text"], input[type="password"] {
	width: 90%;
	padding: 10px;
	margin: 10px 0;
	border: 1px solid #ccc;
	border-radius: 5px;
	font-size: 16px;
}

button[type="submit"] {
	background-color: green;
	color: #fff;
	padding: 10px 20px;
	border: none;
	border-radius: 5px;
	cursor: pointer;
	font-size: 16px;
	font-weight: bold;
}

button[type="submit"]:hover {
	background-color: lightgreen;
	color: #333;
}
</style>
</head>
<body>
	<h1
		style="font-size: 4vw; font-family: cursive; color: rgb(142, 250, 0); color: darkgreen; text-shadow: 0px 0px 40px; margin-left: 3%; cursor: pointer;">AlphaAttendance.com</h1>
	<p>${msg }</p>
	<h2>Login Here!!!...</h2>
	<form action="userloginvalidate" method="post">
		Email : <input type="text" name="email" placeholder="Enter Your Email"
			value="prajwala@gmail.com"> Password : <input type="password"
			name="password" placeholder="Enter Password" value="123">
		<button type="submit">Login</button>
	</form>
</body>
</html>
