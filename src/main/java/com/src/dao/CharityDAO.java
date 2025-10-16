package com.src.dao;

import java.util.List;

import com.src.model.Charity;

public interface CharityDAO {
    boolean insertCharity(Charity charity);
    Charity findCharityById(int charityId);
    List<Charity> findAllCharities();
    boolean updateCharity(Charity charity);
    boolean deleteCharity(int charityId);
	Charity getCharityByRegNoAndPhone(String regno, String phone);
}
