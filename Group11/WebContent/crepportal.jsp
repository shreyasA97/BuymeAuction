<html>
<head>
  <title>
Customer Rep Portal
</title>
</head>
<body>
<link rel="stylesheet" href="style.css?v=1.0"/>
<%@ include file="crepnavbar.jsp" %>
<%
    if ((session.getAttribute("name") == null)) {
%>
You are not logged in<br/>
<a href="customerlogin.jsp">Please Login</a>
<%} else {
		%>
		<p> <font size="5"> Customerep Portal </font></p>
		<h1>Welcome <%out.print(session.getAttribute("name")); %></h1>   <!--this will display the username that is stored in the session.-->
		
		
		<%
		}
%>



</body>
</html>
