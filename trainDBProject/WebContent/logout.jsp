<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<title>User Login</title>
	</head>
	<body>
		<% try {
			session.removeAttribute("current_user");	
		%>
			
		<%} catch (Exception e) {
		}
		out.print("You have been logged out.");
		%>
	
		<br>
			<form method="get" action="landing.jsp">
				<input type="submit" value="Return to Main Page">
			</form>
		<br>
	
	</body>
	
</html>