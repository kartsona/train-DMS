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
		String selectedRes = request.getParameter("editselectedRes");
		
		//Make an insert statement for the Sells table:
		String str = "SELECT * FROM Reservations r where r.Reservation_number = \"" + selectedRes + "\";";
		ResultSet result = stmt.executeQuery(str);
		result.next();
		int res_num = result.getInt("reservation_number");
		pageContext.setAttribute("res_num", res_num);
		String username = result.getString("username");
		pageContext.setAttribute("username", username);
		String date = result.getString("date");
		pageContext.setAttribute("date", date);
		double total_fare = result.getDouble("total_fare");
		pageContext.setAttribute("total_fare", total_fare);
		String customer_rep = result.getString("customer_rep");
		pageContext.setAttribute("customer_rep", customer_rep);
		double fee = result.getDouble("fee");
		pageContext.setAttribute("fee", fee);
		String transit_name = result.getString("transit_name");
		pageContext.setAttribute("transit_name", transit_name);
		//Close the connection. Don't forget to do it, otherwise you're keeping the resources of the server allocated.
		con.close();
	} catch (Exception ex) {
		out.print(ex);
		out.print("Insert faileda :()");
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