<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
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
		
		int res_num = Integer.parseInt("reservation_num");
		String username = request.getParameter("username");
		String date = request.getParameter("date");
		Double total_fare = Double.parseDouble("total_fare");
		String customer_rep = request.getParameter("customer_rep");
		Double fee = Double.parseDouble("fee");
		String transit_name = request.getParameter("transit_name");
		String add_res = "INSERT INTO Reservations(reservation_num) + VALUES(?)";
		
		System.out.println(add_res);
		int result = stmt.executeUpdate(add_res);
		con.close();
		out.print("Add succeeded!");
		
	}catch (Exception e) {
		out.print(e);
		out.print("Add failed :()");
	}%>
	Update Reservation
	<br>
	<form method="post" action="updateRes.jsp">
		<table>
		<tr>    
		<td>Reservation Number</td><td><input type="text" name="res_num" value="${res_num}"></td>
		</tr>
		<tr>
		<td>User Name</td><td><input type="text" name="username" value="${username}"></td>
		</tr>
		<tr>
		<td>Date</td><td><input type="text" name="date" value="${date}"></td>
		</tr>
		<tr>
		<td>Total Fare</td><td><input type="text" name="total_fare" value="${total_fare}"></td>
		</tr>
		<tr>
		<td>Customer Rep</td><td><input type="text" name="customer_rep" value="${customer_rep}"></td>
		</tr>
		<tr>
		<td>Fee</td><td><input type="text" name="fee" value="${fee}"></td>
		</tr>
		<tr>
		<td>Transit Name</td><td><input type="text" name="transit_name" value="${transit_name}"></td>
		</tr>
		</table>
		<input type="submit" value="Update Reservation Info">
	</form>
	
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
</html>