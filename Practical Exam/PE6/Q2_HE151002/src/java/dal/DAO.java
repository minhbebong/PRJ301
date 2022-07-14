/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import model.Article;
import model.Author;
import model.Department;
import model.Employee;
import model.Group;

/**
 *
 * @author Lenovo
 */
public class DAO extends DBContext {

//    public ArrayList<Employee> getEmployee() {
//        ArrayList<Employee> list = new ArrayList<>();
//        String sql = "select * from Employee e, Department d where e.did = d.id";
//        try{
//            PreparedStatement ps = connection.prepareStatement(sql);
//            ResultSet rs = ps.executeQuery();
//            while (rs.next()) {
//                Department d = new Department(rs.getInt("did"), rs.getString(7));
//                Employee e = new Employee(rs.getInt(1), rs.getString(2),
//                        rs.getDate(3), rs.getBoolean(4), d);
//                list.add(e);
//            }
//        }catch(Exception e){
//            System.out.println(e);
//        }
//        return list;
//    }
    public ArrayList<Employee> getEmployee(String ename) {
        if (ename == null) {
            ename = "";
        }
        ArrayList<Employee> list = new ArrayList<>();
        String sql = "select * from Employee e, Department d where e.did = d.id and e.name like ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, "%" + ename + "%");
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Department d = new Department(rs.getInt("did"), rs.getString(7));
                Employee e = new Employee(rs.getInt(1), rs.getString(2),
                        rs.getDate(3), rs.getBoolean(4), d);
                list.add(e);
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return list;
    }
    // Hàm xóa

    public void deleteEmployee(int emid) {
        String sql = "delete Employee where id = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, emid);
            ps.executeUpdate();
        } catch (Exception e) {
            System.out.println(e);
        }
    }

    //Hàm get
    public ArrayList<Group> getGroup() {

        ArrayList<Group> list = new ArrayList<>();
        String sql = "select * from [Group]";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Group g = new Group(rs.getInt(1), rs.getString(2));
                list.add(g);
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return list;
    }
    
    public ArrayList<Author> getAuthor() {

        ArrayList<Author> list = new ArrayList<>();
        String sql = "select * from Author";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Author a = new Author(rs.getInt(1), rs.getString(2));
                list.add(a);
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return list;
    }

    public void insertAccount(String uid, String uname) {
        String sql = "insert into Account(accountid, [password]) values (?,?)";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, uid);
            ps.setString(2, uname);
            ps.executeUpdate();
        } catch (Exception e) {
            System.out.println(e);
        }
    }
    
    public void insertGroupAccount(String uid, String gid) {
        String sql = "insert into Account_Group(groupid, accountid) values (?,?)";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, gid);
            ps.setString(2, uid);
            ps.executeUpdate();
        } catch (Exception e) {
            System.out.println(e);
        }
    }
    
    public ArrayList<Article> getArticle(String authorid) {

        ArrayList<Article> list = new ArrayList<>();
        String sql = "   select a1.*,aa.* from  Author_Article aa, Artice a1\n"
                + "  where  a1.articleid = aa.articleid and aa.authorid =?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, authorid);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Article a = new Article(rs.getInt(1), rs.getString(2), rs.getDate(3));
                list.add(a);
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return list;
    }
}
