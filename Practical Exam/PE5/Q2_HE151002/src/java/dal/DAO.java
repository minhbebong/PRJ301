/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import model.Student;

/**
 *
 * @author Lenovo
 */
public class DAO extends DBContext {

    public ArrayList<Student> searchStudent(String name) {
        ArrayList<Student> list = new ArrayList<>();
        try {
            String sql = "select * from Student where [name] like ? ";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, name + "%");
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Student s = new Student(rs.getInt(1), rs.getString(2), rs.getDate(3),
                         rs.getBoolean(4));
                list.add(s);
            }
        } catch (Exception e) {
        }
        return list;
    }

}
