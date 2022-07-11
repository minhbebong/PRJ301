/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import model.Employee;
import model.Skill;

/**
 *
 * @author Lenovo
 */
public class DAO extends DBContext {

    public ArrayList<Skill> getAllSkill() {
        ArrayList<Skill> list = new ArrayList<>();
        try {
            String sql = "select * from Skill";
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Skill s = new Skill(rs.getInt(1), rs.getString(2));
                list.add(s);
            }
        } catch (Exception e) {
        }
        return list;
    }

    public void insertEmployee(int id, String name, String dob, String gender) {
        try {
            String sql = "insert into Employee (id, name, dob, gender) values(?,?,?,?)";
            PreparedStatement stm = connection.prepareCall(sql);
            stm.setInt(1, id);
            stm.setString(2, name);
            stm.setString(3, dob);
            stm.setBoolean(4, "1".equals(gender));
            stm.executeUpdate();
        } catch (Exception e) {
        }
    }

    public void insertEmployeeSkill(int eid, int sid) {
        try {
            String sql = "insert into Employee_Skill (eid, sid) values(?,?)";
            PreparedStatement stm = connection.prepareCall(sql);
            stm.setInt(1, eid);
            stm.setInt(2, sid);
            stm.executeUpdate();
        } catch (Exception e) {
        }
    }
    
    public void deleteEmployeeSkill(int eid) {
        try {
            String sql = "delete Employee_Skill where eid=?";
            PreparedStatement stm = connection.prepareCall(sql);
            stm.setInt(1, eid);
            stm.executeUpdate();
        } catch (Exception e) {
        }
    }
}
