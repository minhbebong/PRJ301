/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import model.Employee;

/**
 *
 * @author Lenovo
 */
public class DAO  extends DBContext{
    public ArrayList<Employee> getAllEmployee(){
        ArrayList<Employee> list = new ArrayList<>();
        try {
            String sql = "select * from Employee";
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {                
                Employee e = new Employee(rs.getInt(1), rs.getString(2), 
                        rs.getDate(3), rs.getBoolean(4));
                list.add(e);
            }
        } catch (Exception e) {
        }
        
        return list;
    }
}
