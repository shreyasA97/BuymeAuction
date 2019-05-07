<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<!--Import some libraries that have classes that we need -->
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>

<html>
<head>

<title> Regjsp
</title>

</head>
<body>
<%@ page import ="java.sql.*" %>
<%@ page import ="javax.sql.*" %>
<%@ page import ="java.sql.PreparedStatement" %>
<%


	
String cat =request.getParameter("categories");
String size =request.getParameter("size");
String color =request.getParameter("color");
String name =request.getParameter("name");


String brand =request.getParameter("brand");
String condition =request.getParameter("condition");
String year =request.getParameter("year");
String sku =request.getParameter("sku");
String description =request.getParameter("description");


	String buynow =request.getParameter("buynow");

	String reserve =request.getParameter("reserve");


	String start =request.getParameter("start");
	

	String end =request.getParameter("atime");
	 out.print(start);

String user = ""+session.getAttribute("username");

out.print(user);
out.print(user);

ApplicationDB db = new ApplicationDB();
Connection connection = db.getConnection();
Statement st = connection.createStatement(); 
ResultSet rs, cs; 

String insert_items; 



insert_items = "INSERT INTO Items (category, seller_username, name, size, color, brand, dateposted, status, con, sku, year, description) values (?, ?, ?, ?, ?, ?, now(), 1, ?, ?,?,?)";
PreparedStatement ps = connection.prepareStatement(insert_items);
ps.setString(1, cat);	
ps.setString(2, user);
ps.setString(3, name);
ps.setString(4, size);
ps.setString(5,color);
ps.setString(6, brand);
ps.setString(7, condition);
ps.setString(8, sku);
ps.setString(9, year);
ps.setString(10, description);
ps.executeUpdate();

ResultSet result = st.executeQuery("select max(itemid) from Items");
if(result.next()){

String insert_auction; 
insert_auction = "Insert into Auction_Post (itemid, start_price, end_date, reserve, buynow) values (?,?,addtime(now(),'"+end+"'),?,?)";

int itemid = result.getInt("max(itemid)");

PreparedStatement psa = connection.prepareStatement(insert_auction);
psa.setInt(1, itemid);
psa.setString(2, start);
psa.setString(3, reserve);
psa.setString(4, buynow);
psa.executeUpdate();
session.setAttribute("itemid", itemid);
out.println("you did it!");
connection.close();
out.print("<p>Well done Items registered.</p>");
response.sendRedirect("whatimselling.jsp");
	
}

out.print("<p>Failed.</p>");


	




%>

</html>