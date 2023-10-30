<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>User Details Page</title>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css"
	integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA=="
	crossorigin="anonymous" referrerpolicy="no-referrer" />
<style>
a {
	text-decoration: none;
}

.logo {
	font-size: 2vw;
	font-family: cursive;
	color: rgb(142, 250, 0);
	text-shadow: 0px 0px 40px;
	margin-right: 5vw;
	cursor: pointer;
}

.logo:hover {
	color: rgb(142, 250, 70);
}

/*Google font Poppins*/
@import
	url("https://fonts.googleapis.com/css2?family=Poppins:wght@100;200;300;400;500&display=swap")
	;

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
	background-image:
		url(https://www.testyantra.com/sites/default/files/tylog1.png);
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
	background: linear-gradient(15deg, #13547a 0%, #80d0c7 100%);
	/*         background:linear-gradient(to right,rgb(120,40,208,0.8),rgb(59,130,252,0.9)); */
	padding: 0 8%;
}

.navbar-list {
	width: 100%;
	text-align: right;
	padding-right: 2rem;
	margin: 0px 100px 0px 0px;
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
	background-color: rgb(108, 185, 184);
	font-size: 1vw;
	color: white;
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
}

.profile-dropdown-btn {
	display: flex;
	align-items: center;
	justify-content: space-between;
	padding-right: 1vw;
	font-size: 1vw;
	font-weight: bold;
	border: 0.1vw solid white;
	border-radius: 1.8vw;
	cursor: pointer;
	width: auto;
	transition: box-shadow 0.2s background-color 0.2s;
}

.profile-dropdown-btn:hover {
	transition: 200ms;
	color: white;
	box-shadow: 0.5vw 0.5vw 1vw black;
}

.profile-img {
	background-position: center;
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
	/* padding: 0.5rem 0 0.5rem 1rem; */
	padding: 0.5vw 0vw 0.5vw 1vw;
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

	

	.profile-pic{
		position: relative;
        width: 18vw;
        height: 18vw;
        border-radius: 50%;
		background-position: center;
        
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
	
	
	.main{
		width: 70%;
		height: 30vw;
		background-color: rgb(255,255,255,0.95);
		margin: auto;
		margin-top: 3vw;
		border-radius: 1vw;
		box-shadow: 0vw 0vw 1vw black;
		padding: 2vw 2vw;
		
		
	}
	
	
	.but{
		background-color: lightgreen;
		border-radius: 0.3vw;
		padding: 0.5vw 1vw ;
		border: none;
		cursor: pointer;
	}
	
	
	
	
	
	
	
	
	
	
</style>
</head>
<body>

	<nav class="navbar">
		<a href="activeemployee"><h1 class="logo">AlphaAttendance.com</h1></a>
		<ul class="navbar-list">
			<li><a href="assignbatch?id=${user1.getUserId() }"><button type="button">Assign Batch</button></a></li>
			<li><a href="updateuser?id=${user1.getUserId() }"><button type="button">Update ${user1.getName() }</button></a></li>
		</ul>

		<input type="text" name="search" id="searchinput"
			placeholder="Type to Search" onkeyup="searchTable()" />

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
					<li class="profile-dropdown-list-itms"><a
						href="https://accounts.google.com/v3/signin/identifier?continue=https%3A%2F%2Faccounts.google.com%2F&followup=https%3A%2F%2Faccounts.google.com%2F&ifkv=AVQVeywd4Qbj_RxuqUuYquPkL95hExwttmIKqsLHcJ5A6fjfTyR4Ee-k4GZOVokY81BdTbhS_ra3&passive=1209600&flowName=GlifWebSignIn&flowEntry=ServiceLogin&dsh=S1325560807%3A1698522311172395&theme=glif">
							<i class="fa-regular fa-envelope"></i> Notifications
					</a></li>
					<li class="profile-dropdown-list-itms"><a
						href="updateuser?id=${user.getUserId() }"> <i
							class="fa-regular fa-user"></i> Update Profile
					</a></li>

					<li class="profile-dropdown-list-itms"><a href="#"> <i
							class="fa-solid fa-chart-line"></i> Analytics
					</a></li>
					<li class="profile-dropdown-list-itms"><a
						href="updateprofilepic?id=${user.getUserId() }"> <i class="fa-solid fa-sliders"></i>
							Update Profile Picture
					</a></li>
					<li class="profile-dropdown-list-itms"><a href="#"> <i
							class="fa-regular fa-circle-question"></i> Help & Support
					</a></li>
					<li class="profile-dropdown-list-itms"><a href="#"> <i
							class="fa-regular fa-trash-can"></i> Delete Account
					</a></li>
					<hr />
					<li class="profile-dropdown-list-itms"><a href="logout"> <i
							class="fa-solid fa-arrow-right-from-bracket"></i> Logout
					</a></li>
				</ul>
			</div>
		</div>
	</nav>
	<h2 id="msg">${msg }</h2>

	<div class="main">
		<a href="userdetails?id=${user1.getUserId() }"> <h1 style="   color:white; background-color: rgb(34,102,132); text-align: center; text-transform: uppercase; width: 50%; margin: auto; padding: 0.5vw 0vw; border-radius: 1vw; box-shadow: 0.5vw 0.5vw 10vw ;">${user1.getName() }</h1> </a>
		<div style=" overflow: auto;display: flex; justify-content: space-around; margin-top: 1vw; ">
			
			<img class="profile-pic" alt="" src="data:image/jpeg;base64,${user1.getImg()}">
			
			<div style=" padding-right: 2vw; width: 40%; background-color: rgb(122,201,1); color: white; border-radius: 2vw; ">
				<table cellpadding="20" cellspacing="20">
	                <tr>
	                    <td>EMPID : </td><td><p style="font-size: 1.2vw; font-weight: bold; line-height: 0.1vw; color:rgb(34,102,132); ">${user1.getEmpId() }</p></td>
	                </tr>
	                <tr>
	                    <td>Email : </td><td>${user1.getEmail() }</td>
	                </tr>
	                <tr>
	                    <td>Phone : </td><td>${user1.getPhone() }</td>
	                </tr>
	                <tr>
	                    <td>Status : </td><td>${user1.getUserStatus() }</td>
	                </tr>
	                <tr>
	                    <td>Role : </td><td>${user1.getUserRole() }</td>
	                </tr>
	                <tr>
	                    <td>Category : </td><td>${user1.getUserCategory() }</td>
	                </tr>
	            </table>
	            <p class="status">${user1.getUserStatus() }</p>
			</div>
		</div>
		<div style="display: flex; justify-content: space-around; align-items: center; margin: 1vw 1vw;">
			<a href="updateprofilepic?id=${user1.getUserId() }"> <button class="but" type="submit">Upload Prifile Image</button> </a>
		<a href="#"> <button class="but" type="submit">View TimeSheets</button> </a>
		<a href="#"> <button class="but" type="submit">View Batchs</button> </a>
		<a href="activeemployee"> <button class="but" type="submit">Back</button> </a>
		</div>
	
	
	</div>




	




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
      setTimeout(()=>{msgEle.style.display = "none"},1500);
    </script>











</body>
</html>