/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package db;

import context.DBContext;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.iNumber;

/**
 *
 * @author Admin
 */
public class NumberDAO extends DBContext {

    Connection conn;
    PreparedStatement stm;
    ResultSet rs;

//    public ArrayList<iNumber> getAll() {
//        try {
//            String query = "SELECT * from TaskList";
//            conn = new DBContext().getConnection();
//            stm = conn.prepareStatement(query);
//            rs = stm.executeQuery();
//            ArrayList<iNumber> num = new ArrayList<>();
//            while (rs.next()) {
//                iNumber n = new iNumber(rs.getInt(1), rs.getString(2));
//                num.add(n);
//            }
//            return num;
//        } catch (Exception ex) {
//            Logger.getLogger(NumberDAO.class.getName()).log(Level.SEVERE, null, ex);
//        }
//        return null;
//    }
    public void Add(int numN, String result) throws SQLException {
        String sql = "insert into tblNumber values(" + numN + ",'" + result + "')";
        Statement statement = connection.createStatement();
        statement.execute(sql);
    }
    public void update(int numN,String result) throws SQLException{
        String sql ="Update tblNumber Set sResult ='"+result+"' where iNum ="+numN;
        Statement statement = connection.createStatement();
        statement.execute(sql);
    }
//    public registerInfo getData(String username, String pass) throws SQLException {
//        String sql = "select * from registerInfo where Username ='" + username + "' and Password = '" + pass + "'";
//        try {
//            PreparedStatement st = connection.prepareStatement(sql);
//            ResultSet rs = st.executeQuery();
//            while (rs.next()) {
//                return new registerInfo(rs.getInt("id"),
//                        rs.getString("First_Name"),
//                        rs.getString("Last_Name"),
//                        rs.getString("Birthday"),
//                        rs.getString("Gender"),
//                        rs.getString("Email"),
//                        rs.getInt("PhoneNumber"),
//                        rs.getString("Username"),
//                        rs.getString("Password"),
//                        rs.getString("Address"),
//                        rs.getString("CurrentJob"));
//            }
//        } catch (SQLException e) {
//            System.out.println(e);
//        }
//        return null;
//    }
    public iNumber getData(int iNum){
        String sql ="SET ANSI_WARNINGS OFF;\n"
                + "select * from tblNumber where iNum="+iNum
                +"\n SET ANSI_WARNINGS ON;";
        try{
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while(rs.next()){
                return new iNumber(
                        rs.getInt("iNum"),
                        rs.getString("sResult"));
            }
        }catch(SQLException e){
            System.out.println(e);
        }
        return null;
    }
    public static void main(String[] args) throws SQLException {
        NumberDAO n = new NumberDAO();
        n.update(26, "1 3 5");
        System.out.println("update successful");
    }
}
