<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" href="/Css/contact.css">
  <title>Contact Us</title>
</head>
<style>
  
</style>
<body>

<jsp:include page="Header.jsp" />

	<div class="container">
  <h1>Contact Us</h1>
<div class="contact-details">
  <div class="contact-info">
    <p><span>Email:</span>example@example.com</p>
    <p><span>Phone:</span>123-456-7890</p>
    <h2>Customer Services:</h2>
    <p class="services">Monday-Friday, 9 AM - 5 PM</p>
  </div>

  <div class="contact-form">
    <!-- <label for="name">Name:</label> -->
    <input type="text" id="name" name="name" placeholder="Your name">

    <!-- <label for="email">Email:</label> -->
    <input type="text" id="email" name="email" placeholder="Your email">

    <!-- <label for="message">Message:</label> -->
    <textarea id="message" name="message" placeholder="Your message"></textarea>

    <button type="submit">Send</button>
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
</script>
</body>
</html>