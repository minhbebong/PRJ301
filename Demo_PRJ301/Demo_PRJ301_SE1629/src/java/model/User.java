/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

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

}
