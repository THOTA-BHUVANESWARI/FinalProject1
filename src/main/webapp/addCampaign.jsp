<%@ page language="java" import="com.src.service.*, com.src.model.*, java.util.*" 
    contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Add Campaign</title>
</head>
<body>
<h2>Add Campaign</h2>
<form action="<%= request.getContextPath() %>/addCampaign" method="post">
    
    <!-- Charity Selection -->
    Charity: 
    <select name="charityId" required>
        <%
            CharityServiceInterface charityService = new CharityServiceImpl();
            List<Charity> charities = charityService.getAllCharities();  // ✅ Correct method
            for (Charity c : charities) {
        %>
            <option value="<%= c.getCharityId() %>"><%= c.getCharityId() %></option>
        <%
            }
        %>
    </select>
    <br><br>
    
    Title: <input type="text" name="title" required><br><br>
    Description: <input type="text" name="description" required><br><br>
    Start Date: <input type="date" name="startDate" required><br><br>
    End Date: <input type="date" name="endDate" required><br><br>
    
    <input type="submit" value="Save Campaign">
</form>
</body>
</html>
