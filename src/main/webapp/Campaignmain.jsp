<%@ page language="java"
    import="com.src.service.*, java.util.List, com.src.model.*"
    contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    String donorEmail = (String) session.getAttribute("donorEmail");
    if(donorEmail == null){
        response.sendRedirect("Donormain.jsp");
        return;
    }

    DonorServiceInterface dsi = new DonorServiceImpl();
    Donor donor = dsi.getDonorByEmail(donorEmail);

    String charityIdStr = request.getParameter("charityId");
    if(charityIdStr == null){
        out.println("<p style='color:red; text-align:center;'>No charity selected.</p>");
        return;
    }

    int charityId = Integer.parseInt(charityIdStr);
    CampaignServiceInterface campSI = new CampaignServiceImpl();
    List<Campaign> campaigns = campSI.getCampaignsByCharityId(charityId);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Campaigns Management</title>
<style>
body { font-family: Arial, sans-serif; margin: 0; padding: 0; }
table { border-collapse: collapse; width: 100%; margin-top: 20px; }
th, td { padding: 8px; text-align: center; border: 1px solid #ccc; }
th { background-color: #f2f2f2; }
button { padding: 6px 12px; border: none; border-radius: 4px; cursor: pointer; background-color: #ffc107; color: #333; }
button:hover { background-color: #e0a800; color: #fff; }
</style>
</head>
<body>

<h1 style="text-align:center;">Campaigns for Charity ID: <%= charityId %></h1>

<% if(campaigns != null && !campaigns.isEmpty()){ %>
<table>
    <tr>
        <th>ID</th>
        <th>Title</th>
        <th>Description</th>
        <th>Start Date</th>
        <th>End Date</th>
        <th>Action</th>
    </tr>
    <%
        for(Campaign c : campaigns){
    %>
    <tr>
        <td><%= c.getCampaignId() %></td>
        <td><%= c.getCampaignName() %></td>
        <td><%= c.getDescription() %></td>
        <td><%= c.getStartDate() %></td>
        <td><%= c.getEndDate() %></td>
        <td>
            <form action="donorPayment.jsp" method="get">
                <input type="hidden" name="campaignId" value="<%= c.getCampaignId() %>">
                <input type="hidden" name="donorId" value="<%= donor.getDonorId() %>">
                <button type="submit">Pay</button>
            </form>
        </td>
    </tr>
    <% } %>
</table>
<% } else { %>
<p style="text-align:center; color:gray;">No campaigns found for this charity.</p>
<% } %>

</body>
</html>
