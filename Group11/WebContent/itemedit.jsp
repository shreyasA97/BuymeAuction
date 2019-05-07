<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <link rel="stylesheet" href="style.css?v=1.0"/>
<title>Edit Item</title>
</head>
<body>
<%@ include file="navbar.jsp" %>
<%

ApplicationDB db = new ApplicationDB();	
Connection con = db.getConnection();
Statement stmt = con.createStatement();
//String user = session.getAttribute(user);

//int itemid = Integer.parseInt(request.getParameter("id"));
int itemid = Integer.parseInt(request.getParameter("id"));
String username = ""+session.getAttribute("username");
session.setAttribute("item", itemid);

String cat, brand, name, size, color, year, sku, des, buynow, reserve, status, end, bid, condition, current, a_id;
//name size color brand status con sku year description category
//start_date end_date reserve buynow currentbid

out.println("<b>Item "+itemid+" </b>");
out.println("<br>");
out.println("<br>");
out.println("<table border='2'><tr><th>Item Id</th><th>Category</th><th>Name </th><th>Brand </th><th>Size</th><th>Color</th><th>Year</th><th>Condition</th><th>End Date/time</th><th>Buynow $</th><th>current bid$</th><th>Sku</th><th>reserve</th><tr>");


String str = "SELECT  I.category, I.name, I.size, I.color, I.brand ,I.status, I.sku, I.year, I.description, I.con, A.idAuction_Post, A.end_date, A.reserve, A.buynow, A.currentbid FROM Auction_Post A ,Items I   where I.itemid = '"+itemid+"' and I.itemid = A.itemid " ;
ResultSet result = stmt.executeQuery(str);
if(result.next()){
a_id=result.getString("A.idAuction_Post");
cat= result.getString("I.category");
name = result.getString("I.name");
size  = result.getString("I.size");
color = result.getString("I.color");
brand = result.getString("I.brand");
status = result.getString("I.status");
sku = result.getString("I.sku");
year = result.getString("I.year");
des = result.getString("I.description");
condition = result.getString("I.con");
end =result.getString("A.end_date");
reserve= result.getString("A.reserve");
buynow= result.getString("A.buynow");
current = result.getString("A.currentbid");

out.print("</th><th>"+ itemid + "</th>");
out.print("<th>"+ cat + "</th>");
out.print("<th>"+ name + "</th>");
out.print("<th>"+ brand + "</th>");
out.print("<th>"+ size + "</th>");
out.print("<th>"+ color + "</th>");
out.print("<th>"+ year + "</th>");
out.print("<th>"+ condition + "</th>");
out.print("<th>"+ end + "</th>");
out.print("<th>"+ buynow + "</th>");
out.print("<th>"+ current + "</th>");
out.print("<th>"+ sku + "</th>");
out.print("<th>"+ reserve + "</th>");


//out.print("<th>"+ des + "</th>"); //make seperate box for this

//out.print("<th><a href='login.jsp?id=" + username + "'>" +name + "</a></th>");
//out.print("<th> $ "+ start + "</th>");
//out.print("<th> $ "+ current + "</th>");
//out.print("<th>"+ end + "</th></tr>");

} 

String str2 = "SELECT  I.category, I.name, I.size, I.color, I.brand ,I.status, I.sku, I.year, I.description, I.con, A.idAuction_Post, A.end_date, A.reserve, A.buynow, A.currentbid FROM Auction_Post A ,Items I   where I.itemid = '"+itemid+"' and I.itemid = A.itemid " ;
ResultSet result2 = stmt.executeQuery(str);

out.print("</table>");
//link to go to somwhere else needed!
out.print("Edit your Auctioned Item ("+itemid+") below: ");
out.print("<form action='Updateitem.jsp' method='POST'>");
out.print("<input type=hidden name=itemid value='"+itemid+"'>");

%>

<br>
<br>
You can edit your KICKS on the bottom: <br>
	

*Change category: <br>

<select name="categories">
<option value="null">-</option>
  <option value="sneakers">sneakers</option>
  <option value="casual">casual</option>
  <option value="dress">dress</option>
  <option value="boots">boots</option>
</select><br/>
*Change name of item: 
<input type='text' placeholder='*name' name='name'/> <br/>
*Change a brand:
<input type='text' placeholder='*brand' name='brand'/> <br/>
*Change color:<br/>
<input type="text" placeholder="Color" name="color"/> <br/>
*Change condition: <br/>
<select name="condition">
<option></option>
  <option value="new">new</option>
  <option value="used">used</option>
  <option value="new_other">new(other)</option>
</select><br/>
Change SKU#:<br/>
<input type='text' placeholder='Sku' name='sku'/> <br/>
Change description(the more info you put the better):<br/>
<input type='text' placeholder='Description' name= 'description'/> <br/>
Change Buynow price:<br/>
<input type="text" min="1" step="any" placeholder='Buynow price' name= 'buynow'/> <br/>
Change Reserve price:<br/>
<input type='text' placeholder='Reserve Price' name= 'reserve'/> <br/>

Want to delete? (Cant delete if there is a bid on the item)
<select name="Delete">
  <option value="No">No</option>
  <option value="Yes">Yes</option>
 </select><br/>
 		
<button>register now</button>
 </form>
 


<br>
</body>
</html>
<br>