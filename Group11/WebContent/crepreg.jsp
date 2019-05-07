<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<!--Import some libraries that have classes that we need -->
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title> Regjsp
</title>
<link rel="stylesheet" type="text/css" href="styles2.css">
</head>
<body>
<%@ page import ="java.sql.*" %>
<%@ page import ="javax.sql.*" %>
<%@ include file="crepnavbar.jsp" %>
<%
try{
	
String user=request.getParameter("userid");
String fname=request.getParameter("fname");
String lname=request.getParameter("lname");
String pwd=request.getParameter("password"); 
String email=request.getParameter("email"); 
ApplicationDB db = new ApplicationDB();
Connection connection = db.getConnection();
Statement st = connection.createStatement(); 
ResultSet rs; 
int i=st.executeUpdate("insert into CustomerReps (username, firstName, lastName, password, email) values ('"+user+"','"+fname+"','"+lname+"','"+pwd+"','"+email+"')"); 

rs = st.executeQuery("select * from CustomerReps where username='" + user + "' and password='" + pwd + "'");
if (rs.next()) {
    session.setAttribute("User", user); // the username will be stored in the session
    out.println("<div  class='form'/>");
    out.println("Registration Complete!");
    out.println("<a href='creplogin.jsp'>Login</a>");
    out.println("<p> <font size='-1'><a href='adminportal.jsp'>Back to Admin Portal");}

} catch (Exception ex) {
	out.println("<div  class='form'/>");
	out.println("Username or Email already exists!<br>");
	out.println("<br>Please try to login");
	out.println("<a href='customerlogin.jsp'>Login</a><br>");
	out.println("Create new account");		
	out.println("<a href='register.jsp'>Register</a>");
	
}
 


%>

</html>