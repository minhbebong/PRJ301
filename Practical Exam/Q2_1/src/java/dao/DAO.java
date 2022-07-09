/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import context.DBContext;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Lenovo
 */
public class DAO {

    Connection cnn;//Kết nối CSDL
    PreparedStatement ps;//Thực hiện các câu lệnh sql
    ResultSet rs;//Lưu trữ và xử lí dữ liệu

    public Account login(String id, String pass) {
        String query = "select * from account\n"
                + "where accountid = ?\n"
                + "and [password] = ?";
        try {
            cnn = new DBContext().getConnection();
            ps = cnn.prepareStatement(query);
            ps.setString(1, id);
            ps.setString(2, pass);
            rs = ps.executeQuery();
            while (rs.next()) {
                return new Account(rs.getString(1), rs.getString(2));
            }
        } catch (Exception e) {
        }
        return null;
    }

    public List<Employee> getEmployeeByAccount(String id) {
        List<Employee> list = new ArrayList<>();
        String query = "select * from Employee\n"
                + "where createdby = ?";
        try {
            cnn = new DBContext().getConnection();
            ps = cnn.prepareStatement(query);
            ps.setString(1, id);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Employee(rs.getInt(1),
                        rs.getString(2),
                        rs.getInt(3),
                        rs.getDate(4)));
            }
        } catch (Exception e) {
        }
        return list;
    }

   
}
