package com.src.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.src.model.Charity;
import com.src.util.DBConnection;

public class CharityDAOImpl implements CharityDAO {

   

    @Override
    public boolean insertCharity(Charity charity) {
        String sql = "INSERT INTO charity (name, regNo, contact, description) VALUES (?, ?, ?, ?)";
        try (Connection con = DBConnection.getConnection(); PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setString(1, charity.getName());
            ps.setString(2, charity.getRegNo());
            ps.setString(3, charity.getContact());
            ps.setString(4, charity.getDescription());
            return ps.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    @Override
    public Charity findCharityById(int charityId) {
        String sql = "SELECT * FROM charity WHERE charityId = ?";
        try (Connection con = DBConnection.getConnection(); PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setInt(1, charityId);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                Charity c = new Charity();
                c.setCharityId(rs.getInt("charityId"));
                c.setName(rs.getString("name"));
                c.setRegNo(rs.getString("regNo"));
                c.setContact(rs.getString("contact"));
                c.setDescription(rs.getString("description"));
                return c;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    @Override
    public List<Charity> findAllCharities() {
        List<Charity> list = new ArrayList<>();
        String sql = "SELECT * FROM charity";
        try (Connection con = DBConnection.getConnection(); Statement st = con.createStatement()) {
            ResultSet rs = st.executeQuery(sql);
            while (rs.next()) {
                Charity c = new Charity();
                c.setCharityId(rs.getInt("charityId"));       
                c.setName(rs.getString("name"));
                c.setRegNo(rs.getString("regno"));      
                c.setContact(rs.getString("contact"));
                c.setDescription(rs.getString("description"));
                list.add(c);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }


    @Override
    public boolean updateCharity(Charity charity) {
        String sql = "UPDATE charity SET name=?, regNo=?, contact=?, description=? WHERE charityId=?";
        try (Connection con = DBConnection.getConnection(); PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setString(1, charity.getName());
            ps.setString(2, charity.getRegNo());
            ps.setString(3, charity.getContact());
            ps.setString(4, charity.getDescription());
            ps.setInt(5, charity.getCharityId());
            return ps.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    @Override
    public boolean deleteCharity(int charityId) {
        String sql = "DELETE FROM charity WHERE charityId=?";
        try (Connection con = DBConnection.getConnection(); PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setInt(1, charityId);
            return ps.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }
    @Override
    public Charity getCharityByRegNoAndPhone(String regno, String phone) {
        Charity charity = null;
        try {
            Connection con = DBConnection.getConnection();
            String query = "SELECT * FROM charity WHERE regno=? AND contact=?";
            PreparedStatement ps = con.prepareStatement(query);
            ps.setString(1, regno);
            ps.setString(2, phone);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                charity = new Charity();
                charity.setCharityId(rs.getInt("charityId"));
                charity.setName(rs.getString("name"));
                charity.setRegNo(rs.getString("regno"));
                charity.setContact(rs.getString("contact"));
                charity.setDescription(rs.getString("description"));
            }
            con.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return charity;
    }
}


