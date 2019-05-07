<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" type="text/css" href="css/index.css"/>
    <link rel="stylesheet" href="style.css?v=1.0"/>
<title>alert</title>
</head>
<body>
<%@ include file="navbar.jsp" %>
<%
String shoesId = request.getParameter("id");
out.print("The Shoes ID that you set an alert on is "+shoesId);
try {
ApplicationDB db = new ApplicationDB();	
Connection con = db.getConnection();
Statement stmt = con.createStatement();

String username = ""+session.getAttribute("username");
out.print("Username is " + username);

//String str = "INSERT INTO Alerts (username, itemid) values (?, ?);";
PreparedStatement ps = con.prepareStatement("INSERT INTO Alerts(username, itemid) VALUES (?,?);");


Timestamp duration = new Timestamp(System.currentTimeMillis());

//PreparedStatement ps = connection.prepareStatement("INSERT INTO QnA(question, username, title, questiondate) VALUES (?,?,?,?);");


ps.setString(1, username);
ps.setString(2, shoesId);

ps.executeUpdate();

out.print("<h1>You have successfully placed an alert on this item</h1>");
con.close();
} catch (Exception x) {
out.print("<h1>An alert has already been placed for this item</h1>");
}
%>
<p><a href='customerportal.jsp'>Back to Customer Portal</a></p>
</body>
</html>