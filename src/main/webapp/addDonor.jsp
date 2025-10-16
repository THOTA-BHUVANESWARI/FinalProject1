<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Add Donor</title>
</head>
<body>
	<h2>Add Donor</h2>
	<form action="addDonor" method="get">
		Name: <input type="text" name="name" required><br>
		<br> Email: <input type="email" name="email" required><br>
		<br> Mobile: <input type="text" name="phone" required><br>
		<br> Address: <input type="text" name="address" required><br>
		<br> <input type="submit" value="Save Donor">
	</form>
</body>
</html>
