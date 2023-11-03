<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>Employee Home Page</title>
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
	color: darkgreen;
	color: white;
	text-shadow: 0px 0px 40px;
	margin-right: 5vw;
	cursor: pointer;
}

.logo:hover {
	text-decoration: underline;
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
}

.navbar {
	display: flex;
	align-items: center;
	height: 70px;
	background-color: black;
	background-color: rgb(0, 0, 0, 0.2);
	background-color: rgb(44, 157, 48);
	padding: 0 8%;
}

.navbar-list {
	width: 100%;
	text-align: right;
	padding-right: 2rem;
	margin: 0px 100px 0px 0px;
	display: flex;
	justify-content: space-around;
}

.navbar-list li a button {
	cursor: pointer;
	border: none;
	background-color: rgb(44, 157, 48);
	color: white;
	font-family: 'Trebuchet MS', 'Lucida Sans Unicode', 'Lucida Grande',
		'Lucida Sans', Arial, sans-serif;
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
	font-weight: bold;
	border: 0.2vw solid white;
	border-radius: 1.8vw;
	cursor: pointer;
	width: auto;
	color: white;
	color: green;
	transition: box-shadow 0.2s background-color 0.2s;
	background-color: rgb(243, 255, 243);
}

.profile-dropdown-btn:hover {
	transition: 200ms;
	color: white;
	box-shadow: 0.25vw 0.25vw 0.5vw white;
	box-shadow: 0vw 0vw 0.5vw white;
	background-color: rgb(44, 157, 48);
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

#userfilter {
	float: right;
	margin-top: -2vw;
	outline: none;
	background-color: rgb(0, 0, 0, 0.1);
	color: rgb(0, 0, 2);
	font-weight: bold;
	font-size: 1vw;
	padding: 0.5vw;
	border-radius: 0.5vw;
	'
}

#userfilter>option {
	color: rgb(0, 0, 2);
	font-weight: bold;
	font-size: 1vw;
	padding: 0.5vw;
}

#msg {
	display: none;
	position: fixed;
	top: 10%;
	left: 30%;
	width: 40%;
	height: 4%;
	background-color: rgba(0, 0, 0, 0.8);
	z-index: 9999;
	text-align: center;
	padding: 0.2vw 1vw;
	font-size: 1vw;
	color: white;
	border-radius: 1vw;
}
</style>
</head>
<body>
	<nav class="navbar">
		<a href="trainerhome"><h1 class="logo">AlphaAttendance.com</h1></a>
		<ul class="navbar-list">
			<li><a href="createattendance?id=${user.getUserId()	 }"><button type="button">Mark
						Attendance</button></a></li>
			<li><a href="create"><button type="button">create
						Time Sheet</button></a></li>
		</ul>
		<input type="text" name="search" id="searchinput"
			placeholder="Type to Search" onkeyup="searchTable()" />
		<div class="profile-dropdown">
			<div class="profile-dropdown-btn" onclick="abc()">
				<div class="profile-img">
					<img class="profile-img" alt=""
						src="data:image/jpeg;base64,${user.getImg()}">
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
						href="current-user?userId=${user.getUserId()}"> <i
							class="fa-solid fa-chart-line"></i> TimeSheets
					</a></li>
					<li class="profile-dropdown-list-itms"><a
						href="updateprofilepic?id=${user.getUserId() }"> <i
							class="fa-solid fa-sliders"></i> Update Profile Picture
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
      
    </script>


	<script>
    let msgEle = document.getElementById("msg");
    msgEle.style.display = "block";
    setTimeout(()=>{msg.style.display = "none"},3000);	
    </script>


</body>
</html>