package com.src.service;

import java.util.List;
import com.src.model.Transaction;

public interface TransactionServiceInterface {
    boolean addTransaction(Transaction transaction);
    Transaction getTransactionById(int transactionId);
    List<Transaction> getAllTransactions();
    List<Transaction> getTransactionsByDonorId(int donorId);
    List<Transaction> getTransactionsByCampaign(int campaignId);
    
    // ✅ New method
    List<Transaction> getTransactionsByCharityId(int charityId);
}
