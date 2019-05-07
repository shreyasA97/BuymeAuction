<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
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
    	<div class="content">
	    	<h2>Select a sales report to generate</h2>
	    	<ul>
	            <li><a href="totalearnings.jsp?type=totalEarnings">Total Earnings</a></li>
	            <li><a href="earningsperitem.jsp?type=earningsPerItem">Earnings per item</a></li>
	            <li><a href="earningsperitemtype.jsp?type=earningsPerItemType">Earnings per item type</a></li>
	            <li><a href="earningsperendusers.jsp?type=earningsPerEndUser">Earnings per end-user</a></li>
	            <li><a href="bestsellingitems.jsp?type=bestSelling">Best-selling items</a></li>
	            <li><a href="bestbuyers.jsp?type=bestBuyers">Best buyers</a></li>	            
	    	</ul>
    	</div>
</body>
</html>