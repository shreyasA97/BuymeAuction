<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <link rel="stylesheet" href="style.css?v=1.0"/>
<title>My Items</title>
<%@ include file="navbar.jsp" %>
<%

ApplicationDB db = new ApplicationDB();	
Connection con = db.getConnection();
Statement stmt = con.createStatement();
String username = ""+session.getAttribute("username"); 
String itemid = ""+session.getAttribute("itemid");


out.println("<h2> "+username+"'s Auctioned Items!</h2>");
out.println("<br>");
out.println("<br>");
out.println("<b>Recent Item put on auction</b>");
out.println("<br>");
out.println("<br>");
out.println("<table border='4'><tr><th>Auction Id</th><th>Shoe name</th><th>Starting price$ </th><th>Current Bidding Amount $</th><th>Closing Date/Time</th></tr>");
con = db.getConnection();
stmt = con.createStatement();
String str = "SELECT  I.name, I.itemid, A.idAuction_Post, A.itemid, A.start_price, A.end_date, A.reserve, A.buynow ,A.currentbid FROM Auction_Post A ,Items I   where A.itemid = '"+itemid+"' and A.itemid = I.itemid " ;
ResultSet result = stmt.executeQuery(str);
if(result.next()){
	
int id= result.getInt("A.idAuction_Post");
//String name = result.getString("");
String A_id = result.getString("A.idAuction_Post");
String name = result.getString("I.name");
String start = result.getString("A.start_price");
String current = result.getString("currentbid");
String end = result.getString("A.end_date");
String idzz = result.getString("I.itemid");



//String str2 = "SELECT cb.cost from CurrentBid as cb join jewelry as j on cb.jewelryID = j.jewelryID WHERE j.jewelryID = " + id;
//String currentCost = "This item has no bids";
//Statement stmt2 = con.createStatement();
//ResultSet result2 = stmt2.executeQuery(str2);
	
//if(result.next()){
	
//currentCost = result2.getString("cb.cost");
//} 
//out.print("<tr><th><a href='jewelryPage.jsp?id=" + id + "'>" +name + "</a></th>");
//out.print("<th> $  "+  + "</th>");
out.print("<th><a href='itemedit.jsp?id=" + idzz + "'>" +A_id + "</a></th>");

out.print("<th>  "+ name + "</th>");
out.print("<th> $"+ start + "</th>");
out.print("<th> $ "+ current + "</th>");
out.print("<th>"+ end + "</th></tr>");
}
out.print("</table>");
String str2 = "SELECT  I.name, A.idAuction_Post, A.itemid, A.start_price, A.end_date, A.reserve, A.buynow ,A.currentbid FROM Auction_Post A ,Items I   where I.status = '1' and I.seller_username = '"+username+"' and I.itemid = A.itemid " ;
ResultSet result2 = stmt.executeQuery(str2);

out.println("<b>Items you have put up for auction</b>");
out.println("<br>");
out.println("<br>");
out.println("<table border='4'><tr><th>Auction Id</th><th>Shoe name</th><th>Starting price$ </th><th>Closing Date/Time</th></tr>");

while(result2.next()){
	
int id= result2.getInt("A.idAuction_Post");

String A_id = result2.getString("A.idAuction_Post");
String name = result2.getString("I.name");
String start = result2.getString("A.start_price");
String end = result2.getString("A.end_date");
String idz = result2.getString("A.itemid");





//String str2 = "SELECT cb.cost from CurrentBid as cb join jewelry as j on cb.jewelryID = j.jewelryID WHERE j.jewelryID = " + id;
//String currentCost = "This item has no bids";
//Statement stmt2 = con.createStatement();
//ResultSet result2 = stmt2.executeQuery(str2);
	
//if(result.next()){
	
//currentCost = result2.getString("cb.cost");
//} 
//out.print("<tr><th><a href='jewelryPage.jsp?id=" + id + "'>" +name + "</a></th>");
//out.print("<th> $  "+  + "</th>");
out.print("<th><a href= 'itemedit.jsp?id=" + idz + "'>" +A_id + "</a></th>");
out.print("<th>  "+ name + "</th>");
out.print("<th> $ "+ start + "</th>");
out.print("<th>"+ end + "</th></tr>");
	
}
out.print("</table>");
out.println("Bidded on items <br><br>");
str2="SELECT distinct I.itemid, I.name, A.idAuction_Post, A.start_price, A.end_date ,B.bidamount  FROM Auction_Post A ,Items I, Bids B  where I.status = '1' and I.seller_username = '"+username+"' and I.itemid = A.itemid and A.itemid = B.itemid and B.bidamount in (select max(b.bidamount)as bidamount from Bids b, Items i where i.seller_username = '"+username+"' and i.itemid = b.itemid group by i.itemid)";
//str2 = "SELECT distinct I.itemid, I.name, A.idAuction_Post, A.start_price, A.end_date FROM Auction_Post A ,Items I, Bids B  where I.status = '1' and I.seller_username = 'aaron' and I.itemid = A.itemid and A.itemid = B.itemid" ;
 result2 = stmt.executeQuery(str2);

out.println("<b>Your items that have bids on them </b>");
out.println("<br>");
out.println("<br>");
out.println("<table border='4'><tr><th>Auction Id</th><th>Shoe name</th><th>Starting price$ </th><th>Current Bidding Amount $</th><th>Closing Date/Time</th><th>Set Alert</th></tr>");

while(result2.next()){
	
int id= result2.getInt("A.idAuction_Post");

String A_id = result2.getString("A.idAuction_Post");
String name = result2.getString("I.name");
String start = result2.getString("A.start_price");
String current = result2.getString("B.bidamount");
String end = result2.getString("A.end_date");
String idz = result2.getString("I.itemid");



//String str2 = "SELECT cb.cost from CurrentBid as cb join jewelry as j on cb.jewelryID = j.jewelryID WHERE j.jewelryID = " + id;
//String currentCost = "This item has no bids";
//Statement stmt2 = con.createStatement();
//ResultSet result2 = stmt2.executeQuery(str2);
	
//if(result.next()){
	
//currentCost = result2.getString("cb.cost");
//} 
//out.print("<tr><th><a href='jewelryPage.jsp?id=" + id + "'>" +name + "</a></th>");
//out.print("<th> $  "+  + "</th>");
out.print("<th><a href='itemedit.jsp?id=" + idz + "'>" +A_id + "</a></th>");
out.print("<th>  "+ name + "</th>");
out.print("<th> $ "+ start + "</th>");
out.print("<th> $ "+ current + "</th>");
out.print("<th>"+ end + "</th></tr>");

out.print("<th><a href='Alert.jsp?id=" + idz + "'> Get auctions alerts </a></th>");
}



out.print("</table>");
con.close();

%>