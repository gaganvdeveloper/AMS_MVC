<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" isELIgnored="false"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <title>HR Home Page</title>
    <link
      rel="stylesheet"
      href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css"
      integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA=="
      crossorigin="anonymous"
      referrerpolicy="no-referrer"
    />

    <style>
    /* .articl{
    		z-index: 1;
            width: 100%;
            height: auto;
            background: linear-gradient(-45deg, crimson,green,gold, lightgreen,yellow,pink,purple,cyan);
            background-size: 1000% 1000%;
            animation: animate 30s ease infinite;
    } */
   
	    a{
	    	text-decoration: none;
	    }
      .logo {
        font-size: 2vw;
        font-family: cursive;
        color: rgb(142, 250, 0);
        text-shadow: 0px 0px 40px;
        margin-right:5vw;
        cursor: pointer;
      }
      .logo:hover {
        color: rgb(142, 250, 70);
      }

      /*Google font Poppins*/

      @import url("https://fonts.googleapis.com/css2?family=Poppins:wght@100;200;300;400;500&display=swap");

      :root {
        --primary: #eeeeee;
        --secondary: #227c70;
        --green: #82cd47;
        --secondary-light: rgb(34, 124, 112, 0.2);
        --secondary-light-2: rgb(127, 183, 126, 0.1);
        --white: #fff;
        --black: #393e46;
        --shadow: 0px 2px 8px 0px var(--secondary-light);
      }

      * {
        margin: 0;
        padding: 0;
        list-style-type: none;
        box-sizing: border-box;
        font-family: "Poppins", sans-serif;
      }

      body {
        height: auto;
        width: 100%;
        background-image:url(https://www.testyantra.com/sites/default/files/tylog1.png);
        background-size: 80vw 12vw;
        background-position: center;
        background-repeat: no-repeat;
        background-attachment: fixed;
       /*  z-index: 1;
        background: linear-gradient(
          -45deg,
          crimson,
          green,
          gold,
          lightgreen,
          yellow,
          pink,
          purple,
          cyan
        );
        background-size: 1000% 1000%;
        animation: animate 30s ease infinite; */
      }

      .navbar {
        display: flex;
        align-items: center;
        height: 70px;
        background-color: black; 
        background:linear-gradient(15deg, #13547a 0%, #80d0c7 100%);
/*         background:linear-gradient(to right,rgb(120,40,208,0.8),rgb(59,130,252,0.9)); */
        padding: 0 8%;
      }

      .navbar-list {
        width: 100%;
        text-align: right;
        padding-right: 2rem;
        margin: 0px 100px 0px 0px ;
        /* border: 2px solid red; */
        display: flex;
        justify-content: space-around;
        
      }

      .navbar-list li a {
        text-decoration: none;
      }
      .navbar-list li a button {
        background-color: white;
        cursor: pointer;
        color: black;
        padding: 0.1vw 0.4vw;
        border-radius: 5px;
        border: 1px solid var(--green);
        background-color: rgb(108,185,184);
        font-size:1vw;
        color:white;
        transition: 0.5s;
        border: 1px solid green;
      }

      .navbar-list li a button:hover {
        text-shadow: 0px 0px 10px white;
        box-shadow: 0vw 0.5vw 0.8vw black;
        border: 1px solid green;
      }

      .profile-dropdown {
        position: relative;
        width: fit-content;
      }

      .profile-img {
        position: relative;
        width: 3rem;
        height: 3rem;
        border-radius: 50%;
        background-size: cover;
        border: 1px solid black;
        background-position: center;
      }

      .profile-dropdown-btn {
        display: flex;
        align-items: center;
        justify-content: space-between;
        padding-right: 1vw;
        font-size: 1vw;
        font-weight:bold;
        border: 0.1vw solid white;
        border-radius: 1.8vw;
        cursor: pointer;
        width: auto;
        transition: box-shadow 0.2s background-color 0.2s;

      }

      .profile-dropdown-btn:hover {
      	transition:200ms;
        color: white;
        box-shadow: 0.5vw 0.5vw 1vw black;
      }

     

      /* .profile-img i {
        position: relative;
        margin: 10px;
        font-size: 1.6rem;
        color: green;
      } */

      .profile-dropdown-btn span {
        margin: 0 0.5vw;
       
      }

      .profile-dropdown-list {
        position: absolute;
        top: 4vw;
        width: 15vw;
        right: -1vw;
        background-color: var(--white);
        border-radius: 1vw;
        box-shadow: var(--shadow);
        max-height: 0;
        overflow: hidden;
        transition: max-height 0.5s;
        
      }

      .profile-dropdown-list.active {
        max-height: 100vw;
      }

      .profile-dropdown-list hr {
        border: 0.5px solid var(--green);
      }

      .profile-dropdown-list-itms {
        /* padding: 0.5rem 0 0.5rem 1rem; */
        padding:0.5vw 0vw 0.5vw 1vw;
        transition: background-color 0.2s, padding-left 0.2s;
      }

      .profile-dropdown-list-itms:hover {
        padding-left: 1.5rem;
        background-color: var(--secondary-light);
      }

      .profile-dropdown-list-itms a {
        display: flex;
        align-items: center;
        text-decoration: none;
        font-size: 0.9rem;
        font-weight: 500;
        color: var(--black);
        font-size: 1vw;
      }

      .profile-dropdown-list-itms a i {
        margin-right: 1rem;
        font-size: 1vw;
        width: 2.3rem;
        height: 2.3rem;
        background-color: var(--secondary);
        color: var(--white);
        line-height: 2.3rem;
        text-align: center;
        border-radius: 50%;
      }

      #searchinput {
        width: 15vw;
        background-color: rgb(243, 255, 243);
        outline: none;
        border: 0.1vw solid var(--green);
        padding: 0.2vw;
        padding-left: 1vw;
        border-radius: 0.5vw;
        margin-right: 1vw;
        font-size: 1vw;
        /* font-weight: bold; */
      }
      #searchinput:hover {
        background-color: rgb(243, 255, 243);
        color: darkgreen;
        text-shadow: 0px 0px 10px white;
        box-shadow: 0px 10px 10px var(--secondary);
        border: 1px solid white;
        transition: 200ms;
        /* font-size: 20px; */
      }











      article {
        /* border: 2px solid black; */
        margin: auto;
        margin-top: 0px;
        width: 80%;
        height: 75vh;
        box-shadow: 0px 0px 10px black;
        padding: 20px;
        border-radius: 10px;
        /* background-color: rgb(59, 59, 59); */
        /* background: linear-gradient(to right, #8bf0ff, #c4e0e5); */
        /* background: linear-gradient(to right, #cbbcff, #faaca8); */
      }
      .articl {
        margin: auto;
        margin-top: 40px;
        width: 95%;
        height: auto;
        box-shadow: 0px 0px 10px black;
        padding: 20px;
        border-radius: 10px;
        background-color: rgb(50,100,50,0.6);
      }
      article > div {
        /* border: 2px solid green; */
        display: flex;
        flex-direction: column;
        align-items: center;
        justify-content: space-around;
        height: 60vh;
        /* background-color: antiquewhite; */
      }
      article > div > button {
        border: 2px solid green;
        width: 10%;
        background-color: darkgreen;
        color: white;
        font-size: 20px;
        width: auto;
        padding: 5px 15px;
        border-radius: 10px;
        font-weight: bold;
      }
      article > div > button:hover {
        background-color: green;
        transform: scale(1.05);
        transition: 200ms;
        border: 2px solid green;
        color: white;
      }
      article > div > div {
        /* border: 2px solid red; */
        height: 90%;
        width: 80%;
        margin: auto;
        display: flex;
        justify-content: space-around;
        /* background-color: antiquewhite; */
        align-items: center;
      }
      article > div > div > div {
        /* border: 2px solid black; */
        display: flex;
        flex-direction: column;
        width: 40%;
        height: 50vh;
        border-radius: 10px;
        background-color: azure;
        padding: 20px;
        box-shadow: 0px 0px 10px black;
      }
      article > div > div > div > input {
        background-color: white;
        border: 1px solid silver;
        padding: 5px;
        width: 85%;
        margin: auto;
        border-radius: 5px;
        font-size: 2.2vh;
      }
      article > div > div > div > h2 {
        margin-bottom: 20px;
        text-align: center;
        background-color: bisque;
        border-radius: 8px;
        box-shadow: 0px 0px 3px black;
      }
      article > div > div > div > input:hover {
        border: 1px solid green;
      }
      article > div div > div > label {
        font-weight: 700;
        color: rgb(71, 68, 68);
        font-family: Arial, Helvetica, sans-serif;
      }
      #table {
        border: 1px solid white;
        box-shadow: 0px 0px 5px black;
        border-radius: 0.5vw;
        margin: auto;
        width: 80%;
      }
      #table > tr {
        background-color: antiquewhite;
      }
      .tr{
        background-color: antiquewhite;
      }
      #table > tr:hover {
        background-color: rgb(255, 255, 255);
      }
      .tr:hover {
        background-color: rgb(255, 255, 255);
      }
      #table > td,th {
        padding: 0.5vw 0.8vw;
        font-weight: bold;
        padding: 1vw 1.5vw;
        font-size: 1vw;
      }
      .tr>td,th {
        padding: 0.5vw 0.8vw;
        font-weight: bold;
        padding: 1vw 1.5vw;
        font-size: 1vw;
      }
      .tr >td > a > button {
      font-size:1vw;
        border: none;
        padding: 0.3vw 0.3vw;
        border-radius: 0.5vw;
        color: white;
        border: 1px solid white;
      }
      .tr > td > a > button:hover {
        border: 1px solid black;
      }
      .updateButton {
        background-color: green;
      }
      .updateButton:hover {
        background-color: rgb(6, 206, 6);
      }
      .deleteButton {
        background-color: crimson;
      }
      .deleteButton:hover {
        background-color: red;
      }

	#userfilter{
		float: right;
		margin-top: -2vw;
		outline: none;
		background-color: rgb(0,0,0,0.1);
		color: rgb(0,0,2);
		font-weight: bold;
		font-size:1vw;
		padding: 0.5vw;
		border-radius: 0.5vw;'
	}

	#userfilter>option{
		color: rgb(0,0,2);
		font-weight: bold;
		font-size:1vw;
		padding: 0.5vw;
	}
	#msg{
		display: none;
		position: fixed;
      	top: 15%;
      	left: 25%;
      	width: 50%;
      	height: 5%;
      	background-color: rgba(0,0,0, 0.6); 
      	z-index: 9999; 
      	text-align: center;
      	padding: 3px 10px;
      	font-size: 1.5vw;
      	color: white;
      	border-radius: 10px;
      	box-shadow: 0px 0px 10px black;
      	border: 1px solid white; 
	}
	
	
	
	
	
	
	
	 @keyframes animate{
            0%{
                background-position: 0% 50%;
            }
            50%{
                background-position: 100% 50%;
            }
            100%{
                background-position: 0% 50%;
            }
        }


      .arti {
        margin: auto;
        margin-top: 0vw;
        width: 95%;
        height: auto;
        box-shadow: 0px 0px 10px rgb(50,100,50,0.5);
        padding: 0.5vw 1vw;
        padding-top:3vw;
        border-radius:1vw;
        background-color:rgb(50,50,50,0.2);
        /* border-radius: 10px;
        z-index: 1;
        background: linear-gradient(
          -45deg,
          crimson,
          green,
          gold,
          lightgreen,
          yellow,
          pink,
          purple,
          cyan
        );
        background-size: 1000% 1000%;
        animation: animate 30s ease infinite; */
        display: grid;
        grid-template-columns: 30% 30% 30%;
        grid-template-rows: auto;
        justify-content: space-around;
        grid-gap: 2vw;

      }
      .card {
        font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        color: rgb(84, 111, 84);
        /* color: black; */
        padding: 0.8vw 0.7vw;
        height: auto;
        width: 100%;
        background: rgba(255, 255, 255, 0.9);
        background: rgba(0,0,0, 0.9);
        border-radius: 1vw;
        font-size: 1vw;
        border: 0.1vw solid silver;
      }

      .card:hover{
        box-shadow: 0vw 0vw 1vw black;
        transition: 300ms ;
        transform: scale(1.03);
        background: rgba(255, 255, 255, 0.95);
        /* background: rgba(0,0,0, 0.95); */
        color:black;
      }

      @keyframes animate {
        0% {
          background-position: 0% 50%;
        }
        50% {
          background-position: 100% 50%;
        }
        100% {
          background-position: 0% 50%;
        }
      }

      .card-buttons{
        font-size: 1vw;
        border: none;
        color: rgb(60, 80, 60);
        margin: 0.5vw .5vw;
        padding: 0.3vw 0.9vw;
        background-color: rgb(174, 254, 174);
        border-radius: 0.35vw;
        cursor: pointer;
        border: 0.1vw solid green;
      }

      .card-buttons:hover{
        box-shadow: 0vw 1vw 1vw darkgreen;
        transition: 200ms;
        border: 1px solid white;
      }
      .status{
        writing-mode: vertical-rl; 
        text-orientation: upright; 
        float: right; margin-top: -9vw; 
        background-color: gold; 
        color: white; 
        width: auto; 
        height: auto; 
        border-radius: 0.5vw; 
        padding: 0.2vw 0.3vw;
        /* border: 0.1vw solid white; */
        font-weight: bold;
        font-size: 1vw;
        cursor: pointer;
        text-shadow: -0.1vw -0.1vw 0.3vw green;
        font-family: Verdana, Geneva, Tahoma, sans-serif;
      }
      .status:hover{
        background-color: goldenrod;
        transition: 200ms;
      }

      .card-img{
        width: 5vw;
        height: 5vw;
        border-radius: 100%;
        border: 0.2vw solid white;
        background-position: center;
        background-repeat: no-repeat;
        cursor: pointer;

      }
      a{
        text-decoration: none;
      }
	


    </style>
  </head>
  <body>
  	
    <nav class="navbar">
      <a href="activeemployee"><h1 class="logo">AlphaAttendance.com</h1></a>
      <ul class="navbar-list">
      <li>
          <a href="user"><button type="button">Create Employee</button></a>
        </li>
        <!-- <li>
          <a href="#"><button type="button">Employees</button></a>
        </li> -->
        <li>
          <a href="createbatch"><button type="button">Create Batch</button></a>
        </li>
        
      </ul>

      <input
        type="text"
        name="search"
        id="searchinput"
        placeholder="Type to Search"
        onkeyup="searchTable()"
      />

      <div class="profile-dropdown">
        <div class="profile-dropdown-btn" onclick="abc()">
          <div class="profile-img">
            <!-- <i id="profileimage" class="fa-regular fa-user"></i> -->
            <img class="profile-img" alt="" src="data:image/jpeg;base64,${user.getImg()}">
          </div>
          <span>${user.getName()}</span>
        </div>

        <div class="profile-dropdown-list">
          <ul>
            <li class="profile-dropdown-list-itms">
              <a href="https://accounts.google.com/v3/signin/identifier?continue=https%3A%2F%2Faccounts.google.com%2F&followup=https%3A%2F%2Faccounts.google.com%2F&ifkv=AVQVeywd4Qbj_RxuqUuYquPkL95hExwttmIKqsLHcJ5A6fjfTyR4Ee-k4GZOVokY81BdTbhS_ra3&passive=1209600&flowName=GlifWebSignIn&flowEntry=ServiceLogin&dsh=S1325560807%3A1698522311172395&theme=glif">
                <i class="fa-regular fa-envelope"></i>
                Notifications
              </a>
            </li>
            <li class="profile-dropdown-list-itms">
              <a href="updateuser?id=${user.getUserId() }">
                <i class="fa-regular fa-user"></i>
                Update Profile
              </a>
            </li>

            <li class="profile-dropdown-list-itms">
              <a href="#">
                <i class="fa-solid fa-chart-line"></i>
                TimeSheets
              </a>
            </li>
            <li class="profile-dropdown-list-itms">
              <a href="updateprofilepic?id=${user.getUserId() }">
                <i class="fa-solid fa-sliders"></i>
                Update Profile Picture
              </a>
            </li>
            <li class="profile-dropdown-list-itms">
              <a href="#">
                <i class="fa-regular fa-circle-question"></i>
                Help & Support
              </a>
            </li>
            <li class="profile-dropdown-list-itms">
              <a href="#">
                <i class="fa-regular fa-trash-can"></i>
                Delete Account
              </a>
            </li>
            <hr />
            <li class="profile-dropdown-list-itms">
              <a href="logout">
                <i class="fa-solid fa-arrow-right-from-bracket"></i>
                Logout
              </a>
            </li>
          </ul>
        </div>
      </div>
    </nav>
    <h2 id="msg">${msg }</h2>
    <%-- <article class="articl">
      <h2 style="font-size: 1vw;">Employees :</h2>
     	<select id="userfilter" >
      	<option selected="selected" disabled="disabled">Sort</option>
      	<option value="http://localhost:8080/ams_mvc/allemployee">All</option>
      	<option value="http://localhost:8080/ams_mvc/activeemployee">Active</option>
      	<option value="http://localhost:8080/ams_mvc/inactivemployee">Inactive</option>
 	   </select>
      
      
      <br />
      <table id="table">
        <tr style="background-color: rgb(188, 252, 255)">
          <!-- <th>Id</th> -->
          <th>EMPId</th>
          <th>Name</th>
          <th>Email</th>
          <th>Phone</th>
          <th>Role</th>
          <th>Status</th>
          <th>Update</th>
          <th>Delete</th>
          <th>Details</th>
        </tr>
			<c:forEach var="us" items="${users }">
				<tr class="tr">
					<td>${us.getUserId() }</td>
					<td>${us.getEmpId() }</td>
					<td>${us.getName() }</td>
					<td>${us.getEmail() }</td>
					<td>${us.getPhone() }</td>
					<td>${us.getUserRole() }</td>
					<td>${us.getUserStatus() }</td>
					<td> <a href="updateuser?id=${us.getUserId() }"> <button class="updateButton" type="button">Update</button> </a> </td>
					<td> <a href="deleteuser?id=${us.getUserId() }"> <button class="deleteButton" type="button">Delete</button> </a> </td>
					<td> <a href="userdetails?id=${us.getUserId() }"> <button class="updateButton" type="button">View</button> </a> </td>
				</tr>
			</c:forEach>
      </table>
      <br />
    </article>
    <br />
    <br />
    <br />
    <br />
    <br /> --%>
    <br>
  <h2 style="font-size: 1.5vw; float: left; margin-left: 10vw; margin-bottom: -30vw; ">Employees :</h2>
	<select  id="userfilter" style="float: right; margin:0vw 10vw; margin-bottom: -20vw; outline: none;background-color: rgb(0,0,0,0.1);color: rgb(0,0,2);font-weight: bold;font-size:1vw;padding: 0.5vw;border-radius: 0.5vw;'" >
      	<option selected="selected" disabled="disabled">Sort</option>
      	<option value="http://localhost:8080/ams_mvc/allemployee">All</option>
      	<option value="http://localhost:8080/ams_mvc/activeemployee">Active</option>
      	<option value="http://localhost:8080/ams_mvc/inactivemployee">Inactive</option>
 	 </select>
