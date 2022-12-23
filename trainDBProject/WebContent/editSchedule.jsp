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
		//Get parameters from the HTML form at the HelloWorld.jsp
		String selectedSched = request.getParameter("editselectedSched");
		
		//Make an insert statement for the Sells table:
		String str = "SELECT * FROM Schedule s where s.transit_name = \"" + selectedSched + "\";";
		ResultSet result = stmt.executeQuery(str);
		result.next();
		String transit_name = request.getParameter("transit_name");
		pageContext.setAttribute("transit_name", transit_name);
		String train = request.getParameter("train");
		pageContext.setAttribute("train", train);
		String origin = request.getParameter("origin");
		pageContext.setAttribute("origin", origin);
		String destination = request.getParameter("destination");
		pageContext.setAttribute("destination", destination);
		String seats_available = request.getParameter("seats_available");
		pageContext.setAttribute("seats_available", seats_available);
		String stop = request.getParameter("stop");
		pageContext.setAttribute("stop", stop);
		String departure = request.getParameter("departure");
		pageContext.setAttribute("departure", departure);
		String arrival = request.getParameter("arrival");
		pageContext.setAttribute("arrival", arrival);
		String travel_time = request.getParameter("travel_time");
		pageContext.setAttribute("travel_time", travel_time);
		String travel_fare = request.getParameter("travel_fare");
		pageContext.setAttribute("travel_fare", travel_fare);
		String is_delayed = request.getParameter("is_delayed");
		pageContext.setAttribute("is_delayed", is_delayed);
		//Close the connection. Don't forget to do it, otherwise you're keeping the resources of the server allocated.
		con.close();
	} catch (Exception ex) {
		out.print(ex);
		out.print("Insert faileda :()");
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