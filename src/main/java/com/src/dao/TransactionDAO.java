package com.src.dao;

import java.util.List;
import com.src.model.Transaction;

public interface TransactionDAO {
    boolean insertTransaction(Transaction transaction);
    Transaction findTransactionById(int transactionId);
    List<Transaction> findAllTransactions();
    List<Transaction> findTransactionsByDonorId(int donorId);
    List<Transaction> findTransactionsByCampaign(int campaignId);
    
    // ✅ New method
    List<Transaction> findTransactionsByCharity(int charityId);
}
