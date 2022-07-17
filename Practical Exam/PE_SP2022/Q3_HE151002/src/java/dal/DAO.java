/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import model.Account;
import model.Certificate;
import model.Employee;

/**
 *
 * @author Lenovo
 */
public class DAO extends DBContext{
    public List<Account> getAllAccount() {
        try {
            List<Account> list = new ArrayList<>();
            String sql = " select*from Account";
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Account d = new Account(rs.getString(1), rs.getString(2), rs.getString(3));
                list.add(d);
            }
            return list;
        } catch (Exception ex) {
            ex.printStackTrace(System.out);
        }
        return null;
    }

    public List<Certificate> getAllCertificate() {
        try {
            List<Certificate> list = new ArrayList<>();
            String sql = " select*from Certificate";
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Certificate d = new Certificate(rs.getInt(1), rs.getString(2));
                list.add(d);
            }
            return list;
        } catch (Exception ex) {
            ex.printStackTrace(System.out);
        }
        return null;
    }

    public List<Employee> getAllEmployee() {
        try {
            List<Employee> list = new ArrayList<>();
            String sql = " select*from Employee";
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Employee d = new Employee(rs.getInt(1), rs.getString(2), rs.getDate(3), rs.getBoolean(4));
                list.add(d);
            }
            return list;
        } catch (Exception ex) {
            ex.printStackTrace(System.out);
        }
        return null;
    }

    public void deleteAllCertificate(String emid) {
        try {
            List<Certificate> list = new ArrayList<>();
            String sql = "  delete from Employee_Certificate where empid = ?";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.executeUpdate();
        } catch (Exception ex) {
            ex.printStackTrace(System.out);
        }
    }

    public void insertEmployee(int id, String name, Date dob , boolean  gender, String createby) {
        try {
            List<Certificate> list = new ArrayList<>();
            String sql = "   insert into Employee(empid, empname, empdob, empgender,createdby) values (?,?,?,?,?)";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, id);
            ps.setString(2, name);
            ps.setDate(3, dob);
            ps.setBoolean(4, gender);
            ps.setString(5, createby);
            ps.executeUpdate();
        } catch (Exception ex) {
            ex.printStackTrace(System.out);
        }
    }
}
