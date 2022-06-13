/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.cellphonestore.dao;

import com.cellphonestore.model.Category;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author hongd
 */
public class CategoryDAO{
    Connection conn = null;
    PreparedStatement ps = null;
    ResultSet rs = null;
    
    public List<Category> getAll(){
        List<Category> list = new ArrayList<>();
        String query = "select * from Category";
        try {
            conn = new com.cellphonestore.context.DBContext().getConnection();
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {                
                list.add(new Category(rs.getInt(1), rs.getString(2)));
            }
        } catch (Exception e) {
            System.out.println("Error!"+e);
        }
        return list;
    }
    
    public Category getCateByCid(int cid){
        String query = "select * from Category where cid = ?";
        try {
            conn = new com.cellphonestore.context.DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setInt(1, cid);
            rs = ps.executeQuery();
            if (rs.next()) {
                return new Category(rs.getInt(1), rs.getString(2));
            }
        } catch (Exception e) {
            System.out.println("Error"+e);
        }
        return null;
    }
    
    public Category addCategory(String cate){
        String query = "INSERT INTO Category(cname)\n" +
                       "VALUES (?) ";
        try {
            conn = new com.cellphonestore.context.DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, cate);
            ps.executeUpdate();
        } catch (Exception e) {
            System.out.println("Error"+e);
        }
        return null;
    }
    
    
}

