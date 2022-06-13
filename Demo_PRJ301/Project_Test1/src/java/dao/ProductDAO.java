/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import Model.type_Product;
import context.DBContext;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.ArrayList;

/**
 *
 * @author Lenovo
 */
public class ProductDAO {
     public ProductDAO() {
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
    
    
    public ArrayList<type_Product> getType() {
        ArrayList<type_Product> list = new ArrayList<type_Product>();
        try {
            stm = cnn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
            String strSelect = "select * from Type_Product";
            rs = stm.executeQuery(strSelect);
            while (rs.next()) {
                type_Product u = new type_Product();
                u.setId(rs.getInt("Id"));
                u.setImage(rs.getString("ImAgE"));
                u.setType_Name(rs.getString("NaMe"));
                list.add(u);
            }
        } catch (Exception e) {
            System.out.println("checkDOByAccount eror:" + e.getMessage());
        }
        return list;
    }

}
