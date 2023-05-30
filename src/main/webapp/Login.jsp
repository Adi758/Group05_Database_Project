<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Login Page</title>
<link rel="stylesheet" href="/Css/login.css">
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
    width: 300px;
    margin: 0 auto;
    margin-top: 100px;
    padding: 20px;
    border: 2px solid #E3E8EB;
    border-radius: 5px;
    background-color: #B7C1C3;
    box-shadow: 0 0 5px rgba(236, 7, 7, 0.1);
  }

  h2 {
    text-align: center;
    font-size: 40px;
    color: #474745;
    font-family: "Comic sans ms";
  }

  form{
    margin-top: 10px;
  }

  .form-group {
    margin-bottom: 10px;
  }

  .form-group label {
    display: block;
    font-size: 18px;
    margin-bottom: 5px;
    color: #889293;
  }

  .form-group input[type="text"],
  .form-group input[type="password"] {
    width: 100%;
    height: 30px;
    font-size: 14px;
    padding: 8px;
    border-radius: 3px;
    background-color: #CCD6D8;
    border: 1px solid #474745;
  }

  .form-group button {
    width: 100%;
    padding: 8px;
    border-radius: 3px;
    border: none;
    background-color: #474745;
    color: #CCD6D8;
    font-weight: bold;
    cursor: pointer;
  }

  .form-group button:hover {
    background-color: #E3E8EB;
    color: #474745;
  }
  
  .contain {
    padding: 16px;
  }
  
  .error-message {
    color: red;
    font-size: 14px;
    margin-top: 10px;
  }
</style>
</head>
<body>

  <div class="container">
    <h2>Login</h2>
    <form action="/loginValidation" method="post">
      <div class="form-group">
        <label for="email">Email:</label>
        <input type="text" id="email" name="email" required>
      </div>
      <div class="form-group">
        <label for="password">Password:</label>
        <input type="password" id="password" name="password" required>
      </div>
      <div class="form-group">
        <button type="submit">Login</button>
      </div>
      <div class="form-group">
        <button type="button" class="signup-button" onclick="Signup()">Signup</button>
      </div>
      <div id="error-container" class="error-message"></div>
    </form>
  </div>


  <script>    
    function Signup() {
      window.location.href = "/signup";
    }
  </script>
</body>
</html>