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

</head>
<body>
	<nav class="navbar">
		<a href="trainerhome"><h1 class="logo">AlphaAttendance.com</h1></a>
		<ul class="navbar-list">
			<li><a href="createattendance"><button type="button">Mark
						Attendance</button></a></li>
			<li><a href="timesheets"><button type="button">View
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
>>>>>>> 5442e13a7429bf575fda700e804abad2b2b8e1ec
</html>