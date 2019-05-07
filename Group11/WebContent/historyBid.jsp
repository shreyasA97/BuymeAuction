<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" type="text/css" href="css/index.css" />
    <link rel="stylesheet" href="style.css?v=1.0"/>
<title>Bid History</title>
</head>
<body>

<%
int itemid = Integer.parseInt(request.getParameter("id"));%>

<form method ="post">
<%
try {
	
	ApplicationDB db = new ApplicationDB();	
	Connection con = db.getConnection();
	Statement stmt = con.createStatement();

	String q = "select BidID, bidamount from Bids where itemid =" + itemid + ";";
	ResultSet result = stmt.executeQuery(q);
	if(result.next())
	{%>
	<table align="center" border="3">
			<tr>
				<th>BidID</th>
				<th>Bid Amount</th>
			</tr><%
				do{%>
				
				<tr>
				<td align = "center"><% out.println(result.getInt("BidID"));%></td>
			
				<td align = "center"><% out.println(String.format("$%.2f",result.getFloat("bidamount")));%></td>
				</tr><%
				}while(result.next());%>
			</table><%
	}
   }
   catch (Exception ex)
{
out.println(ex);
out.println("error");
}

%></form>
</body>
</html>