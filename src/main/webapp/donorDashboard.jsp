<%@ page language="java" 
    import="com.src.model.*, com.src.service.*, java.util.List" 
    contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    // Prevent caching
    response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
    response.setHeader("Pragma", "no-cache");
    response.setHeader("Expires", "0");

    String donorEmail = (String) session.getAttribute("donorEmail");
    if(donorEmail == null){
        response.sendRedirect("Donormain.jsp"); // redirect to login
        return;
    }

    DonorServiceInterface dsi = new DonorServiceImpl();
    Donor donor = dsi.getDonorByEmail(donorEmail); // fetch donor details by email

    // Fetch transactions
    TransactionServiceInterface tsi = new TransactionServiceImpl();
    List<Transaction> transactions = tsi.getTransactionsByDonorId(donor.getDonorId());
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Donor Dashboard</title>
<style>
body { font-family: Arial, sans-serif; background-color: #f8f9fa; margin: 0; padding: 0; }
.container { max-width: 900px; margin: 50px auto; background: white; padding: 25px; border-radius: 10px; box-shadow: 0 4px 15px rgba(0,0,0,0.2); }
h2 { color: #0d6efd; text-align: center; }
table { width: 100%; border-collapse: collapse; margin-top: 20px; }
th, td { text-align: left; padding: 10px; border-bottom: 1px solid #ccc; }
th { background-color: #f2f2f2; }
.actions { margin-top: 20px; text-align: center; }
button { padding: 10px 20px; margin: 0 10px; border: none; border-radius: 5px; cursor: pointer; color: white; background-color: #0d6efd; transition: background 0.3s; }
button:hover { background-color: #0b5ed7; }
.logout-btn { background-color: #dc3545; }
.logout-btn:hover { background-color: #bb2d3b; }
.transactions { margin-top: 40px; }
.transactions h3 { color: #0d6efd; margin-bottom: 15px; }
</style>
</head>
<body>
<div class="container">
    <h2>Donor Dashboard</h2>
    
    <!-- Donor Details -->
    <table>
        <tr><th>Name:</th><td><%= donor.getDonorName() %></td></tr>
        <tr><th>Email:</th><td><%= donor.getEmail() %></td></tr>
        <tr><th>Phone:</th><td><%= donor.getPhone() %></td></tr>
        <tr><th>Address:</th><td><%= donor.getAddress() %></td></tr>
    </table>

    <!-- Actions -->
    <div class="actions">
        <form action="updateDonor.jsp" method="get" style="display:inline;">
            <button type="submit">Edit Profile</button>
        </form>
        <form action="logoutDonor" method="post" style="display:inline;">
            <button type="submit" class="logout-btn">Logout</button>
        </form>
    </div>

    <!-- Transaction Details -->
    <div class="transactions">
        <h3>Transaction History</h3>
        <%
            if(transactions != null && !transactions.isEmpty()){
        %>
        <table>
            <tr>
                <th>Transaction ID</th>
                <th>Charity Name</th>
                <th>Amount</th>
                <th>Date</th>
                <th>Status</th>
            </tr>
            <%
                for(Transaction t : transactions){
            %>
            <tr>
                <td><%= t.getTransactionId() %></td>
                <td><%= t.getCharityId() %></td>
                <td>₹<%= t.getAmount() %></td>
                <td><%= t.getDonationDate() %></td>
               
            </tr>
            <% } %>
        </table>
        <%
            } else {
        %>
        <p>No transactions found.</p>
        <%
            }
        %>
    </div>
</div>
</body>
</html>
