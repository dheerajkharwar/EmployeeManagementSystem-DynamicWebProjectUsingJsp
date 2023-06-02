<%@page import="com.ems.DbConnection"%>
<%@page import="com.mysql.cj.protocol.Resultset"%>
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Employee List</title>
</head>
<style>

table {
	border: 1px solid black;
	margin: auto;
	width: 85%;
	border-collapse: collapse;
}

th, td {
	width: 15%;
	border: 1px solid white;
}

tbody td:last-child {
	text-align: center;
}

tbody td:not(:last-child) {
	padding-left: 10px;
}

tbody td {
	padding-top: 10px;
	padding-bottom: 10px;
	background-color: infotext;
	color: white;
}

th {
	padding-top: 15px;
	padding-bottom: 15px;
	background-color: olive;
}

button {
	cursor: pointer;
}
</style>

<body>
	<%
	long total_emp = 0;
	String tmpStr = "";
	Connection con = DbConnection.getConnection("ems");
	Statement stmt = null;

	try {
		// create a SQL statement
		stmt = con.createStatement();
		String query = "Select *from Employee";
		ResultSet rs = stmt.executeQuery(query);

		String m="Male";
		String f="Female";
		while (rs.next()) {
			total_emp +=1;
			tmpStr += "<tr>" + "<td>" + rs.getInt(1) + "</td>" + "<td>" + rs.getString(2) + "</td>" + "<td>"
			+ rs.getString(3) + "</td>" + "<td>" + (rs.getInt(4)==1? m :f) + "</td>" + "<td>" + rs.getDouble(5) + "</td>"
			+ "<td>" + rs.getDate(6) + "</td>" + "<td><form method=\"post\" action=\"DeleteEmployee\">"
			+ "<button type=\"submit\" name=\"emp_id\" value=\"" + rs.getInt(1) + "\">" + "Delete</button>"
			+ "</form></td></tr>";
		}
	} catch (Exception ex) {
		ex.printStackTrace();
	} finally {
		if (con != null) {
			try {
		con.close();
			} catch (SQLException ex) {
		ex.printStackTrace();
			}
		}
	}
	%>
	<a style="float: right; margin-right: 10%" href="Employee-Insert.jsp">Add
		Employee</a>
		<h5 style=" margin-left: 10%;">Total Employees = <%=total_emp%></h5>
	<h1 style="text-align:center">Employee List</h1>
	<table>
		<thead>
			<tr>
				<th>Employee Id</th>
				<th>Name</th>
				<th>Address</th>
				<th>Gender</th>
				<th>Salary</th>
				<th>Birth Date</th>
				<th>Action</th>
			</tr>
		</thead>
		<tbody>
			<%
			out.print(tmpStr);
			%>

		</tbody>
	</table>
</body>
</html>