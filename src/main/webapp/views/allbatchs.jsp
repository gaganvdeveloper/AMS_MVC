<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>All Batchs</title>
</head>
<body>


	<table border="2" cellpadding="10" cellspacing="1">

		<tr>
			<th>Batch Id</th>
			<th>Batch Code</th>
			<th>Subject name</th>
			<th>Batch Status</th>
			<th>Batch Start Date</th>
			<th>Batch End Date</th>
			<th>Login Time</th>
			<th>Logout Time</th>
			<th>Total Days</th>
			<th>Batch Mode</th>
			<th>Institute Name</th>
			<th>Institute Location</th>
			<th>delete</th>
			<th>update</th>
		</tr>

		<c:forEach var="bat" items="${batchs }">
			<tr>
				<td>${bat.getBatchId() }</td>
				<td>${bat.getBatchCode() }</td>
				<td>${bat.getSubjectName() }</td>
				<td>${bat.getBatchStatus() }</td>
				<td>${bat.getBatchStartDate() }</td>
				<td>${bat.getBatchEndDate() }</td>
				<td>${bat.getLoginTime() }</td>
				<td>${bat.getLogoutTime() }</td>
				<td>${bat.getTotalDays() }</td>
				<td>${bat.getBatchMode() }</td>
				<td>${bat.getInstituteName() }</td>
				<td>${bat.getLocation() }</td>
				<td> <a href="deletebatch?id=${bat.getBatchId() }"> <button  type="button">Delete</button> </a> </td>
				<td><a href="updatebatch?id=${bat.getBatchId() }"> <button  type="button">Update</button> </a> </td>
			</tr>
		</c:forEach>

 <%-- <table border="1" cellpadding="15" id="table">
        <tr style="background-color: rgb(188, 252, 255)">
          <th>Id</th>
          <th>EMPId</th>
          <th>Name</th>
          <th>Email</th>
          <th>Phone</th>
          <th>Role</th>
          <th>Update</th>
          <th>Delete</th>
          <th>Details</th>
        </tr>
			<c:forEach var="us" items="${users }">
				<tr>
					<td>${us.getUserId() }</td>
					<td>${us.getEmpId() }</td>
					<td>${us.getName() }</td>
					<td>${us.getEmail() }</td>
					<td>${us.getPhone() }</td>
					<td>${us.getUserRole() }</td>
					<td> <a href="updateuser?id=${us.getUserId() }"> <button class="updateButton" type="button">Update</button> </a> </td>
					<td> <a href="deleteuser?id=${us.getUserId() }"> <button class="deleteButton" type="button">Delete</button> </a> </td>
					<td> <a href="userdetails?id=${us.getUserId() }"> <button class="updateButton" type="button">Details</button> </a> </td>
				</tr>
			</c:forEach>
      </table>
 --%>


	</table>













</body>
</html>