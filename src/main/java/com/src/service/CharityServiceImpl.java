package com.src.service;

import java.util.ArrayList;

import com.src.dao.CharityDAO;
import com.src.dao.CharityDAOImpl;
import com.src.model.Charity;

public class CharityServiceImpl implements CharityServiceInterface {

    private CharityDAO charityDAO = new CharityDAOImpl();

    @Override
    public boolean addCharity(Charity charity) {
        return charityDAO.insertCharity(charity);
    }

    @Override
    public Charity getCharityById(int charityId) {
        return charityDAO.findCharityById(charityId);
    }

    @Override
    public ArrayList<Charity> getAllCharities() {
        return (ArrayList<Charity>) charityDAO.findAllCharities();
    }

    @Override
    public boolean updateCharity(Charity charity) {
        return charityDAO.updateCharity(charity);
    }

    @Override
    public boolean deleteCharity(int charityId) {
        return charityDAO.deleteCharity(charityId);
    }
    public Charity getCharityByRegNoAndPhone(String regno, String phone) {
        return (charityDAO).getCharityByRegNoAndPhone(regno, phone);
    }

}
