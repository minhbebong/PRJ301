package context;

/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */


import context.DBContext;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import model.Account;
import model.Employee;

/**
 *
 * @author Lenovo
 */
public class DAO extends DBContext {

    Connection cnn;

    public ArrayList<Account> getAllAccount() {
        ArrayList<Account> list = new ArrayList<>();
        String sql = "select * from Account";
        try {
            PreparedStatement stm = cnn.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Account a = new Account(rs.getString(1), rs.getString(2), rs.getString(3));
                list.add(a);
            }
        } catch (Exception e) {
        }
        return list;
    }
    
    public ArrayList<Employee> getAllEmployeeByName(String name) {
        ArrayList<Employee> list = new ArrayList<>();
        String sql = "select * from Employee where createdby = ?";
        try {
            PreparedStatement stm = cnn.prepareStatement(sql);
            stm.setString(1, name);
            
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Account a = new Account(rs.getString(1), rs.getString(2), rs.getString(3));
                Employee e = new Employee(rs.getInt(1), rs.getString(2), rs.getDate(3), 
                        rs.getBoolean(4), rs.getString(5));
                list.add(e);
            }
        } catch (Exception e) {
        }
        return list;
    }

    

    

   
}
