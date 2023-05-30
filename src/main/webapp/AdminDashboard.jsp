<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Admin Dashboard</title>
<link rel="stylesheet" href="Css/adminxxxDashboard.css">
<style>
  *{
  padding: 0;
  margin: 0;
  box-sizing: border-box;
  font-size: 24px;
  font-family: sans-serif;
}
body {
  background-color: #474745;
  background-size: cover;
}
header{
  width: 100%;
  height: 10vh;
  background-color: #CCD6D8;
  display: flex;
  align-items: center;
  justify-content: space-between;
}
.logo{
  width: 20%;
  height: 50px;
}
.logo img{
  margin: 0px 50px;
  height: 100%;
}
.topnav {
  width: 33%;
  display: flex;
  gap: 20px;
}
.topnav a {
  color: #474745;
  font-weight: 600;
  text-align: center;
  padding: 14px 16px;
  text-decoration: none;
  font-size: 17px;
  font-family: Century Gothic;
}
.topnav a:hover {
  border-radius: 20px;
  background-color: #E3E8EB;
}
/* Add a color to the active/current link */
.topnav a.active {
  background-color: #4CAF50;
  color: white;
}

.account-options {
  width: 10%;
  margin-right: 0px;
  color: #333;
}
.account-options img{
  width: 80px;
  height: 50px;
}
.account-options ul {
  list-style-type: none;
  padding: 0;
  margin: 0;
  display: none; /* Hide the account options initially */
  position: absolute;
  background-color: #BBC6C8;
  min-width: 100px;
  box-shadow: 0px 8px 16px 0px rgba(0, 0, 0, 0.2);
  z-index: 1;
}

.account-options li {
  display: block;
  margin-bottom: 2px;
}

.account-options a {
  color: #474745;
  font-weight: 600;
  font-size: 16px;
  text-decoration: none;
  display: block;
  padding: 5px;
}
#accountOptions{
border-radius: 10%;
}
.search-container{
  width: 100%;
  height: fit-content;
  display: flex;
}

/* Sidebar */
.sidebar {
  margin: 10px 0px;
  border-radius: 20px;
  width: 12%;
  height: 100%;
  background-color: #889293;
  padding: 20px;
}

.sidebar a {
  display: block;
  margin-bottom: 10px;
  text-decoration: none;
  color: #333;
  font-weight: bold;
  font-size: 16px;
}

.sidebar a:hover {
  color: #E3E8EB;
}

.sort-by-options {
  display: none;
}
.sort-by-options a{
  margin-left: 20px;
}

.sort-by-options.active {
  display: block;
}

/* Toggle Symbol */
.toggle-symbol::after {
  content: "\25BE"; /* Down arrow symbol */
  display: inline-block;
  margin-left: 5px;
  transition: transform 0.3s ease-in-out;
}

.toggle-symbol.active::after {
  transform: rotate(180deg);
}

.searching{
  width: 68%;
  height: 100%;
  display: flex;
  flex-direction: column;
  align-items: center;
  justify-content: center;
  padding: 0px 10px;
}
.searching h1{
  margin-top: 50px;
  font-size: xx-large;
  color: #B7C1C3;
  text-decoration: underline;
}
.searching h4{
  margin: 20px 0px;
  font-size: medium;
  color: #E3E8EB;
}
.search-bar{
  padding: 20px;
  display: flex;
  align-items: center;
  justify-content: center;
  gap: 5px;
}
.search-bar input{
  border: none;
  background-color: #CCD6D8;
  font-size: 24px;
  border-radius: 10px;
}
.search-bar input::placeholder{
  font-size: 18px;
  padding-left: 10px;
}
.search-bar form{
display: flex;
align-items: center;
gap: 10px;
}
.search-bar button{
background: none;
border: none;
width: 20px;
height: 20px;
cursor: pointer;
}
.search-bar button img{
border-radius: 50%;
  width: 100%;
  height: 100%;
}

