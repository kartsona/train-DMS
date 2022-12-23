<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<!--Import some libraries that have classes that we need -->
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<%
	try {
	
		//Get the database connection
		ApplicationDB db = new ApplicationDB();	
		Connection con = db.getConnection();
		//Create a SQL statement
		Statement stmt = con.createStatement();
		//Get parameters from the HTML form at the HelloWorld.jsp
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		String first = request.getParameter("firstName");
		String last = request.getParameter("lastName");
		String email = request.getParameter("emailAddress");
		
		//Make an insert statement for the Sells table:
		String insert = "INSERT INTO Customers(username, password, emailAddress, firstName, lastName)"
				+ "VALUES (?, ?, ?, ?, ?)";
		//Create a Prepared SQL statement allowing you to introduce the parameters of the query
		PreparedStatement ps = con.prepareStatement(insert);
		//Add parameters of the query. Start with 1, the 0-parameter is the INSERT statement itself
		ps.setString(1, username);
		ps.setString(2, password);
		ps.setString(3, email);
		ps.setString(4, first);
		ps.setString(5, last);
		//Run the query against the DB
		ps.executeUpdate();
		//Close the connection. Don't forget to do it, otherwise you're keeping the resources of the server allocated.
		con.close();
		out.print("Registration Complete! :)");
		
	} catch (Exception ex) {
		out.print(ex);
		out.print("Registration Failed :(");
	}
	
	
	
%>

		<form method="get" action="landing.jsp">
			<input type="submit" value="Back to Main Page">
		</form>

</body>
</html>