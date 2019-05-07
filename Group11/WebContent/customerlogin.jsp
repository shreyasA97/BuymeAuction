<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
  <title>
Login Page
</title>
<link rel="stylesheet" type="text/css" href="styles2.css">
</head>
<body>
<div class="login-page">
  	<div class="box1"> </div>
  <div class="form">
     <form action="checkcustomerlogindetails.jsp" method="POST">
     
     <br>
     <p> <font size="5"> Customer Login </font></p>
     
       <input type="text" placeholder="Username" name="username"/> <br>
       <input type="password" placeholder="Password" name="password"/>
       <p> <font size="-1" > <a href="#">Forgot your password?</a></font></p><br>
       <button>Login</button>
      <p class="message">New to BuyMe? <a href="register.jsp">Create your BuyMe Account</a></p>
      <p class="message"> <a href="index.jsp">Back to Main login page</a></p>
     </form>
  </div>
</div>

</body>
</html>