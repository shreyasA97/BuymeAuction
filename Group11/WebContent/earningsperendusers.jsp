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
	if (reportType.equals("earningsPerEndUser")) {
	query = "SELECT i.seller_username AS SELLER , SUM(w.bid) AS PRICE FROM winners as w JOIN Items as i ON w.itemid=i.itemid GROUP BY i.seller_username";
	ps = connection.prepareStatement(query);
	rs = ps.executeQuery();
	if (rs.next()) { %>
	<h2>Sales Report for Total Earnings Per End-Users:</h2>
	<table border="4">
	<tr>
	<th>USER</th><th>Total Earnings</th>
	</tr>	
	<%	do { %>
	<tr>
	<td> <%= rs.getString("SELLER") %></td><td><%= currency.format(rs.getDouble("PRICE")) %></td>
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