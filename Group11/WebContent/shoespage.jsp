<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" type="text/css" href="css/index.css"/>
    <link rel="stylesheet" href="style.css?v=1.0"/>
<title>Shoes</title>
</head>
<body>
<%@ include file="navbar.jsp" %>
<% 

String name = "";
String condition = "";
String color = "";
String category = "";
String brand = "";
String datePosted = "";
String emailOfSeller = "";
String closingDate = "";
String currentbid = "";
int startingPrice = 0;
int increment = 0;
int status = 0;
int itemid = Integer.parseInt(request.getParameter("id"));
ApplicationDB db = new ApplicationDB();	
Connection con = db.getConnection();
Statement stmt = con.createStatement();
String str = "SELECT * FROM Items WHERE itemid = '" + itemid + "';";
ResultSet result = stmt.executeQuery(str);
if(result.next()){
name = result.getString("name");
color = result.getString("color");
category = result.getString("category");
brand = result.getString("brand");
status = result.getInt("status");
} 
str = "SELECT * FROM infoOfBid WHERE itemid = '" + itemid + "';";
result = stmt.executeQuery(str);
if(result.next()){
startingPrice = result.getInt("startingPrice");
increment = result.getInt("increment");
}
str = "SELECT * FROM Items WHERE itemid = '" + itemid + "';";
result = stmt.executeQuery(str);
if(result.next()){
currentbid = ""+result.getInt("currentbid");
}
str = "SELECT * FROM Auction_Post WHERE itemid = '" + itemid + "';";
result = stmt.executeQuery(str);
if(result.next()){
closingDate = ""+result.getString("end_date");
} 
else {
currentbid = "No bids available.";
} 
con.close();
		
%>



    </div>
  </li>

  
  

</ul>
<br>
<br>


<table border = "4">
<tr>
<td>Name: </td><td><%=name %></td>
</tr>
<tr>
<td>Category: </td><td><%=category %></td>
</tr>
<tr>
<td>Brand: </td><td><%=brand %></td>
</tr>
<tr>
<td>Color: </td><td><%=color %></td>
</tr>
<tr>
<td>Initial Price: </td><td><%=startingPrice %></td>
</tr>
<tr>
<td>Increment: </td><td><%=increment %></td>
</tr>
<tr>
<td>Current Bid: </td><td><%=currentbid %></td>
</tr>
<tr>
<td>Closing Date: </td><td><%=closingDate %></td>
</tr>
<tr>
<td>Email of Seller: </td><td><%=emailOfSeller %></td>
</tr>
</table>
	<br>
	
<%
if (status == 0){
out.println("<p><a href='Bid.jsp?id=" + itemid + "'>Make a bid on this Auction</a></p>");
out.println("<p><a href='historyBid.jsp?id="+itemid+"'>History for this Auction</a></p>");

}
else{
	out.println("<h2>THIS ITEM'S AUCTION ENDED</h2>");
	out.println("<li><a href='customerportal.jsp'>My portal</a></li>");

	
}
%>
</body>
</html>