
<html>
<head>
  <title>
Admin Portal
</title>
</head>
<body>
    <link rel="stylesheet" href="style.css?v=1.0"/>
<%@ include file="adminnavbar.jsp" %>
<p> <font size="5"> </font></p>
	<h1>Hello Admin!</h1>

<p> <a href="managecrepaccount.jsp">Manage Customer Representative Account</a></p>
<br>
<form method="get" action="salesReports.jsp" name="salesReport">
<input type="submit" value="Generate Sales Report:" class="button">
</form>
<br>


</body>
</html>
