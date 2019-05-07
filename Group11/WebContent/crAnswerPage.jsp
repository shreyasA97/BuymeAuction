<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" type="text/css" href="css/index.css"/>
<title>crForum</title>
</head>
<body>
<%@ include file="crepnavbar.jsp" %>
<h1>Welcome <%out.print(session.getAttribute("username")); %></h1>
<b>ALL QUESTIONS</b>
<br>
<br>
<table border='4'>
<tr>
<th>Customer Rep Email</th>
<th>Customer Username</th>
<th>Subject</th>
<th>Question</th>
<th>Answer</th>
<th>Date Posted</th>
</tr>
<% 
ApplicationDB db = new ApplicationDB();	
Connection con = db.getConnection();
Statement stmt = con.createStatement();

String str = "SELECT q.questionId, q.cr_email, q.username, q.title, q.question, q.answer, q.questiondate FROM QnA as q;";
ResultSet result = stmt.executeQuery(str);

while(result.next())
{
int questionId = result.getInt("q.questionId");
String cr_email= result.getString("q.cr_email");
String username = result.getString("q.username");
String title = result.getString("q.title");
String question = result.getString("q.question");
String answer = result.getString("q.answer");
String questionDate = result.getString("q.questiondate");
if(cr_email ==null){
out.print("<tr><th> No Customer Rep answered this question</th>");
}
else{
out.print("<tr><th>" +cr_email+ "</th>");
}
out.print("<th>" +username+ "</th>");
out.print("<th>" + title +"</th>");
out.print("<th>"+ question + "</th>");
if(answer ==null){
out.print("<th> <a href='AnswerPage.jsp?questionId=" + questionId + "'>Answer this question</th>");
//session.setAttribute("question", idforum);
}
else{
out.print("<th>"+ answer + "</th>");
}
out.print("<th>"+ questionDate + "</th></tr>");
				
}
con.close();
%>
</table>
<br>
<br>
<p><a href='crepportal.jsp'>Back to Customer Representative Portal</a></p>
<p><a href='logout.jsp'>Log out</a></p>

</body>
</html>


