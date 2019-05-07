<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
  <title>
Customer Registration Page
</title>
<link rel="stylesheet" type="text/css" href="styles2.css">
    <link rel="stylesheet" href="style.css?v=1.0"/>
</head>
<body>
<div class="login-page">
  	<div class="box1"> </div>
  <div class="form">
    <form action="reg.jsp" method="POST">
    <p> <font size="5"> Create Account </font></p>
     	<input type="text" placeholder="Username" name= "userid" required/> <br>
     	<input type="text" placeholder="First Name" name= "fname" required/> <br>
     	<input type="text" placeholder="Last Name" name= "lname" required/> <br>
     	<input type="password" placeholder="Password" name= "password" required/> <br>
     	<input type="email" placeholder="Email" name= "email" required/><br><br>
     <button>Create your BuyMe Account</button>
     <p class="message">Already have an account? <a href="customerlogin.jsp">Login</a></p>
	<p class="message"> <a href="index.jsp">Back to Main login page</a></p>
	 </form>
  </div>
</div>

</body>
</html>