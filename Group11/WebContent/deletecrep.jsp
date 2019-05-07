<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"	%>
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
<%
try{
	
String user=request.getParameter("userid");
ApplicationDB db = new ApplicationDB();
Connection connection = db.getConnection();
Statement st = connection.createStatement(); 
ResultSet rs; 
int i=st.executeUpdate("delete from CustomerReps where username ='" + user + "'"); 
    out.println("<div  class='form'/>");
    out.println("Account Deleted!");
    out.println("<p> <font size='-1'><a href='adminportal.jsp'>Back to Admin Portal");
} catch (Exception ex) {
	out.println("<div  class='form'/>");
	out.println("Username does not exist!<br>");
	out.println("<br>Please try again with the correct username.<br>");
	out.println("<a href='deletecrepaccount.jsp'>Delete Account</a><br>");
}

%>

</html>