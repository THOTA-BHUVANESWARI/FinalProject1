<%@ page language="java" import="com.src.service.*, com.src.model.*, java.util.*" 
    contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    int id = Integer.parseInt(request.getParameter("id"));
    CampaignServiceInterface campSI = new CampaignServiceImpl();
    Campaign campaign = campSI.getCampaignById(id);

    CharityServiceInterface charityService = new CharityServiceImpl();
    List<Charity> charities = charityService.getAllCharities();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Update Campaign</title>
</head>
<body>
<h2>Update Campaign</h2>
<form action="<%= request.getContextPath() %>/updateCampaign" method="post">
    <input type="hidden" name="id" value="<%= campaign.getCampaignId() %>">

    Charity: 
    <select name="charityId" required>
        <% for (Charity c : charities) { %>
            <option value="<%= c.getCharityId() %>" 
                <%= (c.getCharityId() == campaign.getCharityId()) ? "selected" : "" %>>
                <%= c.getCharityId() %>
            </option>
        <% } %>
    </select>
    <br><br>

    Title: <input type="text" name="title" value="<%= campaign.getCampaignName() %>" required><br><br>
    Description: <input type="text" name="description" value="<%= campaign.getDescription() %>" required><br><br>
    Start Date: <input type="date" name="startDate" value="<%= campaign.getStartDate() %>" required><br><br>
    End Date: <input type="date" name="endDate" value="<%= campaign.getEndDate() %>" required><br><br>

    <input type="submit" value="Update Campaign">
</form>
</body>
</html>
