<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" isELIgnored="false"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <title>Batch Home Page</title>
    <link
      rel="stylesheet"
      href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css"
      integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA=="
      crossorigin="anonymous"
      referrerpolicy="no-referrer"
    />

    <style>
	    a{
	    	text-decoration: none;
	    }
      .logo {
        font-size: 2vw;
        font-family: cursive;
        color: rgb(142, 250, 0);
        color:darkgreen;
        color:white;
        text-shadow: 0px 0px 40px;
        margin-right:5vw;
        cursor: pointer;
      }
      .logo:hover {
        text-decoration: underline;
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
		background-color:rgb(0,0,0,0.2);
		background-color:rgb(44,157,48);
        padding: 0 8%;
      }

      .navbar-list {
        width: 100%;
        text-align: right;
        padding-right: 2rem;
        margin: 0px 100px 0px 0px ;
        display: flex;
        justify-content: space-around;
        
      }

      .navbar-list li a button {
        cursor: pointer;
        border:none;
        background-color: rgb(44,157,48);
        color:white;
        font-family: 'Trebuchet MS', 'Lucida Sans Unicode', 'Lucida Grande', 'Lucida Sans', Arial, sans-serif;
        font-size: 1vw;
         
      }

      .navbar-list li a button:hover {
        text-decoration: underline;
      }

      .profile-dropdown {
        position: relative;
        width: fit-content;
      }

      .profile-img {
        position: relative;
        width: 3vw;
        height: 3vw; 
        border-radius: 50%;
        background-position: center;
      }

      .profile-dropdown-btn {
        display: flex;
        align-items: center;
        justify-content: space-between;
        padding-right: 1vw;
        font-size: 1vw;
        font-weight:bold;
        border: 0.2vw solid white;
        border-radius: 1.8vw;
        cursor: pointer;
        width: auto;
        color:white;
        color:green;
        transition: box-shadow 0.2s background-color 0.2s;
		background-color: rgb(243, 255, 243);
      }

      .profile-dropdown-btn:hover {
      	transition:200ms;
        color: white;
        box-shadow: 0.25vw 0.25vw 0.5vw white;
        box-shadow: 0vw 0vw 0.5vw white;
        background-color: rgb(44,157,48);
      }
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
        padding: 0.5vw 1vw;
        padding-left: 1vw;
        border-radius: 1vw;
        margin-right: 1vw;
        font-size: 0.8vw;
      }
      #searchinput:hover {
        background-color: rgb(243, 255, 243);
        color: darkgreen;
        text-shadow: 0px 0px 10px white;
        box-shadow: 0px 10px 10px var(--secondary);
        border: 1px solid white;
        transition: 200ms;
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
		border-radius: 0.5vw;
	}

	#userfilter>option{
		color: rgb(0,0,2);
		font-weight: bold;
		font-size:1vw;
		padding: 0.5vw;
	}
	#msg{
		display: block;
		position: fixed;
      	top: 10%;
      	left:30%;
      	width: 40%;
      	height: 4%;
      	background-color: rgba(0,0,0, 0.8); 
      	z-index: 9999; 
      	text-align: center;
      	padding: 0.2vw 1vw;
      	font-size: 1vw;
      	color: white;
      	border-radius: 1vw;
	}
	
      .arti {
        width: 100%;
        height: auto;
        padding-top:1vw;
        padding-bottom:1vw;
        border-radius:0vw;
        background-color:rgb(0,255,0,0.2);
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
        justify-content: space-evenly;
        align-items:center;
        grid-gap: 2.5vw 0vw;

      }
      .card {
        font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        color: rgb(84, 111, 84);
        padding: 0.8vw 0.9vw;
        height: auto;
        width: 100%;
        background: rgba(255, 255, 255, 0.9);
        border-radius: 1vw;
        font-size: 1vw;
        border: 0.1vw solid silver;
      }

      .card:hover{
        box-shadow: 0vw 0vw 1vw black;
        transition: 300ms ;
        transform: scale(1.03);
        background: rgb(255, 255, 255, 0.95);
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
        float: right; 
        margin-top: -22vw; 
        background-color: rgb(44,157,48,0.5); 
        color: white; 
        width: auto; 
        height: auto; 
        border-radius: 0.5vw; 
        padding: 0.2vw 0.3vw;
        font-weight: bold;
        font-size: 1vw;
        cursor: pointer;
        text-shadow: -0.1vw -0.1vw 0.3vw green;
        font-family: Verdana, Geneva, Tahoma, sans-serif;
      }
      .status:hover{
        background-color: green;
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
    </style>
  </head>
  <body>
    <nav class="navbar">
      <a href="hrhome"><h1 class="logo">AlphaAttendance.com</h1></a>
      <ul class="navbar-list">
      <li>
          <a href="createbatch"><button type="button">Create Batch</button></a>
        </li>
        <li>
          <a href="allbatchs"><button type="button">All Batchs</button></a>
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
              <a href="#">
                <i class="fa-solid fa-chart-line"></i>
                TimeSheets
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
    <div style="  overflow: auto; display: flex; align-items: center; justify-content: space-between;">
	 	<h2 style="font-size: 1.3vw; float: left; margin-left: 10vw; margin-bottom: 0vw; font-family: 'Franklin Gothic Medium', 'Arial Narrow', Arial, sans-serif; ">Batchs :</h2>
		<select  id="userfilter" style="float: right; margin:0vw 2vw;  outline: none;background-color: rgb(0,0,0,0.1);color: rgb(0,0,2);font-weight: bold;font-size:0.8vw;padding: 0.4vw;border-radius: 0.5vw;" >
	      	<option selected="selected" disabled="disabled">Sort Batchs</option>
	      	<option value="http://localhost:8080/ams_mvc/allbatchs">ALL_BATCHS</option>
	      	<option value="http://localhost:8080/ams_mvc/allnonassignedbatchs">NOT_YET_ASSIGNED</option>
	      	<option value="http://localhost:8080/ams_mvc/allongoingbatchs">ON_GOING</option>
	      	<option value="http://localhost:8080/ams_mvc/allcompletedbatchs">COMPLETED</option>
	 	 </select> 
 	 </div>
<div class="arti">
	<c:forEach var="batch" items="${batchs }">
        <div class="card">
            <div style="border-bottom: 0.15vw solid grey; padding-bottom:0.5vw ; overflow: auto; display: flex; justify-content: space-between; align-items: center; ">
				<a href="#">
					<p style="cursor: pointer; text-transform: uppercase; margin-right: 1vw; font-size: 1.4vw; font-weight: bold ;  color: rgb(44,157,48); padding: 0.5vw 1vw; text-shadow: 0vw 0vw 0vw green;">${batch.getSubjectName()}</p>
                </a>
                <p style="font-weight: bold; color: goldenrod; font-size: 1.3vw; ">Date : ${batch.getBatchStartDate() }</p>
            </div>
            <table cellpadding="15" cellspacing="15">
                <tr>
                    <td>Bathc Code : </td><td><p style="font-size: 1.2vw; font-weight: bold; line-height: 0.1vw;">${batch.getBatchCode() }</p></td>
                </tr>
                <tr>
                    <td>Start Date : </td><td>${batch.getBatchStartDate() }</td>
                </tr>
                <tr>
                    <td>End Date : </td><td>${batch.getBatchEndDate() }</td>
                </tr>
                <tr>
                    <td>Batch Status : </td><td>${batch.getBatchStatus() }</td>
                </tr>
                <tr>
                    <td>Start Time : </td><td>${batch.getLoginTime() }</td>
                </tr>
                <tr>
                    <td>Batch Mode : </td><td>${batch.getBatchMode() }</td>
                </tr>
                <tr>
                    <td>Institute Name : </td><td>${batch.getInstituteName() }</td>
                </tr>
                <tr>
                    <td>Institute Location : </td><td>${batch.getLocation() }</td>
                </tr>
            </table>
            
            
            	
            	<div style=" border-top:0.1vw solid silver; width: 100%; height: 6vw; font-family:'Franklin Gothic Medium', 'Arial Narrow', Arial, sans-serif; ">
            		<c:choose>
            		<c:when test="${batch.user!=null}">
            		<table cellpadding="15" cellspacing="15">
            			<tr>
            				<td>Trainer Name : </td><th>${batch.user.getName() }</th>
            			</tr>
            			<tr>
            				<td>Phone Number : </td><th>${batch.user.getPhone() }</th>
            			</tr>
            		</table>
            		</c:when>
            		<c:otherwise>
            			<h1 style="color:rgb(0,100,0,0.1); margin=auto; padding-left: 1vw;">Trainer Details </h1><br>
            			<h2 style="color:rgb(0,100,0,0.1);  margin=auto; padding-left: 1vw;">NOT_ASSIGNED_YET</h2>
            		</c:otherwise>
            		</c:choose>
            	</div>
            	
            
            
            
            
            <p class="status">${batch.getBatchStatus() }</p>
            <br>
            <div style="display: flex; justify-content: space-evenly;">
                <a href="updatebatch?id=${batch.getBatchId() }"><button class="card-buttons" type="button">Update</button></a>
                
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
      setTimeout(()=>{msg.style.display = "none"},3000);
    </script>
  </body>
</html>


