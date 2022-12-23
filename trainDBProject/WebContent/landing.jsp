<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<title>Trainz</title>
	</head>
<body>
Welcome to Trainz!
<%out.print("Current user: " + session.getAttribute("current_user")); %>
<br>

<%if(session.getAttribute("current_user") == null){ %>

<br>
Login:

<form method="get" action="login.jsp">
	<table>
		<tr>    
			<td>Username:</td><td><input type="text" name="login_username"></td>
		</tr>
		<tr>
			<td>Password:</td><td><input type="text" name="login_password"></td>
		</tr>
	</table>
	<input type="submit" value="Login">
</form>

<br>
or
<br>
<br>
Register for an Account:

<form method="get" action="register.jsp">
	<table>
		<tr>    
			<td>Username:</td><td><input type="text" name="username"></td>
		</tr>
		<tr>
			<td>Password:</td><td><input type="text" name="password"></td>
		</tr>
		<tr>
			<td>Email Address:</td><td><input type="text" name="emailAddress"></td>
		</tr>
		<tr>
			<td>First Name:</td><td><input type="text" name="firstName"></td>
		</tr>
		<tr>
			<td>Last Name:</td><td><input type="text" name="lastName"></td>
		</tr>
	</table>
	<input type="submit" value="Register">
</form>
<%} %>


<%if(session.getAttribute("accountType") == "employee"){ %>		
	<br>
	<form method="get" action="controlPanel.jsp">
		<input type="submit" value="Go to Control Panel">
	</form>
			
<% }%>

<%if(session.getAttribute("accountType") == "customer"){ %>		
	<br>
	What would you like to do?:
	<form method="get" action="landing.jsp">
		<input type="submit" value="List Train Schedules">
	</form>
	<form method="get" action="landing.jsp">
		<input type="submit" value="Make a Reservation">
	</form>
	<form method="get" action="landing.jsp">
		<input type="submit" value="List Reservations">
	</form>
			
<% }%>

<br>
	<form method="get" action="logout.jsp">
		<input type="submit" value="Logout">
	</form>
<br>

</body>

</html>