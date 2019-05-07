<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">
<title>Bid</title>
</head>
<body>
<% //int itemid = Integer.parseInt(request.getParameter("id"));
%>

<link rel="stylesheet" type="text/css" href="styles2.css">
    <link rel="stylesheet" href="style.css?v=1.0"/>

<body>


<div class="login-page">
  	<div class="box1"> </div>
  <div class="form">
 
   	
    <%
int itemid = Integer.parseInt(request.getParameter("id"));
   out.print("Biding on item: " +itemid);
%>
<form method="post" action="make_Bid.jsp?id=<%=itemid%>">
     
     <br>
   
       Manual bid: <input type="number" name="bid" min="0"> <br/>
       Auto bid(optional):<input type="number" name="auto" min="0"> <br/>
       <button>MAKE BIDDDDDDD</button>
      
     </form>
  </div>
</div>

</body>
</html>

</body>
</html>