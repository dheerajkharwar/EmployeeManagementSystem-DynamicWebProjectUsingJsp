<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Employee Insert Page</title>
</head>
<style>
table {
	border: 1px solid black;
	margin: auto;
	width: 75%;
	height: 75vh;
}

input {
	border-radius: 5px;
	width: 90%;
	height: 50%;
}
</style>
<body>
	<%
	String msg;
	if (request.getAttribute("msg") == null) {
		msg = "";
	} else {
		msg = request.getAttribute("msg").toString();
	}
	%>
	<b style="color: red; text-align: center;"><%=msg%></b>
	<h1 style="text-align: center;">Submit Employee Data</h1>
	<form action="InsertServlet" method="post"
		onsubmit="return validateEmp()">
		<table>
			<tr>
				<th>EmployeId:</th>
				<td><input type="text" name="emp_id" id="emp_id" required></td>
			</tr>
			<tr>
				<th>Name:</th>
				<td><input type="text" name="name" id="name" required></td>
			</tr>
			<tr>
				<th>Address:</th>
				<td><textarea rows="5" cols="10" name="address" id="address" required></textarea></td>
			</tr>
			<tr>
				<th>Gender:</th>
				<td>
				<input type="radio" id="male" name="gender"value="1" style="width:15px;height:12px;" required>
				<label for="male">Male</label><br>
				<input type="radio" id="female" name="gender" value="2" style="width:15px;height:12px;" required>
				<label for="female">Female</label>
				</td>
			</tr>
			<tr>
				<th>Salary:</th>
				<td><input type="text" name="salary" id="salary" required></td>
			</tr>
			<tr>
				<th>Birth Date:</th>
				<td><input type="date" name="birthdate" id="birthdate"
					style="text-align: center;" required></td>
			</tr>
			<tr>
				<td></td>
				<td style="text-align: right;"><input type="submit"
					value="Submit"
					style="width: 20%; height: 60%; background-color: black; color: white; cursor: pointer; border-radius: 5px; margin-right: 70px;">
				</td>
			</tr>
		</table>
	</form>
	<script src="resources/script.js"></script>
</body>
</html>