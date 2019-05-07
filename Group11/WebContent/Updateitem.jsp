<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<!--Import some libraries that have classes that we need -->
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <link rel="stylesheet" href="style.css?v=1.0"/>
<title> Regjsp
</title>

</head>
<body>
<%@ page import ="java.sql.*" %>
<%@ page import ="javax.sql.*" %>
<%@ include file="navbar.jsp" %>
<%

	ApplicationDB db = new ApplicationDB();
	Connection connection = db.getConnection();
	Statement st = connection.createStatement(); 
	
//String itemid = request.getParameter("itemid");
String itemid = ""+session.getAttribute("itemid");
String user=request.getParameter("userid");
//String cat=request.getParameter("categories");
String username = ""+session.getAttribute("username"); 
String cat = request.getParameter("category");
String brand =request.getParameter("brand");  
String name=request.getParameter("name"); 
String size=request.getParameter("size");
String color =request.getParameter("color");  
String year =request.getParameter("year"); 
String sku =request.getParameter("sku"); 
String des =request.getParameter("description");  
String buynow=request.getParameter("buynow"); 
String reserve=request.getParameter("reserve"); 
String con =request.getParameter("condition");


//int siz = Integer.parseInt(size);
//int yer = Integer.parseInt(year);

//name null , brand null , size 0, color null , condition 0 , year 0, sku null , description null , buynow null, reserve null, 
//category, seller_name, name, size, color, con, sku, year, description  
ResultSet rs;
String updateQuery = "update Items SET category =IFNULL(? ,category),name =IFNULL(? ,name),color =IFNULL(? ,color), con=IFNULL(? ,con),sku=IFNULL(? ,sku),description=IFNULL(? ,description) where itemid ='"+itemid+"'";
      
PreparedStatement ps = connection.prepareStatement(updateQuery);
ps.setString(1, cat);
ps.setString(2, name);
ps.setString(3, color);
ps.setString(4, con);
ps.setString(5, sku);
ps.setString(6, des);
ps.executeUpdate();



String updateQuery1 = "update Auction_Post  SET buynow =IFNULL(? ,buynow),reserve =IFNULL(? ,reserve) where itemid ='"+itemid+"'";

PreparedStatement psa = connection.prepareStatement(updateQuery1);
psa.setString(1, buynow);
psa.setString(2, reserve);
psa.executeUpdate();

rs = st.executeQuery("select * from Items where itemid = '"+itemid+"'");
if (rs.next()){
	
    out.println("Item Updated! ");
    
}
else{
	String it = session.getAttribute("item");
	out.println("no update made plese try again ");
	out.print("<th><a href='itemedit.jsp?id=" + it + "'> Edit item again</a></th>");
}

%>


</body>
</html>