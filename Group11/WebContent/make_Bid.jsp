
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" type="text/css" href="css/index.css"/>
    <link rel="stylesheet" href="style.css?v=1.0"/>
<title>bidPage</title>
</head>
<body>
<%@ include file="navbar.jsp" %>
<br>
<br>
<br>
<%

int bid, auto;
int itemid = Integer.parseInt(request.getParameter("id"));
try {

String user = ""+session.getAttribute("username");

String sec = "Select seller_username from Items where itemid = '"+itemid+"'"; //cant bid on his own stuff
ResultSet rt;
try {
	 bid = Integer.parseInt(request.getParameter("bid"));
}
catch (NumberFormatException exc) {
     bid = 0;
}
try {
	auto = Integer.parseInt(request.getParameter("auto"));
}
catch (NumberFormatException exc) {
    auto = 0;
}
//int itemid = Integer.parseInt(request.getParameter("id"));
//int bid = Integer.parseInt(request.getParameter("bid"));
//int auto = Integer.parseInt(request.getParameter("auto"));

ApplicationDB db = new ApplicationDB();	
Connection con = db.getConnection();
Statement stmt = con.createStatement();

rt = stmt.executeQuery(sec);
if(rt.next()){
	String seller = rt.getString("seller_username");
	if (seller.equals(user)){
	out.print("Cant bid on your own item");

	
	out.println("<li><a href='customerportal.jsp'>My portal</a></li>");
	}
}



float start= 0;
String q = "SELECT A.start_price from Auction_Post A where A. itemid = '"+itemid+"'";
ResultSet result1 = stmt.executeQuery(q);
if(result1.next()){
start = result1.getFloat("A.start_price");
}



String query = "SELECT max(bidamount) from Bids where bidamount in (select bidamount from Bids where itemid = '"+itemid+"')";
//String str = "SELECT  max(bidamount) from Bids where itemid='"+itemid+ "'";
ResultSet result = stmt.executeQuery(query);
if(result.next()){
	int A = result.getInt("max(bidamount)");
	if(bid <= A){
		out.println("Please enter a bid greater than CURRENT BID: "+A);
		out.print("<th><a href='Bid.jsp?id=" + itemid + "'> Enter higher bid</a></th>");
	}
	else if(bid < start) {
		out.println("Please enter a bid greater than Start Price: "+start);
		out.print("<th><a href='Bid.jsp?id=" + itemid + "'> Enter higher bid</a></th>");
		
	}
	else{
		String str="INSERT INTO Bids (itemid, bidamount, upperlimit, time, user) values (?, ?, ?, ?, ?);";
		PreparedStatement ps = con.prepareStatement(str);
		Timestamp time = new Timestamp(System.currentTimeMillis());
		ps.setInt(1,itemid);
		ps.setInt(2,bid);
		ps.setInt(3,auto);
		ps.setTimestamp(4,time);
		ps.setString(5,user);
		ps.executeUpdate();
		
		str = "INSERT INTO Alerts (message, itemid, username) VALUES (?,?,?)";
		ps = con.prepareStatement(str);
		ps.setString(1, "You have been outbid.");
		ps.setInt(2, itemid);
		ps.setString(3, user);
		ps.executeUpdate();
		
		str="Update Items set currentbid = ? where itemid = '"+itemid+"';";
		ps = con.prepareStatement(str);
		ps.setInt(1,bid);
		ps.executeUpdate();
		//String q2= "Insert into Bids (bidamount, upperlimit, time, itemid) values ('"+bid+"','"+auto+"','"+time+"','"+itemid+"')";
		//ResultSet result2 = stmt.executeQuery(q2);
		
		
		str="Update  Auction_Post set currentbid = ?, buyer = ? where itemid = '"+itemid+"'";
		ps = con.prepareStatement(str);
		ps.setInt(1,bid);
		ps.setString(2,user);
		ps.executeUpdate();
		//String q2= "Insert into Bids (bidamount, upperlimit, time, itemid) values ('"+bid+"','"+auto+"','"+time+"','"+itemid+"')";
		//ResultSet result2 = stmt.executeQuery(q2);
		out.println("You are the top bidder right now!<br>");
		out.println("Bid amount: "+bid+"<br>");
	}
	out.println("<p><a href='whatimselling.jsp'>Back to My Auctions!</a><br><p>");
	con.close();	
}
}
catch (NumberFormatException exc) {
	out.println("Something went wrong<br>");
	out.println("<a href='Bid.jsp?id=" + itemid + "'>");
}

//String name = result.getString("");


%>
</body>
</html>

</body>
</html>