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
<title>answerPage</title>
</head>
<body>
<%
String email_username = ""+session.getAttribute("username");
//String idforumz = ""+session.getAttribute("idforum"); 

try 
{
ApplicationDB db = new ApplicationDB();	
Connection con = db.getConnection();
Statement stmt = con.createStatement();

String answer = request.getParameter("answer");
//String question = request.getParameter("question");

int questionId = Integer.parseInt(request.getParameter("questionId"));
//out.print("questionid is: " + questionId);
//String idforumz = request.getParameter("idforum");
//int idforumz = Integer.parseInt(request.getParameter("idforum"));

if (answer.isEmpty()){
out.print("<p>You did not input any answer</p>");
} else {
String insertCR = "UPDATE QnA set answer ='"+answer+"', cr_email ='"+email_username+"' WHERE questionId='"+questionId+"'";
PreparedStatement ps = con.prepareStatement(insertCR);
ps.executeUpdate();
out.print("<p>You answered the question!</p>");
//out.print("id forum is" + idforum);
//out.print("user name is" + email_username);
//out.print("question is" + question);
} 
con.close();
} catch (Exception x) {
	out.print(x);
}
%>
<p><a href='crAnswerPage.jsp'>Back to Answer Page</a></p>
<p><a href='crepportal.jsp'>Back to Customer Representative Portal</a></p>
</form>
</body>
</html>

