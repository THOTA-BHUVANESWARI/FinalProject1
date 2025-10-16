<%@ page language="java"
    import="com.src.service.*, com.src.model.*"
    contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    // Prevent direct access without login
    String donorEmail = (String) session.getAttribute("donorEmail");
    if(donorEmail == null){
        response.sendRedirect("Donormain.jsp");
        return;
    }

    String donorIdStr = request.getParameter("donorId");
    String campaignIdStr = request.getParameter("campaignId");

    if(donorIdStr == null || campaignIdStr == null){
        out.println("<p style='color:red; text-align:center;'>Invalid request.</p>");
        return;
    }

    int donorId = Integer.parseInt(donorIdStr);
    int campaignId = Integer.parseInt(campaignIdStr);

    DonorServiceInterface dsi = new DonorServiceImpl();
    Donor donor = dsi.getDonorById(donorId);

    CampaignServiceInterface csi = new CampaignServiceImpl();
    Campaign campaign = csi.getCampaignById(campaignId);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Donor Payment</title>
<style>
body { font-family: Arial; background-color: #f8f9fa; margin: 0; padding: 0; }
.container { max-width: 500px; margin: 50px auto; background: white; padding: 25px; border-radius: 10px; box-shadow: 0 4px 15px rgba(0,0,0,0.2); }
h2 { text-align: center; color: #0d6efd; }
form { margin-top: 20px; }
input[type="text"], input[type="number"] { width: 95%; padding: 10px; margin: 10px 0; border: 1px solid #ccc; border-radius: 5px; }
button { padding: 10px 20px; background-color: #28a745; color: white; border: none; border-radius: 5px; cursor: pointer; }
button:hover { background-color: #218838; }
</style>
</head>
<body>
<div class="container">
    <h2>Payment for Campaign: <%= campaign.getCampaignName() %></h2>
    <form action="<%=request.getContextPath()%>/PaymentServlet" method="post">
    <input type="hidden" name="donorId" value="<%= donorId %>">
    <input type="hidden" name="campaignId" value="<%= campaignId %>">
    <label>Amount:</label>
    <input type="number" name="amount" placeholder="Enter amount" required><br>
    <button type="submit">Pay Now</button>
</form>

</div>
</body>
</html>
