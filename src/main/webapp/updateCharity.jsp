<%@ page language="java" import="com.src.service.*, com.src.model.*"
	contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    int id = Integer.parseInt(request.getParameter("id"));
    CharityServiceInterface csi = new CharityServiceImpl();
    Charity charity = csi.getCharityById(id);   // ✅ FIXED method name
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Update Charity</title>
</head>
<body>
	<h2>Update Charity</h2>
	<form action="updateCharity" method="post">
		<input type="hidden" name="charityId" value="<%= charity.getCharityId() %>">
		Name: <input type="text" name="name" value="<%= charity.getName() %>"
			required><br>
		<br> RegNO: <input type="text" name="regno"
			value="<%= charity.getRegNo() %>" required><br>
		<br> Contact: <input type="text" name="contact"
			value="<%= charity.getContact() %>" required><br>
		<br> Description: <input type="text" name="description"
			value="<%= charity.getDescription() %>" required><br>
		<br> <input type="submit" value="Update Charity">
	</form>
</body>
</html>
