<%@ page language="java" import="com.src.service.*, com.src.model.*"
	contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    int id = Integer.parseInt(request.getParameter("id"));
    DonorServiceInterface dsi = new DonorServiceImpl();
    Donor donor = dsi.getDonorById(id);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Update Donor</title>
</head>
<body>
	<h2>Update Donor</h2>
	<form action="updateDonor" method="post">
		<input type="hidden" name="id" value="<%= donor.getDonorId() %>">
		Name: <input type="text" name="name"
			value="<%= donor.getDonorName() %>" required><br>
		<br> Email: <input type="email" name="email"
			value="<%= donor.getEmail() %>" required><br>
		<br> Mobile: <input type="text" name="mobile"
			value="<%= donor.getPhone() %>" required><br>
		<br> Address: <input type="text" name="address"
			value="<%= donor.getAddress() %>" required><br>
		<br> <input type="submit" value="Update Donor">
	</form>
</body>
</html>
