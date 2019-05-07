<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" type="text/css" href="css/index.css"/>
    <link rel="stylesheet" href="style.css?v=1.0"/>
<title>Search</title>
</head>
<body>
<%@ include file="navbar.jsp" %>
<b>Search for Shoes</b>
<br>
<br>
<form method="post" action="searching.jsp">
<table border="4">

<tr>
<td>Filter by this Word</td><td><input type="text" name="query"></td>
</tr>
</table>
<br>
<br>


<b>Filter shoes by</b>
<br>
<br>
<table border="4">
<tr>
<td>Category</td><td><select name=category size=1>
<option value=""></option>
<option value="100">100</option>
<option value="200">200</option>
<option value="300">300</option>
</select></td>
</tr>
	
	
<tr>
<td>Color</td><td><select name=color size=1>
<option value=""></option>
<option value="red">red</option>
<option value="black">black</option>
<option value="white">white</option>
<option value="yellow">yellow</option>
<option value="Other">other</option>
</select>
</td>
</tr>

	
<tr>
<td>Size</td><td><select name="size" size=1>
<option value=""></option>
<option value="6.0">6</option>
<option value="6.5">6.5</option>
<option value="7.0">7</option>
<option value="7.5">7.5</option>
<option value="8.0">8</option>
<option value="8.5">8.5</option>
<option value="9.0">9</option>
<option value="9.5">9.5</option>
<option value="10.0">10</option>
<option value="10.5">10.5</option>
<option value="11.0">11</option>
<option value="11.5">11.5</option>
<option value="12.0">12</option>
<option value="12.5">12.5</option>
<option value="13.0">13</option>
<option value="14.0">14</option>
<option value="15.0">15</option>
<option value="16.0">16</option>
<option value="17.0">17</option>
<option value="18.0">18</option>
</select>
</td>
</tr>


	
	
</table>
<br>
<br>
<b>Sort by</b>
<br>
<br>
<table border="4">
<tr>
<td>Sorting By</td><td><select name="sort" size=1>
<option value=""></option>
<option value="size">size</option>
<option value="color">color</option>
</select></td>
</tr>
</table>
<br>
<input type="submit" value="Search" class="button">



</form>
<p><a href='customerportal.jsp'>Back to basic Dashboard</a></p>
<p><a href='logout.jsp'>Log out</a></p>
</body>
</html>



