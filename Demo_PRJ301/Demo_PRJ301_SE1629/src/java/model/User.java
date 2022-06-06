/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import context.DBContext;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;

/**
 *
 * @author Lenovo
 */
public class User {

    private String account;
    private String pass;

    public User() {
    }

    public User(String account, String pass) {
        this.account = account;
        this.pass = pass;
        connectDB();
    }

    public String getAccount() {
        return account;
    }

    public void setAccount(String account) {
        this.account = account;
    }

    public String getPass() {
        return pass;
    }

    public void setPass(String pass) {
        this.pass = pass;
    }

    public boolean checkLogin() {
        //Kiểm tra điều kiện Login
        //return("admin".equals(account) && "123".equals(pass));
        //Check account va pass co tồn tại trong DB không ?
        try {
            stm = cnn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
            String strSelect = "select * from tblUser where account ='" + account + "'and pass ='" + pass + "' ";
            rs = stm.executeQuery(strSelect);
            while (rs.next()) {                
                return true;
            }
        } catch (Exception e) {
            System.out.println("Login eror:" + e.getMessage());
        }
        return false;
    }
    //Khai báo thành phần xử lí cơ sở dũ liệu
    Connection cnn;//Kết nối CSDL
    Statement stm;//Thực hiện các câu lệnh sql
    ResultSet rs;//Lưu trữ và xử lí dữ liệu

    private void connectDB() {
        try {
            cnn = (new DBContext()).getConnection();
            System.out.println("Connect successfully");
        } catch (Exception e) {
            System.out.println("Connect error" + e.getMessage());
        }
    }

    public String getNameByAcount() {
        try {
            stm = cnn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
            String strSelect = "select * from tblUser where account ='" + account + "'";
            rs = stm.executeQuery(strSelect);
            while (rs.next()) {                
                return rs.getString(3);
            }
        } catch (Exception e) {
            System.out.println("Login eror:" + e.getMessage());
        }
        return "";
    }

    public boolean checkAccount() {
        try {
            stm = cnn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
            String strSelect = "select * from tblUser where account ='" + account + "'";
            rs = stm.executeQuery(strSelect);
            while (rs.next()) {                
                return true;
            }
        } catch (Exception e) {
            System.out.println("Login eror:" + e.getMessage());
        }
        return false;
    }

}
