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
		String del_sched = "DELETE FROM Schedules WHERE transit_name = \"" + transit_name + "\";";
		System.out.println(del_sched);
		int result = stmt.executeUpdate(del_sched);
		con.close();
		out.print("Delete succeeded!");
		
	} catch (Exception ex) {
		out.print(ex);
		out.print("Delete failed :()");
	}%>
</body>
</html>