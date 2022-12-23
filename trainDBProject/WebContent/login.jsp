<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>

<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<title>User Login</title>
	</head>
	<body>
		<% 
			String accountType = null;
			try {
	
			//Get the database connection
			ApplicationDB db = new ApplicationDB();	
			Connection con = db.getConnection();		
			//Create a SQL statement
			Statement stmt = con.createStatement();
			//Get the selected radio button from the index.jsp
			String login_username = request.getParameter("login_username");
			String login_password = request.getParameter("login_password");
			//Make a SELECT query from the table specified by the 'command' parameter at the index.jsp
			String str = "SELECT * FROM Customers c where c.username = \"" + login_username + "\" and c.password = \"" + login_password + "\";";
			ResultSet result = stmt.executeQuery(str);
			accountType = "customer";
			
			if(result.next() == false){
				str = "SELECT * FROM Employees c where c.username = \"" + login_username + "\" and c.password = \"" + login_password + "\";";
				result = stmt.executeQuery(str);
				result.next();
				accountType = "employee";
			}
			
			String current_user = result.getString("username");
			result.close();
			session.setAttribute("current_user", current_user);
			out.print("You have been logged in. Current user is " + session.getAttribute("current_user"));
			session.setAttribute("accountType", accountType);
		%>
			<form method="get" action="logout.jsp">
				<input type="submit" value="Logout">
				
			</form>
			
		<%} catch (Exception e) {
			session.removeAttribute("current_user");
			out.print("Login failed please return to previous page and try again");
		}%>
		
		<%if(accountType == "employee"){ %>
			
		<br>
		<form method="get" action="controlPanel.jsp">
			<input type="submit" value="Go to Control Panel">
		</form>
			
		<% }%>
			
		<br>
			<form method="get" action="landing.jsp">
				<input type="submit" value="Return to Main Page">
			</form>
		<br>
	
	</body>
	
</html>