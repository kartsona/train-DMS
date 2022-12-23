<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<!--Import some libraries that have classes that we need -->
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>

 <%-- <!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Message Display</title>
</head>
--%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Messaging</title>
</head>
<body>
<h3>Message a Customer Representative</h3> 

<%
	
 	try {
  		//Get the database connection
  		ApplicationDB db = new ApplicationDB();	
  		Connection con = db.getConnection();
  		//Create a SQL statement
  		Statement stmt = con.createStatement();
  		//Get parameters from the HTML form at the message-space.html
  		String name =  (String)request.getParameter("user");
		String message = request.getParameter("message");
 		String subject = request.getParameter("subject");	
  		
 		//Make an insert statement for the Messages table:
 		String insert = "INSERT INTO Messages(sender, responder, title, message)" + "VALUES (?, ?, ?, ?)";
 		//Create a Prepared SQL statement allowing you to introduce the parameters of the query
 		PreparedStatement ps = con.prepareStatement(insert);
 		//Add parameters of the query. Start with 1, the 0-parameter is the INSERT statement itself
 		ps.setString(1, name);
 		ps.setString(2, "No response");
 		ps.setString(3, subject);
 		ps.setString(4, message);
 		out.print(" Message has been received. Customer service will response as soon as possible " + "<br/><br/>");
 		//Run the query against the DB
 		ps.executeUpdate();
 		//Close the connection. Don't forget to do it, otherwise you're keeping the resources of the server allocated.
 		con.close();
 	} catch (Exception ex) {
 		out.print(ex);
 		out.print("Insert failed :()");
 	}
 %>
			

</body>
<body>
	<form method="get" action="message-prompt.jsp">
		<input type="submit" value="Back">
	</form>
</body>
</html>