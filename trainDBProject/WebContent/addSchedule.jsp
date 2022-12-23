<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<!--Import some libraries that have classes that we need -->
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html>
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
		
		String transit_name = request.getParameter("transit_name");
		String train = request.getParameter("train");
		String origin = request.getParameter("origin");
		String destination = request.getParameter("destination");
		int seats_available = Integer.parseInt("seats_available");
		int stops = Integer.parseInt("stops");
		String departure = request.getParameter("departure");
		String arrival = request.getParameter("arrival");
		String travel_time = request.getParameter("travel_time");
		Double travel_fare = Double.parseDouble("travel_fare");
		String is_delayed = request.getParameter("is_delayed");
		String add_sched = "INSERT INTO Schedules(sched_info) + VALUES(?)";
		
		System.out.println(add_sched);
		int result = stmt.executeUpdate(add_sched);
		con.close();
		out.print("Add succeeded!");
		
	}catch (Exception e) {
		out.print(e);
		out.print("Add failed :()");
	}%>
			Update Reservation
	<br>
	<form method="post" action="updateSched.jsp">
	<table>
	<tr>    
	<td>Transit name</td><td><input type="text" name="transit_name" value="${transit_name}"></td>
	</tr>
	<tr>
	<td>Train</td><td><input type="text" name="train" value="${train}"></td>
	</tr>
	<tr>
	<td>Origin</td><td><input type="text" name="origin" value="${origin}"></td>
	</tr>
	<tr>
	<td>Destination</td><td><input type="text" name="destination" value="${destination}"></td>
	</tr>
	<tr>
	<td>Seats Available</td><td><input type="text" name="seats_available" value="${seats_available}"></td>
	</tr>
	<tr>
	<td>Stops</td><td><input type="text" name="stops" value="${stops}"></td>
	</tr>
	<tr>
	<td>Departure</td><td><input type="text" name="departure" value="${departure}"></td>
	</tr>
	<tr>
	<td>Arrival</td><td><input type="text" name="arrival" value="${arrival}"></td>
	</tr>
	<tr>
	<td>Travel Time</td><td><input type="text" name="travel_time" value="${travel_time}"></td>
	</tr>
	<tr>
	<td>Travel Fare</td><td><input type="text" name="travel_fare" value="${travel_fare}"></td>
	</tr>
	<tr>
	<td>isDelayed</td><td><input type="text" name="is_delayed" value="${is_delayed}"></td>
	</tr>
	</table>
	<input type="submit" value="Update Schedule Info">
	</form>
</body>
</html>