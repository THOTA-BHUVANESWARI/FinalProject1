package com.src.servlet;

import java.io.IOException;
import java.sql.Date;
import java.time.LocalDate;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.src.model.Transaction;
import com.src.service.TransactionServiceImpl;
import com.src.service.TransactionServiceInterface;

@WebServlet("/PaymentServlet")
public class PaymentServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        int donorId = Integer.parseInt(request.getParameter("donorId"));
        int campaignId = Integer.parseInt(request.getParameter("campaignId"));
        double amount = Double.parseDouble(request.getParameter("amount"));

        // Create Transaction object
        Transaction txn = new Transaction();
        txn.setDonorId(donorId);
        txn.setCampaignId(campaignId);
        txn.setAmount(amount);
        txn.setDonationDate(Date.valueOf(LocalDate.now()));
        //txn.setStatus("SUCCESS"); // assuming instant success for simplicity

        // Save transaction via service
        TransactionServiceInterface tsi = new TransactionServiceImpl();
        boolean isSaved = tsi.addTransaction(txn);

        if(isSaved) {
            response.sendRedirect("donorDashboard.jsp?msg=Payment Successful");
        } else {
            response.getWriter().println("<p style='color:red; text-align:center;'>Payment Failed. Try Again.</p>");
        }
    }
}