.display-content{
  width: 66%;
  padding: 10px;
width: 100%;
}
.grid-container{
  max-width: 100%;
  display: grid;
  grid-template-columns: auto;
  gap: 0.5rem;
  padding: 10px;
}
.grid-item{
  width: 100%;
  background: #6C6C6A;
  border-radius: 0.2rem;
  padding: 10px 30px;
  box-shadow: 0 0 2px 0 #E3E8EB;
  display: flex;
  position: relative;
}
.display-content ul li{
  list-style: none;
  display: flex;
  flex-direction: column;
  gap: 10px;
}
.display-content ul li a{
  width: fit-content;
  text-decoration: none;
  color: #393937;
  font-size: 18px;
}
.display-content ul li a:hover{
color: #1C1C1C;
  text-decoration: underline;
}
.display-content ul li p{
color: #DADADA;
margin-left: 2px;
font-size: 14px;
}
.grid-item form{
  position: absolute;
  right: 10px;
  top: 2px;
}
.grid-item form input[type="submit"]{
  font-size: 14px;
  font-weight: 600;
  background: none;
  border: none;
  border-radius: 10px;
  cursor: pointer;
  transition: 1s cubic-bezier(0.075, 0.82, 0.165, 1);
}
.grid-item form input[type="submit"]:hover{
  scale: 2;
}
.AddndDelete{
border-radius: 20px;
width: 20%;
margin: 10px 0px;
text-align: center;
}
.delete{
  display: none;
}
.update,.delete{
border-radius: 20px;
width: 100%;
margin: 30px 0px;
text-align: center;
}
.update form,.delete form{
display: flex;
flex-direction: column;
justify-content: center;
align-items: center;
gap: 10px;
padding: 10px 4px;
}
.update form input,.delete form input{
border-radius: 10px;
font-size: 20px;
width: 100%;
background-color: #889293;
}
.update form textarea::placeholder,.delete form input::placeholder{
font-size: 16px;
padding-left: 10px;
}
#file{
cursor: pointer;
border-radius: 20px;
font-size: 14px;
}
textarea{
font-size: 18px;
border-radius: 10px;
width: 100%;
background-color: #CCD6D8;
}
.update button,.delete button{
cursor: pointer;
font-size: 14px;
padding: 5px;
font-weight: 600;
border-radius: 10px;
background-color: #889293;
}
.update span,.delete span{
font-size: 16px;
color: #77DD77;
}

.pagination{
width: 100%;
/* position: absolute; */
/* bottom: 10px; */
display: flex;
align-items: center;
justify-content: center;
}
.pages{
text-align: center;
width: 20%;
display: flex;
flex-direction: row;
align-items: center;
justify-content: center;
gap: 4px;
}
.pages a,.pages button{
cursor: pointer;
border: none;
text-decoration: none;
color: #1C1C1C;
background-color: #CCD6D8;
border-radius: 5px;
width: 25px;
height: 25px;
display: flex;
align-items: center;
justify-content: center;
font-weight: 600;
}
</style>
</head>
<body>
  <jsp:include page="Header.jsp" />
	<div class="search-container">
		<div class="sidebar">
			<a href="/documents/0">Documents</a> <a href="/PDFs/0">PDF</a>
			<a href="/images/0">Images</a>
			<a href="#"	onclick="toggleSortByOptions()" class="toggle-symbol">Sort By</a>
			<div class="sort-by-options" id="sortByOptions">
				<a href="#">Decades</a>
				<a href="#">Years</a>
			</div>
		</div>
		<div class="searching">
			<h1>Welcome to History of Black People</h1>
			<h4>A place where you can find vast variety of Info Regarding
				Blacks</h4>
			<div class="search-bar">
				<form action="/searched/0" method="post">
					<input type="text" name="searchedWord" placeholder="Search..." id="search" />
					<button type="submit">
						<img src="/Images/Searchicon.png" alt="">
					</button>
				</form>
			</div>
			<div class="display-content">
        <!-- To display all the files, code will be generated from java file -->
				${fileDisplayCode}
			</div>
      <div class="pagination">
        <div class="pages">
          <!-- To Display the pagination, code will be generated from java file -->
          ${buttonCode}
        </div>
      </div>
		</div>
		<div class="AddndDelete">
			<div class="update">
				<form name="fileUpload" action="/uploaded" method="post" enctype="multipart/form-data">
					<input id="file" name="itemName" type="file" />
					<textarea type="text-box" name="itemCaption" placeholder="Description" required></textarea>
					<button onclick="fileUploaded()">Upload</button>
				</form>
				<span id="updateMessage">${message}</span>
			</div>
			<div class="delete">
				<form action="">
					<input type="text" name="itemName" placeholder="File Name to Delete" required>
					<button onclick="fileDeleted()">Delete</button>
				</form>
				<span id="deleteMessage"></span>
			</div>
		</div>
    
	</div>


	<script>
		function toggleAccountOptions() {
			var accountOptions = document.getElementById("accountOptions");
			if (accountOptions.style.display === "none") {
				accountOptions.style.display = "block";
			} else {
				accountOptions.style.display = "none";
			}
		}

		function toggleSortByOptions() {
			var sortByOptions = document.getElementById("sortByOptions");
			sortByOptions.classList.toggle("active");
		}
		function logout() {
			// Perform the logout functionality here.
			// You can clear session data, show a message, and redirect to the login page.
			alert("Are you sure, Click 'Ok' to Logout");
		}

    // To remove the updated message after 5 sec
		const updateMessage = document.getElementById("updateMessage");

		function fileUploaded() {
      //updateMessage.innerHTML = "File Uploaded Successfully"
			setTimeout(function() {
				updateMessage.innerHTML = ""
			}, 5000)
		}

		const deleteMessage = document.getElementById("deleteMessage");
		function fileDeleted() {
      deleteMessage.innerHTML = "Deleted Successfully"
			setTimeout(function() {
				deleteMessage.innerHTML = ""
			}, 10000)
		}
	</script>
</body>
</html>