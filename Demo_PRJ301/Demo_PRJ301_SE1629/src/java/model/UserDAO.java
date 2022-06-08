/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import context.DBContext;
import context.DBContext;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;

/**
 *
 * @author Lenovo
 */
//Xử lí với bảng Product
public class UserDAO {
    
    public UserDAO() {
        connectDB();
    }
    
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
            System.out.println("getNameByAcount eror:" + e.getMessage());
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
            System.out.println("checkAccount eror:" + e.getMessage());
        }
        return false;
    }

    public boolean checkDOByAccount(String account, String dob) {
        try {
            stm = cnn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
            String strSelect = "select * from tblUser where account ='" + account + "'and dateofbirth ='" + dob + "'";
            rs = stm.executeQuery(strSelect);
            while (rs.next()) {
                return true;
            }
        } catch (Exception e) {
            System.out.println("checkDOByAccount eror:" + e.getMessage());
        }
        return false;
    }

    public void updatePass(String account, String newpass) {
        try {
            stm = cnn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
            String strUpdate = "update tblUser set pass ='"+newpass+"'where account ='" + account + "'";
            stm.execute(strUpdate);
            
        } catch (Exception e) {
            System.out.println("update Pass eror:" + e.getMessage());
        }
        
    }
}
