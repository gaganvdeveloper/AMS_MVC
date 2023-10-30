<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Update User Page</title>
 <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
        }
        
        h1 {
            text-align: center;
            color: #333;
        }

        form {
            max-width: 500px;
            margin: 20px auto;
            padding: 20px;
            background: #fff;
            border-radius: 5px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        input[type="text"],
        input[type="password"],
        select {
            width: 100%;
            padding: 10px;
            margin: 5px 0;
            border: 1px solid #ccc;
            border-radius: 4px;
            box-sizing: border-box;
        }

        select {
            width: 100%;
            padding: 10px;
            margin: 5px 0;
            border: 1px solid #ccc;
            border-radius: 4px;
            box-sizing: border-box;
        }

        button {
            background-color: #4CAF50;
            color: white;
            padding: 15px 20px;
            margin: 8px 0;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            width: 100%;
        }

        button:hover {
            background-color: #45a049;
        }
    </style>

</head>
<body>
	<h1>User Update!!!...</h1>
	<form:form action="updateuserupdate" modelAttribute="user">
		<form:input path="userId" type="hidden" />
		<form:input path="img" type="hidden"/>
		EMPID : <form:input path="empId" readonly="true"/>
		Name : <form:input path="name"/>
		Email : <form:input path="email"/>
		Phone : <form:input path="phone"/>
		Password : <form:input path="password"/>
		<br>
		<br>
		Role : <form:select path="userRole">
					<form:option value="---Select---"></form:option>
					<form:option value="TRAINER"></form:option>
					<form:option value="HR"></form:option>
					<form:option value="ADMIN"></form:option>
				</form:select>
		Status : <form:select path="userStatus">
					<form:option value="---Select---"></form:option>
					<form:option value="ACTIVE"></form:option>
					<form:option value="IN_ACTIVE"></form:option>
				</form:select>
		Category : <form:select path="userCategory">
					<form:option value="---Select---"></form:option>
					<form:option value="TRAINER"></form:option>
					<form:option value="LATERAL"></form:option>
				</form:select>
				<br>
				<br>
		<button type="submit">Update User</button>
	</form:form>
	
	
</body>
</html>