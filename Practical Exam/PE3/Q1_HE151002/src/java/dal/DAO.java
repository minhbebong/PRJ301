/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import model.Account;

/**
 *
 * @author Lenovo
 */
public class DAO extends DBContext{
    public ArrayList<Account> getAccount(){
        ArrayList<Account> list = new ArrayList<>();
        try {
            String sql = "select * from Account";
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {                
                Account a = new Account(rs.getString(1), rs.getString(2));
                list.add(a);
            }
        } catch (Exception e) {
            System.out.println(e);
        }        
        return list;
    }
}
