package com.src.service;

import java.util.List;

import com.src.dao.DonorDAO;
import com.src.dao.DonorDAOImpl;
import com.src.model.Donor;

public class DonorServiceImpl implements DonorServiceInterface {

    private DonorDAO donorDAO = new DonorDAOImpl();

    @Override
    public boolean addDonor(Donor donor) {
        return donorDAO.insertDonor(donor);
    }

    @Override
    public Donor getDonorById(int donorId) {
        return donorDAO.findDonorById(donorId);
    }

    @Override
    public Donor getDonorByEmail(String email) {
        // Delegates to DAO method
        return donorDAO.getDonorByEmail(email);
    }

    @Override
    public List<Donor> getAllDonors() {
        return donorDAO.findAllDonors();
    }

    @Override
    public boolean updateDonor(Donor donor) {
        return donorDAO.updateDonor(donor);
    }

    @Override
    public boolean deleteDonor(int donorId) {
        return donorDAO.deleteDonor(donorId);
    }
}
