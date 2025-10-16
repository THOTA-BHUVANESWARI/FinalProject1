<%@ page language="java"
	import="com.src.service.*, java.util.List, com.src.model.*,java.util.ArrayList"
	contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Donation & Charity Management</title>
<style>
table {
	border-collapse: collapse;
	width: 100%;
	margin-bottom: 40px;
}

th, td {
	padding: 8px;
	text-align: center;
	border: 1px solid #ccc;
}

th {
	background-color: #f2f2f2;
}

a {
	display: block;
	padding: 5px;
}

h2 {
	text-align: center;
	margin-top: 40px;
}
</style>
</head>
<body>
	<h1 style="text-align: center;">Donation & Charity Management</h1>

	<!-- Display message if available -->
	<%
        String msg = request.getParameter("msg");
        if(msg != null){
            out.print("<p style='color:green; text-align:center;'>" + msg + "</p>");
        }
    %>

	<!-- Donors Section -->
	<h2>Donors</h2>
	<%
        DonorServiceInterface dsi = new DonorServiceImpl();
        List<Donor> donors = dsi.getAllDonors();
    %>
	<table>
		<tr>
			<th>ID</th>
			<th>Name</th>
			<th>Email</th>
			<th>Mobile</th>
			<th>Address</th>
			<th colspan="2" style="background-color: #0d6efd; color: white;">
				<a href="addDonor.jsp" style="color: white; text-decoration: none;">Add
					Donor</a>
			</th>
		</tr>
		<%
            for(Donor d : donors){
        %>
		<tr>
			<td><%= d.getDonorId() %></td>
			<td><%= d.getDonorName() %></td>
			<td><%= d.getEmail() %></td>
			<td><%= d.getPhone() %></td>
			<td><%= d.getAddress() %></td>
			<td style="background-color: #DEDB40;"><a
				href="updateDonor.jsp?id=<%= d.getDonorId() %>"
				style="color: white; text-decoration: none;">Update</a></td>
			<td style="background-color: red;"><a
				href="deleteDonor?id=<%= d.getDonorId() %>"
				style="color: white; text-decoration: none;">Delete</a></td>
		</tr>
		<% } %>
	</table>

	<!-- Charity Section -->
	<h2>Charities</h2>
	<%
        CharityServiceInterface csi = new CharityServiceImpl();
        List<Charity> charities = csi.getAllCharities();
    %>
	<table>
		<tr>
			<th>ID</th>
			<th>Name</th>
			<th>RegNo</th>
			<th>Contact</th>
			<th>Description</th>
			<th colspan="2" style="background-color: #0d6efd; color: white;">
				<a href="addCharity.jsp"
				style="color: white; text-decoration: none;">Add Charity</a>
			</th>
		</tr>
		<%
            for(Charity c : charities){
        %>
		<tr>
			<td><%= c.getCharityId() %></td>
			<td><%= c.getName() %></td>
			<td><%= c.getRegNo() %></td>
			<td><%= c.getContact() %></td>
			<td><%= c.getDescription() %></td>
			<td style="background-color: #DEDB40;"><a
				href="updateCharity.jsp?id=<%= c.getCharityId() %>"
				style="color: white; text-decoration: none;">Update</a></td>
			<td style="background-color: red;"><a
				href="deleteCharity?id=<%= c.getCharityId() %>"
				style="color: white; text-decoration: none;">Delete</a></td>
		</tr>
		<% } %>
	</table>

	<!-- Campaign Section -->
	<h2>Campaigns</h2>
	<%
        CampaignServiceInterface campSI = new CampaignServiceImpl();
        List<Campaign> campaigns = campSI.getAllCampaigns();
    %>
	<table>
		<tr>
			<th>ID</th>
			<th>Title</th>
			<th>Description</th>
			<th>Start Date</th>
			<th>End Date</th>
			<th colspan="2" style="background-color: #0d6efd; color: white;">
				<a href="addCampaign.jsp"
				style="color: white; text-decoration: none;">Add Campaign</a>
			</th>
		</tr>
		<%
            for(Campaign camp : campaigns){
        %>
		<tr>
			<td><%= camp.getCampaignId() %></td>
			<td><%= camp.getCampaignName() %></td>
			<td><%= camp.getDescription() %></td>
			<td><%= camp.getStartDate() %></td>
			<td><%= camp.getEndDate() %></td>
			<td style="background-color: #DEDB40;"><a
				href="updateCampaign.jsp?id=<%= camp.getCampaignId() %>"
				style="color: white; text-decoration: none;">Update</a></td>
			<td style="background-color: red;"><a
				href="deleteCampaign?id=<%= camp.getCampaignId() %>"
				style="color: white; text-decoration: none;">Delete</a></td>
		</tr>
		<% } %>
	</table>

	<!-- Transaction Section -->
	<h2>Transactions</h2>
	<%
        TransactionServiceInterface tsi = new TransactionServiceImpl();
        List<Transaction> transactions = tsi.getAllTransactions();
    %>
	<table>
		<tr>
			<th>ID</th>
			<th>Donor ID</th>
			<th>Campaign ID</th>
			<th>Amount</th>
			<th>Date</th>
			<th colspan="2" style="background-color: #0d6efd; color: white;">
				<a href="addTransaction.jsp"
				style="color: white; text-decoration: none;">Add Transaction</a>
			</th>
		</tr>
		<%
            for(Transaction t : transactions){
        %>
		<tr>
			<td><%= t.getTransactionId() %></td>
			<td><%= t.getDonorId() %></td>
			<td><%= t.getCampaignId() %></td>
			<td><%= t.getAmount() %></td>
			<td><%= t.getDonationDate() %></td>
			<td style="background-color: #DEDB40;"><a
				href="updateTransaction.jsp?id=<%= t.getTransactionId() %>"
				style="color: white; text-decoration: none;">Update</a></td>
			<td style="background-color: red;"><a
				href="deleteTransaction?id=<%= t.getTransactionId() %>"
				style="color: white; text-decoration: none;">Delete</a></td>
		</tr>
		<% } %>
	</table>

</body>
</html>
