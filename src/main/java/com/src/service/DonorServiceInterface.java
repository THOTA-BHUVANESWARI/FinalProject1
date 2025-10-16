package com.src.service;

import java.util.List;
import com.src.model.Donor;

public interface DonorServiceInterface {
    boolean addDonor(Donor donor);
    Donor getDonorById(int donorId);
    Donor getDonorByEmail(String email); // <-- Add this method
    List<Donor> getAllDonors();
    boolean updateDonor(Donor donor);
    boolean deleteDonor(int donorId);
}
