
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<!--Import some libraries that have classes that we need -->
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Login</title>
<link rel="stylesheet" type="text/css" href="styles2.css">
</head>
<body>
<%
String userid = request.getParameter("username");
String pwd = request.getParameter("password");

try { 	
ApplicationDB db = new ApplicationDB();	
Connection con = db.getConnection();
Statement stmt = con.createStatement();
//String url = "jdbc:mysql://buymecs336.cullikgcidh1.us-east-2.rds.amazonaws.com:3306/Group11_CS336";
//Class.forName("com.mysql.jdbc.Driver");
//Connection con = DriverManager.getConnection(url,"Group11", "mypassword");

ResultSet rs;
rs = stmt.executeQuery("SELECT firstName, password FROM CustomerReps WHERE username='" +userid+ "';");
if(rs.next()){
String firstName = rs.getString("firstName");
String password = rs.getString("password");		
session.setAttribute("username", userid);
session.setAttribute("name", firstName);
out.println("welcome " + userid);
out.println("<a href='logout.jsp'>Log out</a>");
response.sendRedirect("crepportal.jsp");
}
else {
	out.println("<div  class='form'/>");
    out.println("Invalid Username or Password. <a href='creplogin.jsp'>Please try again</a>");
}
} catch (Exception x) {
out.println(x);
out.println("error");
}
%>
</body>
</html>
