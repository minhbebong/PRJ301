/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

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

    public ArrayList<Product> getAll() {
        ArrayList<Product> list = new ArrayList<Product>();
        try {
            stm = cnn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
            String strSelect = "select * from tblProduct";
            rs = stm.executeQuery(strSelect);
            while (rs.next()) {
                String id = rs.getString(1);
                String name = rs.getString(2);
                String unit = rs.getString(3);
                String price = String.valueOf(rs.getDouble(4));
                String image = rs.getString(5);
                list.add(new Product(id, name, unit, price, image));
            }
        } catch (Exception e) {
            System.out.println("checkDOByAccount eror:" + e.getMessage());
        }
        return list;
    }

    public ArrayList<Product> getListByPage(ArrayList<Product> listAll, int start, int end) {
        ArrayList<Product> list = new ArrayList<Product>();

        for (int i = start; i <= end; i++) {
            list.add(listAll.get(i));
        }
        return list;
    }

    public void deletebyId(String id) {
        try {
            stm = cnn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
            String strDelete = "Delete from tblProduct where productid='" + id + "'";
            stm.execute(strDelete);

        } catch (Exception e) {
            System.out.println("Delete eror:" + e.getMessage());
        }
    }

    public void updatebyProduct(String id, String name, String unit, String price, String image) {
        try {
            stm = cnn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
            String strUpdateProduct = "Update tblProduct set name = '"+name+"'"
                    + " unit = '"+unit+"'price = '"+price+"' imgage = '"+image+"'"
                    + " where productid='" + id + "'";
            stm.execute(strUpdateProduct);

        } catch (Exception e) {
            System.out.println("Update eror:" + e.getMessage());
        }
    }

}
