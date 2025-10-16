package com.src.service;

import java.util.ArrayList;

import com.src.model.Charity;

public interface CharityServiceInterface {
    boolean addCharity(Charity charity);
    Charity getCharityById(int charityId);
    ArrayList<Charity> getAllCharities();
    boolean updateCharity(Charity charity);
    boolean deleteCharity(int charityId);
    Charity getCharityByRegNoAndPhone(String regno, String phone);
}
