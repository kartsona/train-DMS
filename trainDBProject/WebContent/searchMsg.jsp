<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<!--Import some libraries that have classes that we need -->
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<h2>Search Results:</h2>

	<%
		try {
				ApplicationDB db = new ApplicationDB();	
		  		Connection con = db.getConnection();
	
		  		//Create a SQL statement
		  		Statement stmt = con.createStatement();
		  		String term = request.getParameter("search_term");
		  		
		  		String search = "SELECT * FROM Messages m WHERE m.message LIKE ? or m.title LIKE ?";
		  		PreparedStatement pre_statement = con.prepareStatement(search);
		  		
		  		pre_statement.setString(1,  "%" + term + "%");
		  		pre_statement.setString(2,  "%" + term + "%");
		  		
		  		ResultSet searchRS = pre_statement.executeQuery();
		  		
		  		while(searchRS.next()){
		  			String sender = searchRS.getString("sender");
					String r = searchRS.getString("responder");
					String title = searchRS.getString("title");
					String mess= searchRS.getString("message");
					
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
			catch(Exception e){
			
				out.println("No reseults found");
			}
	%>
</body>
<body>
	<form method="get" action="message-prompt.jsp">
		<input type="submit" value="Back">
	</form>
</body>
</html>