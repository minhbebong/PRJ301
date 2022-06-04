/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import context.DBContext;
import java.sql.Connection;

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
        return("admin".equals(account) && "123".equals(pass));
        //Check account va pass co tồn tại trong DB không ?
        
    }
    //Khai báo thành phần xử lí cơ sở dũ liệu
    Connection cnn;//Kết nối CSDL
    private void connectDB() {
        try {
            cnn = (new DBContext()).getConnection();
            System.out.println("Connect successfully");
        } catch (Exception e) {
            System.out.println("Connect error" + e.getMessage());
        }
    }

}
