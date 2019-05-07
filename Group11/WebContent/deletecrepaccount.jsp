<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
 <title>
Customer Representative Account Deletion Page
</title>
<link rel="stylesheet" type="text/css" href="styles2.css">
</head>
<body>
<div class="login-page">
  	<div class="box1"> </div>
  <div class="form">
    <form action="deletecrep.jsp" method="POST">
    <br>
    <p> <font size="5"> Delete Customer Representative Account </font></p>
     	<input type="text" placeholder="Username" name= "userid" required/> <br>
     	
     <button>Delete Account</button>
     <p class="message"> <a href="adminportal.jsp">Back to Admin Portal</a></p>
     </form>
  </div>
</div>

</body>
</html>