<div class="arti">
	<c:forEach var="us" items="${users }">
        <div class="card">
            <div style="border-bottom: 1px solid black; overflow: auto; display: flex; justify-content: space-between; align-items: center; ">
                <a href="#"><img class="card-img" src="data:image/jpeg;base64,${us.getImg()}" alt="Profile"></a>
                <a href="#"><p style="cursor: pointer; text-transform: uppercase; margin-right: 1vw; font-size: 1.4vw; font-weight: bold ;  color: rgb(248, 249, 248); background-color: rgb(58, 193, 0); border-radius: 0.5vw; padding: 0.1vw 0.8vw; box-shadow: 0vw 0vw 0.5vw green; border: 1px solid white; ">
                    ${us.getName()}
                </p></a>
                
            </div>
            <table cellpadding="10" cellspacing="10">
                <tr>
                    <td>EMPID : </td><td><p style="font-size: 1.2vw; font-weight: bold; line-height: 0.1vw;">${us.getEmpId() }</p></td>
                </tr>
                <tr>
                    <td>Email : </td><td>${us.getEmail() }</td>
                </tr>
                <tr>
                    <td>Phone : </td><td>${us.getPhone() }</td>
                </tr>
                <tr>
                    <td>Status : </td><td>${us.getUserStatus() }</td>
                </tr>
                <tr>
                    <td>Role : </td><td>${us.getUserRole() }</td>
                </tr>
                <tr>
                    <td>Category : </td><td>${us.getUserCategory() }</td>
                </tr>
            </table>
            <p class="status">${us.getUserStatus() }</p>
            <br>
            <div style="display: flex; justify-content: space-evenly;">
                <a href="#"><button class="card-buttons" type="button">Batchs</button></a>
                <a href="#"><button class="card-buttons" type="button">TimeSheets</button></a>
                <a href="userdetails?id=${us.getUserId() }"><button class="card-buttons" type="button">View Details</button></a>
            </div>
          </div>
          </c:forEach>
    </div>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>














    <script>
      let profileDropdownList = document.querySelector(
        ".profile-dropdown-list"
      );
      let btn = document.querySelector(".profile-dropdown-btn");
      const abc = () => profileDropdownList.classList.toggle("active");
      window.addEventListener("click", function (e) {
        if (!btn.contains(e.target))
          profileDropdownList.classList.remove("active");
      });

      function searchTable() {
        let input = document.getElementById("searchinput").value.toUpperCase();
        let table = document.getElementById("table");
        let tbody = document.getElementsByTagName("tbody")[0];
        let rows = tbody.getElementsByTagName("tr");

        for (let i = 1; i < rows.length; i++) {
          var cells = rows[i].getElementsByTagName("td");
          var rowText = "";

          for (let j = 0; j < cells.length; j++) {
            rowText += cells[j].textContent || cells[j].innerText;
          }

          if (rowText.toUpperCase().indexOf(input) > -1) {
            rows[i].style.display = "";
          } else {
            rows[i].style.display = "none";
          }
        }
      }
      
      
      document.getElementById("userfilter").addEventListener("change", function() {
    	    var selectedOption = this.options[this.selectedIndex].value;
    	    if (selectedOption) {
    	        window.location.href = selectedOption;
    	    }
    	});
      let msgEle = document.getElementById("msg");
      msgEle.style.display = "block";
      setTimeout(()=>{msg.style.display = "none"},1500);
    </script>
  </body>
</html>






