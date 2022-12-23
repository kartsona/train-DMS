<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>

<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<title>Trainz Control Panel</title>
	</head>
<body>
<%out.print("Current user: " + session.getAttribute("current_user")); %>
<br>

<%
	String enumType = null;
	try{
		ApplicationDB db = new ApplicationDB();	
		Connection con = db.getConnection();		
		//Create a SQL statement
		Statement stmt = con.createStatement();
		String temp = "" + session.getAttribute("current_user");
		//Make a SELECT query from the table specified by the 'command' parameter at the index.jsp
		String str = "SELECT employeeType FROM Employees c where c.username = \"" + temp + "\";";
		ResultSet result = stmt.executeQuery(str);
		result.next();
		enumType = result.getString("employeeType");
		result.close();
	}
	catch(Exception e){
		out.println(e);
		out.print("An error has occurred, please return to the Main Page");
	}

if(enumType.equals("admin")){
	out.println("Welcome to Admin Console");
	String testEmployeeType = "customer_rep";
	ApplicationDB db = new ApplicationDB();	
	Connection con = db.getConnection();		
	//Create a SQL statement
	Statement stmt = con.createStatement();
	//Make a SELECT query from the table specified by the 'command' parameter at the index.jsp
	String str = "SELECT * FROM Employees c where c.employeeType = \"" + testEmployeeType + "\";";
	ResultSet result = stmt.executeQuery(str);
	int x = 1;
	out.println("Customer Reps:");
	while(result.next()){
		out.println(x + ": " + result.getString(x));
		x++;
	}
	result.close();
%>

<br>
What else would you like to do?:
	<form method="get" action="top5lines.jsp">
		<input type="submit" value="Top 5 Lines">
	</form>
	<form method="get" action="salesReports.jsp">
		<input type="submit" value="Sales Reports">
	</form>
	<form method="get" action="displayTransitLines.jsp">
		<input type="submit" value="Transit Lines">
	</form>
	<form method="get" action="bestCustomer.jsp">
		<input type="submit" value="Best Customer">
	</form>

<br>
<%}
else{
	out.println("customer rep console");
	ApplicationDB db = new ApplicationDB();	
	Connection con = db.getConnection();		
	//Create a SQL statement
	Statement stmt = con.createStatement();
	//Make a SELECT query from the table specified by the 'command' parameter at the index.jsp
	String str = "SELECT * FROM Customers;";
	ResultSet result = stmt.executeQuery(str);
	int x = 1;
	out.println("Customers:");
	while(result.next()){
		out.println(x + ": " + result.getString(x));
		x++;
	}
	result.close();
	%>
<br>
What else would you like to do?:
	<form method="get" action="editCust.jsp">
		<input type="submit" value="View/Edit/Delete Customers">
	</form>
	<form method="get" action="editSchedule.jsp">
		<input type="submit" value="Edit Schedules">
	</form>
	<form method="get" action="deleteSchedule.jsp">
		<input type="submit" value="Delete Schedules">
	</form>
	<form method="get" action="addSchedule.jsp">
		<input type="submit" value="Add Schedules">
	</form>
	<form method="get" action="displayTransitLines.jsp">
		<input type="submit" value="Transit Lines">
	</form>
	<form method="get" action="bestCustomer.jsp">
		<input type="submit" value="Best Customer">
	</form>
	<form method="get" action="msgPrompt.jsp">
		<input type="submit" value="Messaging Console">
	</form>
<br>

<%
ApplicationDB db1 = new ApplicationDB();	
Connection con1 = db1.getConnection();		
//Create a SQL statement
Statement stmt1 = con1.createStatement();
//Make a SELECT query from the table specified by the 'command' parameter at the index.jsp
String str1 = "SELECT * FROM reservation;";
ResultSet result1 = stmt1.executeQuery(str1);
int x1 = 1;
out.println("Reservations:");
while(result.next()){
	out.println(x1 + ": " + result1.getString(x1));
	x1++;
}
result1.close(); %>

<br>
What else would you like to do?:
	<form method="get" action="editReservation.jsp">
		<input type="submit" value="Edit Reservations">
	</form>
	<form method="get" action="deleteReservation.jsp">
		<input type="submit" value="Delete Reservations">
	</form>
	<form method="get" action="addReservation.jsp">
		<input type="submit" value="Add Reservations">
	</form>
<br>
	
<%}%>

<br>
	<form method="get" action="logout.jsp">
		<input type="submit" value="Logout">
	</form>
<br>
	<form method="get" action="landing.jsp">
		<input type="submit" value="Return to Main Page">
	</form>

</body>

</html>