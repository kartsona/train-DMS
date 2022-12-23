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
		
		String reservation_num = request.getParameter("reservation_num");
		String del_res = "DELETE FROM Reservations WHERE reservation_num = \"" + reservation_num + "\";";
		System.out.println(del_res);
		int result = stmt.executeUpdate(del_res);
		con.close();
		out.print("Delete succeeded!");
		
	} catch (Exception ex) {
		out.print(ex);
		out.print("Delete failed :()");
	}%>
	
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