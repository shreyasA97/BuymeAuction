<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<!--Import some libraries that have classes that we need -->
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<html>
<head>
<title>
searching
</title>
    <link rel="stylesheet" href="style.css?v=1.0"/>
</head>
<%@ include file="navbar.jsp" %>
<br>
<br>
<br>
<table border="4">
<tr>
<th>Shoe Name and ID</th>
<th>Status of Auction</th>
<th>Current Bid</th>
<th>Closing date</th>
</tr>
<%@ page import ="java.sql.*" %>
<%@ page import ="javax.sql.*" %>
<%
ApplicationDB db = new ApplicationDB();	
Connection con = db.getConnection();
Statement stmt = con.createStatement();
String category = request.getParameter("category");
String sort = request.getParameter("sort");
String query =request.getParameter("query");
String size = request.getParameter("size");
String color = request.getParameter("color");
	
if(query.isEmpty()){
	query = "";
} 
else {
	query = " and i.name like '%"+query+"%'";
}
if(category.isEmpty()){
category = "";
} 
else {
category = " and i.category = '"+category+"'";
}
if(size.isEmpty()){
size = "";
} 
else {
size = " and i.size='" + size+"'";
}
if(color.isEmpty()){
color = "";
} 
else {
color = " and i.color='"+color+"'"; 
}
if(sort.isEmpty()){
sort="";
} 
else {
sort = " order by "+ sort;
}
			
String str = "SELECT i.itemid FROM Items as i WHERE i.status=0 or i.status=1"+query+category+size+color+sort;
ResultSet result = stmt.executeQuery(str);
while(result.next()){
int item_ID=result.getInt("i.itemid");
String str1 ="SELECT i.itemid, i.status, i.name, iob.closingDate FROM Items as i join infoOfBid as iob on i.itemid = iob.itemid WHERE i.itemid =" + item_ID;
Statement stmt1 = con.createStatement();
ResultSet result1 = stmt1.executeQuery(str1);
while(result1.next())
{
	int id= result1.getInt("i.itemid");
	String nameOfShoes = result1.getString("i.name");
	int status = result1.getInt("i.status");
	
	String currentCost = "item has no bids";
	String str2 = "SELECT i.currentbid FROM Items as i  WHERE i.itemid = " + id;
	Statement stmt2 = con.createStatement();
	ResultSet result2 = stmt2.executeQuery(str2);
	if(result2.next()){
	currentCost = result2.getString("currentbid");
	}
	if(status==0){
	out.print("<tr><th><a href='shoespage.jsp?id=" + id + "'>NAME: "+ nameOfShoes+ " ID: "+id+" </a></th>");
	out.print("<th>OPEN</th>");
	out.print("<th>" + currentCost +"</th>");
	
	}
	else{
	out.print("<tr><th><a href='shoespage.jsp?id=" + id + "'>NAME: "+ nameOfShoes+ " ID: "+id+" </a></th>");
	out.print("<th>CLOSED</th>");
	out.print("<th>" + currentCost +"</th>");

	
		
	}
}
}
con.close();
%>
</table>
<p><a href='search.jsp'>Back to search</a></p>
<p><a href='customerportal.jsp'>Buyer's Dashboard</a></p>
<p><a href='logout.jsp'>Log out</a></p>
</body>
</html>
