<%@ page language="java"
    import="com.src.service.*, com.src.model.*, java.util.*"
    contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Charity Dashboard</title>
<style>
body {
    font-family: 'Segoe UI', Arial, sans-serif;
    background-color: #f8f9fa;
    margin: 0;
    padding: 0;
}

.container {
    max-width: 1000px;
    margin: 40px auto;
    background: white;
    border-radius: 12px;
    padding: 25px;
    box-shadow: 0 3px 15px rgba(0,0,0,0.1);
}

h2 {
    text-align: center;
    color: #0d6efd;
    margin-bottom: 20px;
}

table {
    width: 100%;
    border-collapse: collapse;
}

table thead {
    background-color: #0d6efd;
    color: white;
}

table th, table td {
    padding: 12px 15px;
    border-bottom: 1px solid #ddd;
    text-align: left;
}

table tr:hover {
    background-color: #f1f1f1;
}

table td button {
    padding: 6px 12px;
    border-radius: 5px;
    font-size: 14px;
    background-color: #0d6efd;
    color: white;
    border: none;
    cursor: pointer;
}

table td button:hover {
    background-color: #0b5ed7;
}

a {
    text-decoration: none;
}
</style>
</head>
<body>

<%
    CharityServiceInterface csi = new CharityServiceImpl();
    List<Charity> charities = csi.getAllCharities();
%>

<div class="container">
    <h2>Registered Charities</h2>

<%
    if (charities != null && !charities.isEmpty()) {
%>
    <table>
        <thead>
            <tr>
                <th>Charity ID</th>
                <th>Name</th>
                <th>Reg No</th>
                <th>Contact</th>
                <th>Description</th>
                <th>View Campaigns</th>
            </tr>
        </thead>
        <tbody>
<%
        for (Charity c : charities) {
%>
            <tr>
                <td><%= c.getCharityId() %></td>
                <td><%= c.getName() %></td>
                <td><%= c.getRegNo() %></td>
                <td><%= c.getContact() %></td>
                <td><%= c.getDescription() %></td>
                <td>
                    <a href="Campaignmain.jsp?charityId=<%= c.getCharityId() %>">
                        <button>View</button>
                    </a>
                </td>
            </tr>
<%
        }
%>
        </tbody>
    </table>
<%
    } else {
%>
    <p style="text-align:center;">No charities found in the database.</p>
<%
    }
%>
</div>

</body>
</html>
