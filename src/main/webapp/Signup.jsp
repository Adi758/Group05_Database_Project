<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Sign Up</title>
<link rel="stylesheet" href="Css/signup.css">
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

  .container {
    width: 400px; /* Adjust the width as desired */
    margin: 0 auto;
    margin-top: 50px;
    padding: 20px;
    border: 2px solid #E3E8EB;
    border-radius: 5px;
    background-color: #B7C1C3;
    box-shadow: 0 0 5px rgba(0, 0, 0, 0.1);
  }

  h1 {
    text-align: center;
    font-size: 40px;
    color: #474745;
    font-family: "Comic sans ms";
  }

  form {
    margin-top: 10px;
  }

  label {
    display: block;
    font-size: 18px;
    margin-bottom: 5px;
    color: #889293;
  }

  input[type="text"],
  input[type="email"],
  input[type="password"] {
    width: 100%;
    height: 30px;
    font-size: 14px;
    padding: 8px;
    border-radius: 3px;
    background-color: #CCD6D8;
    border: 1px solid #474745;
    margin-bottom: 10px;
  }

  input[type="checkbox"] {
    margin-right: 5px;
  }
.terms{
  transform: translateY(-30px);
  font-size: 14px;
}
  button[type="submit"] {
    margin: 10px 0;
    width: 100%;
    padding: 8px;
    border-radius: 3px;
    border: none;
    background-color: #474745;
    color: #CCD6D8;
    font-weight: bold;
    cursor: pointer;
  }
  .error-message {
    color: red;
    margin-top: 5px;
  }

  .login {
    text-align: center;
    font-size: 16px;
    color: #474745;
    /* margin-top: 10px; */
  }

  a {
    color: #337ab7;
    font-size: 16px;
    text-decoration: none;
  }

  a:hover {
    text-decoration: underline;
  }
</style>
</head>
<body>
<div class="container">
    <h1>Sign Up</h1>
    <form id="signup-form" action="/register" method="post">
      <label for="firstname">First Name:</label>
      <input type="text" id="firstname" name="firstName" required>

      <label for="lastname">Last Name:</label>
      <input type="text" id="lastname" name="lastName" required>

      <label for="email">Email Address:</label>
      <input type="email" id="email" name="email" required>

      <label for="password">Password:</label>
      <input type="password" id="password" name="password" required>

      <!-- <label for="usertype">User Type</label>
      <input type="text" name="userType" id="userType" required> -->

      <input type="checkbox" id="terms" name="terms" required>
      <lable for="terms" class="terms">I agree to the Terms of Service and Privacy Policy</lable>

      <button type="submit">Sign Up</button>
    </form>
    <p class="login">Already have an account? <a href="/login">Log In</a></p>
  </div>
<script>
  
</script>
</body>
</html>