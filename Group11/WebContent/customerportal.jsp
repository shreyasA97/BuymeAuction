<html>
<head>
  <title>
Customer Portal
</title>
<link rel="stylesheet" href="style.css?v=1.0"/>
</head>
<body>



		<%@ include file="navbar.jsp" %>
		<h1>Welcome <%out.print(session.getAttribute("name")); %></h1>   <!--this will display the first name that is stored in the session.-->
		


</body>
</html>
