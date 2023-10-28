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
      .logo {
        font-size: 3rem;
        font-family: cursive;
        color: var(--green);
        text-shadow: 0px 0px 30px;
      }
      .logo:hover {
        color: rgb(142, 250, 74);
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
        height: 100vh;
        width: 100%;
        background-color: var(--primary);
        /* background: url(../images/tripdairybg.jpg); */
        background-size: cover;
        background-position: center;
        background-repeat: no-repeat;
      }

      .navbar {
        display: flex;
        align-items: center;
        height: 70px;
        background-color: var(--white);
        padding: 0 8%;
      }

      .logo {
        cursor: pointer;
      }

      .navbar-list {
        width: 100%;
        text-align: right;
        padding-right: 2rem;
        margin: 0px 100px 0px 0px ;
      }

      .navbar-list li {
        display: inline-block;
        margin: 0 0.8rem;
      }

      .navbar-list li a {
        text-decoration: none;
      }
      .navbar-list li a button {
        background-color: white;
        cursor: pointer;
        color: var(--green);
        padding: 0.3rem 1rem;
        border-radius: 5px;
        border: 1px solid var(--green);
        /* background-color: var(--primary); */
        box-shadow: 0px 7px 10px var(--secondary-light);
        font-weight: bold;
        transition: 0.5s;
      }

      .navbar-list li a button:hover {
        background-color: rgb(185, 255, 185);
        color: green;
        text-shadow: 0px 0px 10px white;
        box-shadow: 0px 10px 10px var(--secondary);
        border: 1px solid white;
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
      }

      .profile-dropdown-btn {
        display: flex;
        align-items: center;
        justify-content: space-between;
        padding-right: 1rem;
        font-size: 0.9rem;
        border: 1px solid var(--secondary);
        border-radius: 50px;
        cursor: pointer;
        width: auto;
        transition: box-shadow 0.2s background-color 0.2s;
      }

      .profile-dropdown-btn:hover {
        background-color: var(--secondary-light-2);
        box-shadow: var(--shadow);
      }

      .profile-img {
        background-color: var(--secondary-light);
      }

      .profile-img i {
        position: relative;
        margin: 10px;
        font-size: 1.6rem;
        color: green;
      }

      .profile-dropdown-btn span {
        margin: 0 0.5rem;
        margin-right: 0;
      }

      .profile-dropdown-list {
        position: absolute;
        top: 61px;
        width: 220px;
        right: 0;
        background-color: var(--white);
        border-radius: 10px;
        box-shadow: var(--shadow);
        max-height: 0;
        overflow: hidden;
        transition: max-height 0.5s;
      }

      .profile-dropdown-list.active {
        max-height: 370px;
      }

      .profile-dropdown-list hr {
        border: 0.5px solid var(--green);
      }

      .profile-dropdown-list-itms {
        padding: 0.5rem 0 0.5rem 1rem;
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
      }

      .profile-dropdown-list-itms a i {
        margin-right: 1rem;
        font-size: 1.1rem;
        width: 2.3rem;
        height: 2.3rem;
        background-color: var(--secondary);
        color: var(--white);
        line-height: 2.3rem;
        text-align: center;
        border-radius: 50%;
      }

      #searchinput {
        width: 400px;
        background-color: rgb(255, 255, 255);
        outline: none;
        border: 1px solid var(--green);
        padding: 5px;
        padding-left: 10px;
        border-radius: 7px;
        margin-right: 2vw;
        font-size: 17px;
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
        margin-top: 40px;
        width: 80%;
        height: 75vh;
        box-shadow: 0px 0px 10px black;
        padding: 20px;
        border-radius: 10px;
        /* background-color: rgb(59, 59, 59); */
        /* background: linear-gradient(to right, #8bf0ff, #c4e0e5); */
        background: linear-gradient(to right, #cbbcff, #faaca8);
      }
      .articl {
        margin: auto;
        margin-top: 40px;
        width: 95%;
        height: auto;
        box-shadow: 0px 0px 10px black;
        padding: 20px;
        border-radius: 10px;
        background-color: aliceblue;
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
      table {
        border: 1px solid white;
        box-shadow: 0px 0px 5px black;
        border-radius: 8px;
        margin: auto;
      }
      tr {
        background-color: antiquewhite;
      }
      tr:hover {
        background-color: rgb(255, 255, 255);
      }
      td,
      th {
        padding: 0.5vw 0.8vw;
        font-weight: bold;
      }
      td > a > button {
        border: none;
        padding: 0.3vw 0.3vw;
        border-radius: 5px;
        color: white;
        border: 1px solid white;
      }
      td > a > button:hover {
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






    </style>
  </head>
  <body>
    <nav class="navbar">
      <h1 class="logo">Alpha.@ndance</h1>
      <ul class="navbar-list">
        <li>
          <a href="#"><button type="button">Employees</button></a>
        </li>
        <li>
          <a href="#"><button type="button">Batchs</button></a>
        </li>
        <!-- <li>
            <a href="#"><button type="button">Active Employees</button></a>
          </li> -->
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
            <i id="profileimage" class="fa-regular fa-user"></i>
          </div>
          <span>${user.getName()}</span>
        </div>

        <div class="profile-dropdown-list">
          <ul>
            <li class="profile-dropdown-list-itms">
              <a href="#">
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
                Analytics
              </a>
            </li>
            <li class="profile-dropdown-list-itms">
              <a href="#">
                <i class="fa-solid fa-sliders"></i>
                Settings
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



    <br />
    <br />
    <h2>${msg }</h2>
    <hr />

    <article class="articl">
      <h2>All Active Employees :</h2>
      <br />
      <table border="1" cellpadding="15" id="table">
        <tr style="background-color: rgb(188, 252, 255)">
          <th>Id</th>
          <th>EMPId</th>
          <th>Name</th>
          <th>Email</th>
          <th>Phone</th>
          <th>Role</th>
          <th>Update</th>
          <th>Delete</th>
          <th>Details</th>
        </tr>
			<c:forEach var="us" items="${users }">
				<tr>
					<td>${us.getUserId() }</td>
					<td>${us.getEmpId() }</td>
					<td>${us.getName() }</td>
					<td>${us.getEmail() }</td>
					<td>${us.getPhone() }</td>
					<td>${us.getUserRole() }</td>
					<td> <a href="updateuser?id=${us.getUserId() }"> <button class="updateButton" type="button">Update</button> </a> </td>
					<td> <a href="deleteuser?id=${us.getUserId() }"> <button class="deleteButton" type="button">Delete</button> </a> </td>
					<td> <a href="userdetails?id=${us.getUserId() }"> <button class="updateButton" type="button">Details</button> </a> </td>
				</tr>
			</c:forEach>
      </table>
      <br />
    </article>
    <br /><br />
    <hr />
    <br />
    <br />
    <br />



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
    </script>
  </body>
</html>






