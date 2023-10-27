<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" isELIgnored="false"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>HR Home</title>
</head>
<body>
	<h1>${msg }</h1>
	
	<table border="1" cellpadding="5" cellspacing="1">
		
		<thead>
			<tr>
				<th>ID</th>
				<th>EMPID</th>
				<th>Name</th>
				<th>Email</th>
				<th>Phone</th>
				<th>Password</th>
				<th>Role</th>
				<th>Category</th>
				<th>Status</th>
				<th>Update</th>
				<th>Delete</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="us" items="${users }">
				<tr>
					<td>${us.getUserId() }</td>
					<td>${us.getEmpId() }</td>
					<td>${us.getName() }</td>
					<td>${us.getEmail() }</td>
					<td>${us.getPhone() }</td>
					<td>${us.getPassword() }</td>
					<td>${us.getUserRole() }</td>
					<td>${us.getUserCategory() }</td>
					<td>${us.getUserStatus() }</td>
					<td> <a href="updateuser?id=${us.getUserId() }"> <button type="button">Update</button> </a> </td>
					<td> <a href="deleteuser?id=${us.getUserId() }"> <button type="button">Delete</button> </a> </td>
				</tr>
			</c:forEach>
		</tbody>
		
		
	</table>
	
	
	
	
	
</body>
</html>