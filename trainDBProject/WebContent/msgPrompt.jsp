<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<!--Import some libraries that have classes that we need -->
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Message Display</title>
</head>
<body>

<h3>Message a Customer Representative</h3> 

<br>
	<form method="get" action="insert-message.jsp">
		<table>
			<tr>    
				<td>Username:</td><td><input type="text" name="user"></td>
			</tr>
			<tr>    
				<td>Message Subject:</td><td><input type="text" name="subject"></td>
			</tr>
			<tr>
				<td>Message</td><td><input type="text" name="message"></td>
			</tr>
		</table>
		<input type="submit" value="Send">
	</form>
<br>

	<form method="get" action="message-search.jsp">
		<table>
			<tr>    
				<td>Search Posts: </td><td><input type="text" name="search_term"></td>
			</tr>
		</table>
		<input type="submit" value="Search">
	</form>

<h3>Past Messages:</h3>
	<% 
		try {
			ApplicationDB db = new ApplicationDB();	
			Connection con = db.getConnection();
	
			//Create a SQL statement
			Statement stmt = con.createStatement();
			
		
			String str = "SELECT * FROM Messages m";
	 		ResultSet results = stmt.executeQuery(str);
			
			while(results.next()){
				String sender = results.getString("sender");
				String r = results.getString("responder");
				String title = results.getString("title");
				String mess= results.getString("message");
				
				out.println("Sent by: " + sender);
				out.print("<br/>");
				out.println("Topic: " + title);
				out.print("<br/>");
				out.println("Message: " + mess);
				out.print("<br/>");
				out.println("Response: " + r);
				out.print("<br/>" + "<br/>");
			}
			
			
		}
		catch (Exception e){
			out.print(e);
	 		out.print("Messages can't be loaded ");
		}
		
	%>    


</body>
</html>