<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<html>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" type="text/css" href="css/index.css" />
    <link rel="stylesheet" href="style.css?v=1.0"/>
<title>Similar Items</title>
<head></head>
<body>
	<h3>Similar Items</h3>
	<h4>similar items are determined by color and category</h4>
	<%
		try {
			ApplicationDB db = new ApplicationDB();
			Connection con = db.getConnection();
			Statement stmt = con.createStatement();
			int jewelryID = Integer.parseInt(request.getParameter("id"));
			String category = request.getParameter("category");
			String color = request.getParameter("color");
			
			String str = "SELECT itemid, name, category, color, brand,  FROM Items where items.category = '"
					+ category + "'and items.color = '" + color + "';";
			ResultSet result = stmt.executeQuery(str);

			if (result.next()) {
	%>
	<table align="center" border="3">
		<tr>
			<th>JID</th>
			<th>Name</th>
			<th>Category</th>
			<th>Color</th>
			<th>Brand</th>
		</tr>
		<%
			do {
		%>

		<tr>
			<td align="center">
				<%
					out.println(result.getInt("itemid"));
				%>
			</td>
			<td align="center">
				<%if(jewelryID==result.getInt("itemid")){
					out.println(result.getString("name")+"(This is the current item you're viewing)");
					
				}else{
					out.println(result.getString("name"));
				}
				%>
			</td>
			<td align="center">
				<%
					out.println(result.getString("category"));
				%>
			</td>
			<td align="center">
				<%
					out.println(result.getString("color"));
				%>
			</td>
			<td align="center">
				<%
					out.println(result.getString("brand"));
				%>
			</td>
			
		</tr>
		<%
			} while (result.next());
		%>
	</table>
	<%
		} else {
	%>
	<h3>No Items To show</h3>
	<%
		}
			con.close();
		}

		catch (Exception ex) {
			out.println(ex);
			out.println("error");
		}
	%>
	<p>
		<a href='search.jsp'>Back to search</a>
	</p>
	<p>
		<a href='logout.jsp'>Log out</a>
	</p>
</body>
</html>