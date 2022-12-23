<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Top 5 Most Active Lines</title>
</head>
<body>
	<%
		try {
			//Get the database connection
			ApplicationDB db = new ApplicationDB();	
			Connection con = db.getConnection();	
			
			Statement stmt = con.createStatement();
			String str = "SELECT Transit_name, count(*) as c FROM Reservation GROUP BY Transit_name ORDER BY c DESC LIMIT 5;";
			//Run the query against the database.
			ResultSet result = stmt.executeQuery(str);
			out.print("<br>");
			out.print("<br>");
			out.println("Top 5 Most Active Lines");
			out.print("<table>");
			//make a row
			out.print("<tr>");
			//make a column
			out.print("<td>");
			//print out column header
			out.print("Transit Name");
			out.print("</td>");
			//make a column
			out.print("<td>");
			out.print("Total Amount of Sales");
			out.print("</td>");
			out.print("</tr>");
			//parse out the results
			while (result.next()) {
				//make a row
				out.print("<tr>");
				//make a column
				out.print("<td>");
				//Print out current bar name:
				out.print(result.getString("Transit_name"));
				out.print("</td>");
				out.print("<td>");
				//Print out current beer name:
				out.print(result.getString("c"));
				out.print("</td>");
				out.print("</tr>");
			}
			out.print("</table>");
			//close the connection.
			con.close();
		} catch (Exception e) {
		}
	%>

</body>
</html>