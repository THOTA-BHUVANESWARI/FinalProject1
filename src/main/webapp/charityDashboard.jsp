<%@ page language="java" 
    import="com.src.service.*, com.src.model.*" 
    contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    // Prevent caching and enforce login
    response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
    response.setHeader("Pragma", "no-cache");
    response.setHeader("Expires", "0");

    Integer charityId = (Integer) session.getAttribute("charityId");
    if (charityId == null) {
        response.sendRedirect("CharityLogin.jsp");
        return;
    }

    CharityServiceInterface csi = new CharityServiceImpl();
    Charity charity = csi.getCharityById(charityId);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Charity Dashboard</title>
<style>
body {
    font-family: Arial, sans-serif;
    background-color: #f2f4f7;
    margin: 0;
    padding: 0;
}
.container {
    background: white;
    max-width: 700px;
    margin: 50px auto;
    padding: 30px;
    border-radius: 12px;
    box-shadow: 0 4px 15px rgba(0,0,0,0.2);
}
h2 {
    text-align: center;
    color: #333;
}
table {
    width: 100%;
    border-collapse: collapse;
    margin-top: 20px;
}
th, td {
    border: 1px solid #ccc;
    padding: 10px;
    text-align: left;
}
th {
    background-color: #007bff;
    color: white;
}
tr:nth-child(even) {
    background-color: #f9f9f9;
}
.buttons {
    display: flex;
    justify-content: space-between;
    margin-top: 25px;
}
button {
    padding: 10px 20px;
    border: none;
    border-radius: 6px;
    color: white;
    cursor: pointer;
    font-size: 14px;
}
.add-btn {
    background-color: #28a745;
}
.add-btn:hover {
    background-color: #218838;
}
.logout-btn {
    background-color: #dc3545;
}
.logout-btn:hover {
    background-color: #bb2d3b;
}
</style>
</head>
<body>
<div class="container">
    <h2>Welcome, <%= charity.getName() %></h2>

    <table>
        <tr>
            <th>Registration No</th>
            <td><%= charity.getRegNo() %></td>
        </tr>
        <tr>
            <th>Contact</th>
            <td><%= charity.getContact() %></td>
        </tr>
        <tr>
            <th>Description</th>
            <td><%= charity.getDescription() %></td>
        </tr>
    </table>

    <div class="buttons">
        <form action="addCampaign.jsp" method="get">
            <input type="hidden" name="charityId" value="<%= charity.getCharityId() %>">
            <button type="submit" class="add-btn">Add Campaign</button>
        </form>

        <form action="logoutCharity" method="post">
            <button type="submit" class="logout-btn">Logout</button>
        </form>
    </div>
</div>
</body>
</html>
