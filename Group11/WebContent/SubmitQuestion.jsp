
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<!--Import some libraries that have classes that we need -->
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <link rel="stylesheet" href="style.css?v=1.0"/>
<title>Submit Question</title>
</head>
<body>
<%@ page import ="java.sql.*" %>
<%@ page import ="javax.sql.*" %>
<%@ include file="navbar.jsp" %>
<%

String usernamez = session.getAttribute("username").toString();
String titlez = request.getParameter("title");
String quest = request.getParameter("question");


if(titlez.length() == 0 || quest.length() == 0)
{
	out.println("Error! The subject or the question feild can not be empty.<br>");
	out.println("<p><a href= \"ViewQuestionPage.jsp\">Back</a></p>");
	out.print("<p><a href=\"customerportal.jsp\">Back to Customer Portal</a></p>");
}
else
{
	out.print("<p>Thank you. Your question is posted.</p><br>");
	out.print("<p><a href=\"customerportal.jsp\">Back to Customer Portal</a></p>");
	out.print("<p><a href=\"ViewQuestionPage.jsp\">Back to Question Page</a></p>");	


	try{
		//String question=request.getParameter("userid");  
		//String pwd=request.getParameter("password"); 
		//String email=request.getParameter("email"); 
	
		
		//Random rand = new Random();
		//int random1 = rand.nextInt(100000000);
		//int random2 = rand.nextInt(100000000);
		
		ApplicationDB db = new ApplicationDB();
		Connection connection = db.getConnection();	
		
		Timestamp duration = new Timestamp(System.currentTimeMillis());
		
		PreparedStatement ps = connection.prepareStatement("INSERT INTO QnA(question, username, title, questiondate) VALUES (?,?,?,?);");
		
		//Statement st = connection.createStatement();
		
		//session.setAttribute("username", userid);
		
		//String usernamez = (String)session.getAttribute("username");
		
		//String emailz = (String)session.getAttribute("email");
		
		//ps.setInt(1, random1);
		ps.setString(1, quest);
		//ps.setInt(3, Integer.parseInt(request.getParameter("category")));
		ps.setString(2, usernamez);
		ps.setString(3, titlez);
		ps.setTimestamp(4, duration);
		ps.executeUpdate();
		
		connection.close();
		//String auctionID = (String) session.getAttribute("auctionID");
		//String itemID = (String) session.getAttribute("itemID");
		
		//int i=st.executeUpdate("insert into QnA (QuestionID, Question, category, username, itemid) VALUES (?,?,?,?,?);"); 
		} 
		catch (Exception ex) {
				out.print(ex);
		}
}
%>
</body>
</html>