<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" isELIgnored="false"%>
    
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>User Registration Page</title>
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
    <h1>User Registration!!!</h1>
    <form action="saveuser" modelAttribute="user" method="post">
        EMP ID: <input type="text" name="empId">
        Name: <input type="text" name="name">
        Email: <input type="text" name="email">
        Phone: <input type="text" name="phone">
        Password: <input type="password" name="password">
        <br><br>
        Role: 
        <select name="userRole">
            <option value="---Select---"></option>
            <option value="TRAINER">TRAINER</option>
            <option value="HR">HR</option>
            <option value="ADMIN">ADMIN</option>
        </select>
        Status: 
        <select name="userStatus">
            <option value="---Select---"></option>
            <option value="ACTIVE">ACTIVE</option>
            <option value="INACTIVE">INACTIVE</option>
        </select>
        Category: 
        <select name="userCategory">
            <option value="---Select---"></option>
            <option value="TRAINER">TRAINER</option>
            <option value="LATERAL">LATERAL</option>
        </select>
        <br><br>
        <button type="submit">Create User</button>
    </form>
</body>
</html>
