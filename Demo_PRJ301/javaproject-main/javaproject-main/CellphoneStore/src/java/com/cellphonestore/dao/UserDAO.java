/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.cellphonestore.dao;

import com.cellphonestore.model.Users;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.http.HttpServlet;
/**
 *
 * @author hongd
 */
public class UserDAO extends HttpServlet{
    
    Connection conn = null;
    PreparedStatement ps = null;
    ResultSet rs =null;
    
    public Users login(String user, String pass){
        String query = "Select * from Users where username = ? and password = ?";
        try {
            conn = new com.cellphonestore.context.DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, user);
            ps.setString(2, pass);
            rs = ps.executeQuery();
            while (rs.next()) {                
                return new Users(rs.getString(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getDate(6), rs.getString(7), rs.getString(8), rs.getString(9));
            }
        } catch (Exception e) {
            System.out.println("Connection error! "+e);
        }
        return null;
    }
    
    public Users register(String firstname, String lastname, String email, String username, String password ){
        String query = "Insert into Users(firstname, lastname, email, username, [password],[role])\n"+
                "values(?,?,?,?,?,?)";
        
        try {
            conn = new com.cellphonestore.context.DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setNString(1, firstname);
            ps.setNString(2, lastname);
            ps.setString(3, email);
            ps.setString(4, username);
            ps.setString(5, password);
            ps.setString(6, "us");
            ps.executeUpdate();
        } catch (Exception e) {
            System.out.println("Connection error! " + e);
        }
        return null;
    }
    
    public List<Users> getAllUsers(){
        String query = "Select * from Users";
        List<Users> list = new ArrayList<>();
        try {
            conn = new com.cellphonestore.context.DBContext().getConnection();
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {                
                list.add(new Users(rs.getString(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getDate(6), rs.getString(7), rs.getString(8), rs.getString(9)));
            }
        } catch (Exception e) {
            System.out.println("Error: "+e);
        }
        return list;
    }
    
    public Users changePass(String user, String newpass){
        String query = "Update Users set [password] = ? where username = ?";
        try {
            conn = new com.cellphonestore.context.DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, newpass);
            ps.setString(2, user);
            ps.executeUpdate();
        } catch (Exception e) {
            System.out.println("Error: "+e);
        }
        return null;
    }
    
    public void updateSt(String pass, String email, String phone, String role , String username){
        String query = "Update Users set [password] = ?, email = ?, phone = ?, role = ? where username = ?";
        try {
            conn = new com.cellphonestore.context.DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, pass);
            ps.setString(2, email);
            ps.setString(3, phone);
            ps.setString(4, role);
            ps.setString(5, username);
            ps.executeUpdate();
        } catch (Exception e) {
            System.out.println("Error: "+e);    
        }
    }
    
    public Users getUser(String uname){
        String query = "select * from Users\n"
                + "where username = ?";
        try {
            conn = new com.cellphonestore.context.DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, uname);
            rs = ps.executeQuery();
            while (rs.next()) {                
                return new Users(rs.getString(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getDate(6), rs.getString(7), rs.getString(8), rs.getString(9));
            }
        } catch (Exception e) {
            System.out.println("Connection error! " + e);
        }
        return null;
    }
    
    public boolean findUserByUsername(String user){
        String query = "select * from Users\n"
                + "where username = ?";
        try {
            conn = new com.cellphonestore.context.DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, user);
            rs = ps.executeQuery();
            while (rs.next()) {                
                return true;
            }
        } catch (Exception e) {
            System.out.println("Connection error! " + e);
        }
        return false;
    }
    
    public String getRole(String username){
        String query = "Select role from Users where username = ?";
        try {
            conn = new com.cellphonestore.context.DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, username);
            rs = ps.executeQuery();
            if (rs.next()) {
                return rs.getString(1);
            }
        } catch (Exception e) {
            System.out.println("Error: "+e);
        }
        return null;
    }
    
    public void updateProfile(Users a){
        String query = "update Users set firstname = ?, lastname = ?, email = ?, phone = ? ,address= ?, birthday = ? where username = ?";
        try {
            conn = new com.cellphonestore.context.DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setNString(1, a.getFirstname());
            ps.setNString(2, a.getLastname());
            ps.setString(3, a.getEmail());
            ps.setString(4, a.getPhone());
            ps.setNString(5, a.getAddress());
            ps.setDate(6, a.getBirthday());
            ps.setString(7, a.getUsername());
            ps.executeUpdate();
        } catch (Exception e) {
            System.out.println("Error: "+e);
        }
    }
    
    
}
