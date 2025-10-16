<%@ page language="java" import="com.src.model.*, com.src.service.*, java.util.List" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    String donorEmail = (String) session.getAttribute("donorEmail");
    if(donorEmail == null){
        response.sendRedirect("Donormain.jsp");
        return;
    }

    CharityServiceInterface csi = new CharityServiceImpl();
    List<Charity> charities = csi.getAllCharities();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Available Charities</title>
</head>
<body>
<h1>All Charities</h1>
<table border="1">
<tr><th>Name</th><th>Reg No</th><th>Contact</th><th>Description</th><th>View Campaigns</th></tr>
<%
    for(Charity c : charities){
%>
<tr>
<td><%= c.getName() %></td>
<td><%= c.getRegNo() %></td>
<td><%= c.getContact() %></td>
<td><%= c.getDescription() %></td>
<td><a href="Campaignmain.jsp?charityId=<%= c.getCharityId() %>">View</a></td>
</tr>
<% } %>
</table>
</body>
</html>
