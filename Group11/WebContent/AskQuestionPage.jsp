<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
  <title>
Question Page
</title>
<link rel="stylesheet" type="text/css" href="css/index.css"/>
<link rel="stylesheet" href="style.css?v=1.0"/>
</head>
<body>
 <%@ include file="navbar.jsp" %>
<div class="login-page">
  	<div class="box1"> </div>
  <div class="form">
     <form action="SubmitQuestion.jsp" method="POST">
     
     <br>
       Username: <%out.println(" " + session.getAttribute("username")); %> <br/>
       Title: <input type="text" name="title"/> <br/>
       Question: <textarea name="question" rows="10" cols="18"></textarea> <br/>
       <button>post</button>

     </form>
  </div>
</div>

</body>
</html>