<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%-- <% response.sendRedirect("login");%> --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Index Page</title>
</head>
    <style>
        body {
            background-color: rgb(0,0,0,0.5);
            color: #fff;
            font-family: Arial, sans-serif;
        }

        a {
            text-decoration: none;
            color: #fff;
            margin: 10px;
        }

        a:hover {
            color: #e50914;
        }

        .container {
            text-align: center;
        }

        .header {
            padding: 20px;
        }

        .nav {
            background-color: #141414;
            padding: 10px 0;
        }

        .nav a {
            margin: 0 15px;
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="header">
            <img src="https://www.testyantra.com/sites/default/files/tylog1.png" alt="Test Yantra Logo">
        </div>
        <div class="nav">
            <a href="userlogin">User Login</a>
            <a href="user">Create a User</a>
        </div>
    </div>
    <!-- 
    <div><a href="createattendance">Create Attendance</a></div><br>
    <div><a href="findAttendance">FindAttendance</a></div><br>
    <div><a href= "deleteAttendance">Delete Attendance</a></div><br>
    <div><a href= "findstatus">findByStatus</a></div><br>
    <div><a href= "findbydate">findbydate</a></div><br>
    <div><a href= "findAllattendance">findAllattendance</a></div><br>
    <div><a href= "update">update</a></div><br>
    <div><a href= "findallattendancebystatusanddate">findallattendancebystatusanddate</a></div><br>
     -->
</body>
</html>
