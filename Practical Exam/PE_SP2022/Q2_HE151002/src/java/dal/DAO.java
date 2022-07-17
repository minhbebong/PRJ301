/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import model.Account;
import model.Member;

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
//                Student s = new Student(rs.getInt(1), rs.getString(2), rs.getDate(3), rs.getInt(4),d);
                list.add(d);
            }
            return list;
        } catch (Exception ex) {
            ex.printStackTrace(System.out);
        }
        return null;
    }
     public List<Member> getAllMemberByAcc(String name) {
        try {
            List<Member> list = new ArrayList<>();
            String sql = " select * from Member where createdby = ?";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, name);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Member d = new Member(rs.getInt(1), rs.getString(2), rs.getDate(3),rs.getBoolean(4));
                list.add(d);
            }
            return list;
        } catch (Exception ex) {
            ex.printStackTrace(System.out);
        }
        return null;
    }
}
