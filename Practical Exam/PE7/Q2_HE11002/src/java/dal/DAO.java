/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import model.Account;

/**
 *
 * @author Lenovo
 */
public class DAO extends DBContext {

    PreparedStatement stm;
    ResultSet rs;

    public Account checkLogin(Account account) {
        String sql = "SELECT *\n"
                + "FROM[PE_PRJ_21SUMB1].[dbo].[Account]\n"
                + "WHERE username ='" + account.getUser() + "'"
                + "AND [password] ='" + account.getPass() + "'";
        try {
            stm = connection.prepareStatement(sql);
            rs = stm.executeQuery();
            while (rs.next()) {
                account = new Account(rs.getString(1), rs.getString(2));
                return account;
            }
        } catch (Exception e) {

        }
        return null;
    }

}
