<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<html>
<head>

<title> Verifying Credentials</title>
<link rel="stylesheet" type="text/css" href="styles2.css">
</head>
<body>
<%
String pwd = request.getParameter("password");
String userid = request.getParameter("username");

try {
ApplicationDB db = new ApplicationDB();	
Connection con = db.getConnection();
Statement stmt = con.createStatement();
//String url = "jdbc:mysql://buymecs336.cullikgcidh1.us-east-2.rds.amazonaws.com:3306/Group11_CS336";
//Class.forName("com.mysql.jdbc.Driver");
//Connection con = DriverManager.getConnection(url,"Group11", "mypassword");

String str = "SELECT password FROM Admin WHERE username=" + "'"+userid+"';" ;
ResultSet result = stmt.executeQuery(str);
if(result.next()){
String password = result.getString("password");
con.close();
if(password.equals(pwd)){
    
session.setAttribute("username", userid);
response.sendRedirect("adminportal.jsp");
out.println("<a href='adminportal.jsp'>Head over to your Admin Page!</a>");
	
	
} 
else {
	out.println("<div  class='form'/>");
	out.println("Invalid Password. <a href='adminlogin.jsp'>Please try again</a>");
	
}
} else {
	out.println("<div  class='form'/>");
	out.println("Username does not exist! <a href='adminlogin.jsp'>Please try again</a>");
	
}
} catch (Exception ex) {
	out.println(ex);
	out.println("error");
}

	
%>
</body>
</html>