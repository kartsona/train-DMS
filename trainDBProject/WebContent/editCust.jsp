<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<!--Import some libraries that have classes that we need -->
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>EDIT</title>
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
		String selecteduser = request.getParameter("editselecteduser");
		
		//Make an insert statement for the Sells table:
		String str = "SELECT * FROM Customers c where c.username = \"" + selecteduser + "\";";
		ResultSet result = stmt.executeQuery(str);
		result.next();
		String username = result.getString("username");
		pageContext.setAttribute("username", username);
		String password = result.getString("password");
		pageContext.setAttribute("password", password);
		String first = result.getString("first_name");
		pageContext.setAttribute("first", first);
		String last = result.getString("last_name");
		pageContext.setAttribute("last", last);
		String email = result.getString("email");
		pageContext.setAttribute("email", email);
		int telephone = result.getInt("telephone");
		pageContext.setAttribute("telephone", telephone);
		String address = result.getString("address");
		pageContext.setAttribute("address", address);
		int zipcode = result.getInt("zipcode");
		pageContext.setAttribute("zipcode", zipcode);
		String city = result.getString("city");
		pageContext.setAttribute("city", city);
		String state = result.getString("state");
		pageContext.setAttribute("state", state);
		//Close the connection. Don't forget to do it, otherwise you're keeping the resources of the server allocated.
		con.close();
		//out.print("Insert succeeded!");
		
	} catch (Exception ex) {
		out.print(ex);
		out.print("Insert faileda :()");
	}
%>

	
	Update User Information
	<br>
	<form method="post" action="update.jsp">
	<table>
	<tr>    
	<td>User Name</td><td><input type="text" name="username" value="${username}"></td>
	</tr>
	<tr>
	<td>Email</td><td><input type="text" name="email" value="${email}"></td>
	</tr>
	<tr>
	<td>First Name</td><td><input type="text" name="first_name" value="${first}"></td>
	</tr>
	<tr>
	<td>Last Name</td><td><input type="text" name="last_name" value="${last}"></td>
	</tr>
	<tr>
	<td>Telephone</td><td><input type="text" name="phone" value="${telephone}"></td>
	</tr>
	<tr>
	<td>Address</td><td><input type="text" name="address" value="${address}"></td>
	</tr>
	<tr>
	<td>Zip Code</td><td><input type="text" name="zipcode" value="${zipcode}"></td>
	</tr>
	<tr>
	<td>City</td><td><input type="text" name="city" value="${city}"></td>
	</tr>
	<tr>
	<td>State</td><td><input type="text" name="state" value="${state}"></td>
	</tr>
	<tr>
	<td>Choose a password</td><td><input type="text" name="password" value="${password}"></td>
	</tr>
	</table>
	<input type="submit" value="Update User Info">
	</form>
<br>
</body>
</html>