<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>HR Home Page</title>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css"
	integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA=="
	crossorigin="anonymous" referrerpolicy="no-referrer" />
</head>
<body>
	<nav class="navbar">
		<a href="activeemployee"><h1 class="logo">AlphaAttendance.com</h1></a>
		<ul class="navbar-list">
			<li><a href="user"><button type="button">Create
						Employee</button></a></li>
			<li><a href="createbatch"><button type="button">Create
						Batch</button></a></li>
			<li><a href="views/timesheet.jsp"><button type="button">Time
						Sheet</button></a></li>
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
						href="updateuser?id=${user.getUserId() }"> <i
							class="fa-regular fa-user"></i> Update Profile
					</a></li>

					<li class="profile-dropdown-list-itms"><a href="#"> <i
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
	<br>
	<h2
		style="font-size: 1.5vw; float: left; margin-left: 10vw; margin-bottom: -30vw;">Employees
		:</h2>
	<select id="userfilter"
		style="float: right; margin: 0vw 10vw; margin-bottom: -20vw; outline: none; background-color: rgb(0, 0, 0, 0.1); color: rgb(0, 0, 2); font-weight: bold; font-size: 1vw; padding: 0.5vw; border-radius: 0.5vw;'">
		<option selected="selected" disabled="disabled">Sort</option>
		<option value="http://localhost:8080/ams_mvc/allemployee">All</option>
		<option value="http://localhost:8080/ams_mvc/activeemployee">Active</option>
		<option value="http://localhost:8080/ams_mvc/inactivemployee">Inactive</option>
	</select>
	<div class="arti">
		<c:forEach var="us" items="${users }">
			<div class="card">
				<div
					style="border-bottom: 1px solid black; overflow: auto; display: flex; justify-content: space-between; align-items: center;">
					<a href="#"><img class="card-img"
						src="data:image/jpeg;base64,${us.getImg()}" alt="Profile"></a> <a
						href="#"><p
							style="cursor: pointer; text-transform: uppercase; margin-right: 1vw; font-size: 1.4vw; font-weight: bold; color: rgb(248, 249, 248); background-color: rgb(58, 193, 0); border-radius: 0.5vw; padding: 0.1vw 0.8vw; box-shadow: 0vw 0vw 0.5vw green; border: 1px solid white;">
							${us.getName()}</p></a>

				</div>
				<table cellpadding="10" cellspacing="10">
					<tr>
						<td>EMPID :</td>
						<td><p
								style="font-size: 1.2vw; font-weight: bold; line-height: 0.1vw;">${us.getEmpId() }</p></td>
					</tr>
					<tr>
						<td>Email :</td>
						<td>${us.getEmail() }</td>
					</tr>
					<tr>
						<td>Phone :</td>
						<td>${us.getPhone() }</td>
					</tr>
					<tr>
						<td>Status :</td>
						<td>${us.getUserStatus() }</td>
					</tr>
					<tr>
						<td>Role :</td>
						<td>${us.getUserRole() }</td>
					</tr>
					<tr>
						<td>Category :</td>
						<td>${us.getUserCategory() }</td>
					</tr>
				</table>
				<p class="status">${us.getUserStatus() }</p>
				<br>
				<div style="display: flex; justify-content: space-evenly;">
					<a href="#"><button class="card-buttons" type="button">Batchs</button></a>
					<a href="/ams_mvc/timesheet/current-user?id=${us.getUserId() }"><button
							class="card-buttons" type="button">TimeSheets</button></a> <a
						href="userdetails?id=${us.getUserId() }"><button
							class="card-buttons" type="button">View Details</button></a>
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
</head>
<body>
	<nav class="navbar">
		<a href="hrhome"><h1 class="logo">AlphaAttendance.com</h1></a>
		<ul class="navbar-list">
			<li><a href="allemployees"><button type="button">Employees</button></a>
			</li>
			<li><a href="allnonassignedbatchs"><button type="button">Batchs</button></a>
			</li>
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
					<li class="profile-dropdown-list-itms"><a href="#"> <i
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
