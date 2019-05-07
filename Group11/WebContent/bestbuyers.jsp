<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"	%>
<%@ page import="java.io.*,java.util.*,java.sql.*,java.text.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>BuyMe - Sales Reports</title>
    <link rel="stylesheet" href="style.css?v=1.0"/>
</head>
<body>
<%@ include file="adminnavbar.jsp" %>
<%
try {
	String reportType = request.getParameter("type");
	ApplicationDB db = new ApplicationDB();
	Connection connection = db.getConnection();
	Statement st = connection.createStatement(); 
	ResultSet rs; 
	PreparedStatement ps = null;
			
	Locale locale = new Locale("en", "US");
	NumberFormat currency = NumberFormat.getCurrencyInstance(locale);
				
				
	String query = null;
	if (reportType.equals("bestBuyers")) {
	query = "SELECT buyer AS BUYER, COUNT(buyer) AS COUNT, SUM(bid) AS PRICE FROM winners GROUP BY buyer ORDER BY COUNT(buyer) DESC";
	ps = connection.prepareStatement(query);
	rs = ps.executeQuery();
	if (rs.next()) { %>
	<h2>Sales Report for Best Buyers:</h2>
	<table border="4">
	<tr>
	<th>BUYER</th><th>ITEMS BOUGHT</th><th>Total Amount Spent</th>
	</tr>	
	<%	do { %>
	<tr>
	<td><%= rs.getString("BUYER") %></td><td><%= rs.getInt("COUNT") %></td><td><%= currency.format(rs.getDouble("PRICE")) %></td>
	</tr>
	<%	} while (rs.next()); %>
	</table>
	<br><a href="salesReports.jsp">Click here to generate more sales reports.</a>
	<%
	}
	}
	}
catch (SQLException e) {
out.print("<p>Error connecting to MYSQL server.</p>");
e.printStackTrace();
} 

	 %>  