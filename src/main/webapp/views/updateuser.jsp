<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Update User Page</title>
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

 	
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
        /* body {
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
        } */
    </style>

</head>
<body>

    <nav class="navbar">
      <a href="activeemployee"><h1 class="logo">AlphaAttendance.com</h1></a>
     <ul class="navbar-list">
      <li>
          <a href="user"><button type="button">.</button></a>
        </li>
        <li>
          <a href="#"><button type="button">.</button></a>
        </li>
        <li>
          <a href="createbatch"><button type="button">.</button></a>
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
           <%--  <li class="profile-dropdown-list-itms">
              <a href="updateuser?id=${user.getUserId() }">
                <i class="fa-regular fa-user"></i>
                Update Profile
              </a>
            </li> --%>

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



	<h1>User Update!!!...</h1>

	<form:form action="updateuserupdate" modelAttribute="user1">
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