/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import context.DBContext1;
import java.sql.ResultSet;
import java.sql.Statement;

/**
 *
 * @author Lenovo
 */
//Xử lí với bảng Product
public class UserDAO1 extends DBContext1{
    
    public UserDAO1() {
        
    }
    
    Statement stm;//Thực hiện các câu lệnh sql
    ResultSet rs;//Lưu trữ và xử lí dữ liệu

    public boolean checkLogin(String account, String pass) {
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

    

    public String getNameByAcount(String account) {
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

    public boolean checkAccount(String account) {
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
