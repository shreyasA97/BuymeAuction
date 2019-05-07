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
<title>Insert title here</title>
</head>
<body>
<%@ include file="navbar.jsp" %>
<ul>
</ul>
<h1>Welcome to your alerts <%out.print(session.getAttribute("name")); %></h1>
<br>
<br>
<table border='4'>
<tr>
<th>Item ID</th>
<th>Username</th>
<th>Message</th>
</tr>

<% 
ApplicationDB db = new ApplicationDB();	
Connection con = db.getConnection();
Statement stmt = con.createStatement();

String username = ""+session.getAttribute("username");

String str = "SELECT a.username, a.itemid, a.message FROM Alerts as a WHERE username= '"+username+"'";
ResultSet result = stmt.executeQuery(str);

while(result.next())
{
//String username = result.getString("a.username");
String itemid = result.getString("a.itemid");
String message = result.getString("a.message");

out.print("<tr><th>" +itemid+ "</th>");
out.print("<th>" +username+ "</th>");
if(message == null)
{
out.print("<th> You are the highest bidder</th></tr>");
}
else
{
	out.print("<th>" + message + "</th></tr>");
}
}
con.close();
%>
</table>
<br>
<br>

</body>
</html>

