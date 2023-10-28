<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>User Details Page</title>
</head>
<body>

	<h1>User Summary!!!...</h1>
	<br>
	<hr>
	
	<table border="1" cellpadding="10" cellspacing="1">

		<tr>
			<th>Name</th>
			<td>${user.getName() }</td>
		</tr>
		<tr>
			<th>Email</th>
			<td>${user.getEmail() }</td>
		</tr>
		<tr>
			<th>Phone</th>
			<td>${user.getPhone() }</td>
		</tr>
		<tr>
			<th>Role</th>
			<td>${user.getUserRole() }</td>
		</tr>
		<tr>
			<th>Status</th>
			<td>${user.getUserStatus() }</td>
		</tr>
		<tr>
			<th>Categoey</th>
			<td>${user.getUserCategory() }</td>
		</tr>


		<tr>
			<table border="2">
			
				<tr>
					<th>Batch</th>
					<th>Column 2 Heading</th>
				</tr>
				<tr>
					<td>Row 1: Col 1</td>
					<td>Row 1: Col 2</td>
				</tr>
			</table>





		</tr>




	</table>




</body>
</html>