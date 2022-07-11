package dal;

/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */


import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import model.Account;
import model.Employee;

/**
 *
 * @author Lenovo
 */
public class DAO extends DBContext {

    public ArrayList<Account> findAllAccount() {
        ArrayList<Account> accounts = new ArrayList<>();
        try {
            String sql = "select * from Account";
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                accounts.add(new Account(rs.getString("username"), rs.getString("displayname")));
            }
        } catch (SQLException e) {
            System.out.println("loi function find all account");
        }
        return accounts;
    }

    public ArrayList<Employee> findAllEmployeeByUser(String username) {
        ArrayList<Employee> employees = new ArrayList<>();
        try {
            String sql = "select * from Employee where createdby = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, username);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                employees.add(new Employee(rs.getInt(1), rs.getString(2), rs.getDate(3).toLocalDate(), rs.getBoolean(4), rs.getString(5)));
            }
        } catch (SQLException e) {
            System.out.println("loi function find all employee by username");
        }
        return employees;
    }
}


  

