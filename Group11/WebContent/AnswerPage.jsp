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
<title>answer</title>
</head>
<body>
<%//int QuestionId = Integer.parseInt(request.getParameter("QuestionId"));
//ApplicationDB db = new ApplicationDB();	
//Connection con = db.getConnection();

//Statement stmt = con.createStatement();

//String questId = "SELECT q.QuestionId FROM QnA as q;";
//ResultSet result = stmt.executeQuery(questId);

//String QuestionId = result.getString("q.QuestionId");

//int QuestionId = Integer.parseInt(quesid);
int questionId = Integer.parseInt(request.getParameter("questionId")); 
//out.print("question id is:  " + "<th>" +questionId+ "</th>");
%>
<form method="post" action="SubmitAnswer.jsp?questionId=<%=questionId%>">
<table border="4">
<tr>
<td> <font size="+3">Answer to Question:</font></td><td><textarea name="answer" rows ="10" > </textarea></td>
</tr>

</table>

<br>
<input type="submit" value="submit" class="button">
</form>
</body>
</html>


