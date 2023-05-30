<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" href="/Css/header.css">
<style>

</style>
</head>
<body>
<header>
  <div class="logo">
    <img src="../Images/Logo.png" alt="">
  </div>
  <div class="topnav" id="myTopnav">
    <a href="/adminDashboard">Home</a>
    <a href="Contact.jsp">Contact Us</a>
    <a href="About.jsp">About</a>
  </div>
  <div class="account-options">
    <a href="#" onclick="toggleAccountOptions()">
      <img src="/Images/account-icon.png" alt="Account Icon" width="40" height="30">
    </a>
    <ul id="accountOptions">
      <li><a href="profile.html">My Profile</a></li>
      <li><a href="settings.html">Settings</a></li>
      <li><a href="/login" onclick="logout()">Logout</a></li> <!-- Updated logout link -->
    </ul>
  </div>
</header>
<script>
  function toggleAccountOptions() {
			var accountOptions = document.getElementById("accountOptions");
			if (accountOptions.style.display === "none") {
				accountOptions.style.display = "block";
			} else {
				accountOptions.style.display = "none";
			}
		}
</script>
</body>
</html>