/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.cellphonestore.dao;

import com.cellphonestore.model.Cart;
import com.cellphonestore.model.Color;
import com.cellphonestore.model.Item;
import com.cellphonestore.model.OrderDetails;
import com.cellphonestore.model.Orders;
import com.cellphonestore.model.ProductDetails;
import com.cellphonestore.model.Products;
import com.cellphonestore.model.Storage;
import com.cellphonestore.model.Users;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author hongd
 */
public class ProductDAO {

    Connection conn = null;
    PreparedStatement ps = null;
    ResultSet rs = null;

//    Get data function
    public List<Products> getAll() {
        List<Products> list = new ArrayList<>();
        String query = "select * from Products";
        try {
            conn = new com.cellphonestore.context.DBContext().getConnection();
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Products(rs.getInt(1), rs.getString(2), rs.getInt(3), rs.getString(4), rs.getString(5), rs.getInt(6), rs.getString(7), rs.getInt(8)));
            }
        } catch (Exception e) {
            System.out.println("Error:" + e);
        }
        return list;
    }

    public List<Color> getAllColor() {
        List<Color> list = new ArrayList<>();
        String query = "Select * from ColorDetails";
        try {
            conn = new com.cellphonestore.context.DBContext().getConnection();
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Color(rs.getInt(1), rs.getString(2), rs.getString(3)));
            }
        } catch (Exception e) {
            System.out.println("ProductDAO_getAllColor_Error: " + e);
        }
        return list;
    }

    public List<Storage> getAllStorage() {
        List<Storage> list = new ArrayList<>();
        String query = "Select * from StorageDetails";
        try {
            conn = new com.cellphonestore.context.DBContext().getConnection();
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Storage(rs.getInt(1), rs.getString(2), rs.getString(3)));
            }
        } catch (Exception e) {
            System.out.println("ProductDAO_getAllStorage_Error: " + e);
        }
        return list;
    }

    public List<Products> getTop4Offset(int amount) {
        List<Products> listTop4 = new ArrayList<>();
        String query = "Select * from Products order by id desc offset ? rows fetch next 4 rows only";
        try {
            conn = new com.cellphonestore.context.DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setInt(1, amount);
            rs = ps.executeQuery();
            while (rs.next()) {
                listTop4.add(new Products(rs.getInt(1), rs.getString(2), rs.getInt(3), rs.getString(4), rs.getString(5), rs.getInt(6), rs.getString(7), rs.getInt(8)));
            }
        } catch (Exception e) {
            System.out.println("Error:" + e);
        }
        return listTop4;
    }

    public List<Products> paging(int check) {
        List<Products> paging = new ArrayList<>();
        String query = "Select * from Products order by id desc offset ? rows fetch next 8 rows only";
        try {
            conn = new com.cellphonestore.context.DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setInt(1, (check - 1) * 8);
            rs = ps.executeQuery();
            while (rs.next()) {
                paging.add(new Products(rs.getInt(1), rs.getString(2), rs.getInt(3), rs.getString(4), rs.getString(5), rs.getInt(6), rs.getString(7), rs.getInt(8)));
            }
        } catch (Exception e) {
            System.out.println("Error:" + e);
        }
        return paging;
    }

    public List<Products> getTop4() {
        List<Products> listTop4 = new ArrayList<>();
        String query = "Select top 4 * from Products order by id desc";
        try {
            conn = new com.cellphonestore.context.DBContext().getConnection();
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                listTop4.add(new Products(rs.getInt(1), rs.getString(2), rs.getInt(3), rs.getString(4), rs.getString(5), rs.getInt(6), rs.getString(7), rs.getInt(8)));
            }
        } catch (Exception e) {
            System.out.println("Error:" + e);
        }
        return listTop4;
    }

    public Products getProductById(String id) {
        String query = "Select * from Products where pid = ?";
        try {
            conn = new com.cellphonestore.context.DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, id);
            rs = ps.executeQuery();
            if (rs.next()) {
                return new Products(rs.getInt(1), rs.getString(2), rs.getInt(3), rs.getString(4), rs.getString(5), rs.getInt(6), rs.getString(7), rs.getInt(8));
            }
        } catch (Exception e) {
            System.out.println("Error" + e);
        }
        return null;
    }

    public Products getProductById2(int id) {
        String query = "Select * from Products where id = ?";
        try {
            conn = new com.cellphonestore.context.DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setInt(1, id);
            rs = ps.executeQuery();
            if (rs.next()) {
                return new Products(rs.getInt(1), rs.getString(2), rs.getInt(3), rs.getString(4), rs.getString(5), rs.getInt(6), rs.getString(7), rs.getInt(8));
            }
        } catch (Exception e) {
            System.out.println("Error" + e);
        }
        return null;
    }

    public ProductDetails getInfoById(String id) {
        String query = "Select * from ProductDetails where pid = ?";
        try {
            conn = new com.cellphonestore.context.DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, id);
            rs = ps.executeQuery();
            if (rs.next()) {
                return new ProductDetails(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getString(6), rs.getString(7), rs.getString(8), rs.getString(9), rs.getString(10));
            }
        } catch (Exception e) {
            System.out.println("Error" + e);
        }
        return null;
    }

    public List<Color> getColorById(String id) {
        List<Color> color = new ArrayList<>();
        String query = "Select * from ColorDetails where pid = ? order by id asc";
        try {
            conn = new com.cellphonestore.context.DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, id);
            rs = ps.executeQuery();
            while (rs.next()) {
                color.add(new Color(rs.getInt(1), rs.getString(2), rs.getString(3)));
            }
        } catch (Exception e) {
            System.out.println("Error" + e);
        }
        return color;
    }

    public Color getColorByCid(int id) {
        String query = "Select * from ColorDetails where id = ? order by id asc";
        try {
            conn = new com.cellphonestore.context.DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setInt(1, id);
            rs = ps.executeQuery();
            if (rs.next()) {
                return new Color(rs.getInt(1), rs.getString(2), rs.getString(3));
            }
        } catch (Exception e) {
            System.out.println("ProductDAO_getColorByCid_Error: " + e);
        }
        return null;
    }

    public Storage getStorageBySid(int id) {
        String query = "Select * from StorageDetails where id = ? order by id asc";
        try {
            conn = new com.cellphonestore.context.DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setInt(1, id);
            rs = ps.executeQuery();
            if (rs.next()) {
                return new Storage(rs.getInt(1), rs.getString(2), rs.getString(3));
            }
        } catch (Exception e) {
            System.out.println("ProductDAO_getStorageBySid_Error: " + e);
        }
        return null;
    }

    public List<Storage> getStorageById(String id) {
        List<Storage> storage = new ArrayList<>();
        String query = "Select * from StorageDetails where pid = ? order by id asc";
        try {
            conn = new com.cellphonestore.context.DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, id);
            rs = ps.executeQuery();
            while (rs.next()) {
                storage.add(new Storage(rs.getInt(1), rs.getString(2), rs.getString(3)));
            }
        } catch (Exception e) {
            System.out.println("Error" + e);
        }
        return storage;
    }

    public List<Products> search(String key) {
        List<Products> list = new ArrayList<>();
        String query = "Select * from Products where name like ?";
        try {
            conn = new com.cellphonestore.context.DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, "%" + key + "%");
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Products(rs.getInt(1), rs.getString(2), rs.getInt(3), rs.getString(4), rs.getString(5), rs.getInt(6), rs.getString(7), rs.getInt(8)));
            }
        } catch (Exception e) {
            System.out.println("Error" + e);
        }
        return list;
    }

    public List<Products> searchByPrice(int min_raw, int max_raw) {
        List<Products> list = new ArrayList<>();
        String query = "Select * from Products where price between ? and ? order by price asc";
        try {
            int min = min_raw * 1000000;
            int max = max_raw * 1000000;
            conn = new com.cellphonestore.context.DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setInt(1, min);
            ps.setInt(2, max);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Products(rs.getInt(1), rs.getString(2), rs.getInt(3), rs.getString(4), rs.getString(5), rs.getInt(6), rs.getString(7), rs.getInt(8)));
            }
        } catch (Exception e) {
            System.out.println("Error" + e);
        }
        return list;
    }

//    public List<Products> searchFilter(){
//    
//    }
    public List<Products> productByCid(int key) {
        List<Products> list = new ArrayList<>();
        String query = "Select * from Products where cid = ? order by price asc";
        try {
            conn = new com.cellphonestore.context.DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setInt(1, key);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Products(rs.getInt(1), rs.getString(2), rs.getInt(3), rs.getString(4), rs.getString(5), rs.getInt(6), rs.getString(7), rs.getInt(8)));
            }
        } catch (Exception e) {
            System.out.println("Error" + e);
        }
        return list;
    }

    public List<Orders> getOrderByUname(String uname) {
        List<Orders> list = new ArrayList<>();
        String query = "Select * from Orders where uname = ?";
        try {
            conn = new com.cellphonestore.context.DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, uname);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Orders(rs.getInt(1), rs.getString(2), rs.getDate(3), rs.getInt(4)));
            }
        } catch (Exception e) {
            System.out.println("ProductDAO_getOrderByUname_Error: " + e);
        }
        return list;
    }

    public List<OrderDetails> getOrderDetailsById(int id) {
        List<OrderDetails> list = new ArrayList<>();
//        List<Products> list2 = new ArrayList<>();
        String query = "Select * from OrderDetails where oid = ?";
        try {
            Connection conn1 = new com.cellphonestore.context.DBContext().getConnection();
            PreparedStatement ps1 = conn1.prepareStatement(query);
            ps1.setInt(1, id);
            ResultSet rs1 = ps1.executeQuery();
            while (rs1.next()) {
                String pid = rs1.getString(2);
                Products products = getProductById(pid);
                list.add(new OrderDetails(rs1.getInt(1), products, rs1.getInt(3), rs1.getNString(4), rs1.getNString(5), rs1.getInt(6), rs1.getInt(7), rs1.getString(8), rs1.getNString(9)));
            }
        } catch (Exception e) {
            System.out.println("ProductDAO_getOrderDetailsById_Error: " + e);
        }
        return list;
    }

//    Add function
    public Products addProduct(Products products) {
        String query = "INSERT INTO Products(pid,cid,[name],[image],price,[description],[amount])\n"
                + "VALUES (?,?,?,?,?,?,?)";
        try {
            conn = new com.cellphonestore.context.DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, products.getPid());
            ps.setInt(2, products.getCid());
            ps.setNString(3, products.getName());
            ps.setNString(4, products.getImage());
            ps.setInt(5, products.getPrice());
            ps.setNString(6, products.getDescription());
            ps.setInt(7, products.getAmount());
            ps.executeUpdate();
        } catch (Exception e) {
            System.out.println("Error" + e);
        }
        return null;
    }

    public ProductDetails addPDetail(ProductDetails pd) {
        String query = "Insert into ProductDetails(pid,screen,os,rearcam,frontcam,soc,ram,sim,battery)\n"
                + "values(?,?,?,?,?,?,?,?,?)";
        try {
            conn = new com.cellphonestore.context.DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, pd.getPid());
            ps.setString(2, pd.getScreen());
            ps.setString(3, pd.getOs());
            ps.setString(4, pd.getRearcam());
            ps.setString(5, pd.getFrontcam());
            ps.setString(6, pd.getSoc());
            ps.setString(7, pd.getRam());
            ps.setNString(8, pd.getSim());
            ps.setNString(9, pd.getBattery());
            ps.executeUpdate();
        } catch (Exception e) {
            System.out.println("Error" + e);
        }

        return null;
    }

    public Color addColor(Color c) {
        String query = "Insert into ColorDetails(pid, color)\n"
                + "values(?,?)";

        try {
            conn = new com.cellphonestore.context.DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, c.getPid());
            ps.setNString(2, c.getColor());
            ps.executeUpdate();
        } catch (Exception e) {
            System.out.println("Error: " + e);
        }
        return null;
    }

    public Storage addStorage(Storage st) {
        String query = "Insert into StorageDetails(pid,storage)\n"
                + "values(?,?)";
        try {
            conn = new com.cellphonestore.context.DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, st.getPid());
            ps.setString(2, st.getStorage());
            ps.executeUpdate();
        } catch (Exception e) {
            System.out.println("Error: " + e);
        }
        return null;
    }

    public void addOrder(Users a, Cart cart, String des) {
//        LocalDate currentDate = LocalDate.now();
        String sql1 = "Insert into Orders(uname,orderdate,total) values(?,GETDATE(),?)";
        try {
            //Add order
            Connection conn1 = new com.cellphonestore.context.DBContext().getConnection();
            PreparedStatement ps1 = conn1.prepareStatement(sql1);
            ps1.setString(1, a.getUsername());
            ps1.setInt(2, cart.getTotalMoney());
            ps1.executeUpdate();
            //Get Newest Id order
            String sql2 = "Select top 1 id from Orders order by id desc";
            Connection conn2 = new com.cellphonestore.context.DBContext().getConnection();
            PreparedStatement ps2 = conn2.prepareStatement(sql2);
            ResultSet rs2 = ps2.executeQuery();
            //
            if (rs2.next()) {
                int oid = rs2.getInt(1);
                for (Item i : cart.getItems()) {
                    Connection conn3 = new com.cellphonestore.context.DBContext().getConnection();
                    String sql3 = "Insert into OrderDetails values(?,?,?,?,?,?,?,?,?)";
                    PreparedStatement ps3 = conn3.prepareStatement(sql3);
                    ps3.setInt(1, oid);
                    ps3.setString(2, i.getProducts().getPid());
                    ps3.setInt(3, i.getQuantity());
                    ps3.setNString(4, i.getColor().getColor());
                    ps3.setString(5, i.getStorage().getStorage());
                    ps3.setInt(6, i.getProducts().getPrice());
                    ps3.setInt(7, i.getQuantity() * i.getProducts().getPrice());
                    ps3.setString(8, "pd");
                    ps3.setNString(9, des);
                    ps3.executeUpdate();
                }
            }
            //
            String sql4 = "Update Products set amount = amount - ? where pid = ?";
            Connection conn4 = new com.cellphonestore.context.DBContext().getConnection();
            PreparedStatement ps4 = conn4.prepareStatement(sql4);
            for (Item i : cart.getItems()) {
                ps4.setInt(1, i.getQuantity());
                ps4.setString(2, i.getProducts().getPid());
                ps4.executeUpdate();
            }
        } catch (Exception e) {
            System.out.println("ProductDAO_addOrder_Error: " + e);
        }
    }

    //Select for admin
    public int maxOrder() {
        String query = "Select Max(total) as total from Orders ";
        try {
            conn = new com.cellphonestore.context.DBContext().getConnection();
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            if (rs.next()) {
                int total = rs.getInt(1);
                return total;
            }
        } catch (Exception e) {
        }
        return 0;
    }

    public int totalFinance() {
        String query = "Select Sum(total) as total from Orders";
        try {
            conn = new com.cellphonestore.context.DBContext().getConnection();
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            if (rs.next()) {
                int total = rs.getInt(1);
                return total;
            }
        } catch (Exception e) {
        }
        return 0;
    }

    public String bestSell() {
        String query = "Select top 1 [name] , sum(quantity) as total from OrderDetails as od, Products as p\n"
                + "where od.pid = p.pid\n"
                + "group by p.name\n"
                + "order by sum(quantity) desc";

        try {
            conn = new com.cellphonestore.context.DBContext().getConnection();
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            if (rs.next()) {
                String best = rs.getString(1);
                int quantity = rs.getInt(2);
                return best + " (" + quantity + ")";
            }

        } catch (Exception e) {
        }
        return null;
    }

    public List<Products> bestSellTop4() {
        List<Products> list = new ArrayList<>();
        String query = "Select top 4 p.id, p.pid, p.cid, p.name, p.image, p.price, p.description, p.amount from OrderDetails as od, Products as p\n"
                + "where od.pid = p.pid\n"
                + "group by p.id, p.pid, p.cid, p.name, p.image, p.price, p.description, p.amount\n"
                + "order by sum(quantity) desc";

        try {
            conn = new com.cellphonestore.context.DBContext().getConnection();
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Products(rs.getInt(1), rs.getString(2), rs.getInt(3), rs.getString(4), rs.getString(5), rs.getInt(6), rs.getString(7), rs.getInt(8)));
            }
        } catch (Exception e) {
            System.out.println("Error: " + e);
        }
        return list;
    }

    public List<Products> bestSellTop5() {
        List<Products> list = new ArrayList<>();
        String query = "Select top 5 p.id, p.pid, p.cid, p.name, p.image, p.price, p.description, sum(od.quantity) from OrderDetails as od, Products as p\n"
                + "where od.pid = p.pid\n"
                + "group by p.id, p.pid, p.cid, p.name, p.image, p.price, p.description, od.quantity\n"
                + "order by sum(quantity) desc";

        try {
            conn = new com.cellphonestore.context.DBContext().getConnection();
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Products(rs.getInt(1), rs.getString(2), rs.getInt(3), rs.getString(4), rs.getString(5), rs.getInt(6), rs.getString(7), rs.getInt(8)));
            }
        } catch (Exception e) {
            System.out.println("Error: " + e);
        }
        return list;
    }
    
    public List<Orders> valueTop5(){
        List<Orders> list = new ArrayList<>();
        String query = "Select top 5 * from Orders order by total desc";
        try {
            conn = new com.cellphonestore.context.DBContext().getConnection();
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {                
                list.add(new Orders(rs.getInt(1), rs.getString(2), rs.getDate(3), rs.getInt(4)));
            }
        } catch (Exception e) {
            System.out.println("Error: " + e);
        }
        return list;
    }

    public List<Orders> newOrder() {
        String query = "select top 3 * from Orders order by id desc ";
        List<Orders> list = new ArrayList<>();
        try {
            conn = new com.cellphonestore.context.DBContext().getConnection();
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Orders(rs.getInt(1), rs.getString(2), rs.getDate(3), rs.getInt(4)));
            }
        } catch (Exception e) {
            System.out.println("ProductDAO_newOrder_Error: " + e);
        }
        return list;
    }

    public List<Orders> getAllOrders() {
        String query = "Select * from Orders";
        List<Orders> list = new ArrayList<>();
        try {
            conn = new com.cellphonestore.context.DBContext().getConnection();
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Orders(rs.getInt(1), rs.getString(2), rs.getDate(3), rs.getInt(4)));
            }
        } catch (Exception e) {
        }
        return list;
    }

    public List<Orders> listOrders(int check) {
        String query = "Select * from Orders order by id desc offset ? rows fetch next 10 rows only";
        List<Orders> list = new ArrayList<>();
        try {
            conn = new com.cellphonestore.context.DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setInt(1, (check - 1) * 10);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Orders(rs.getInt(1), rs.getString(2), rs.getDate(3), rs.getInt(4)));
            }
        } catch (Exception e) {
        }
        return list;
    }

//    Delete function
    public void deleleProductByPid(String pid) {
        String query = "Delete from Products where pid = ?";
        try {
            conn = new com.cellphonestore.context.DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, pid);
            ps.executeUpdate();
        } catch (Exception e) {
            System.out.println("Error: " + e);
        }
    }

    public void deletePDetailsByPid(String pid) {
        String query = "Delete from ColorDetails where pid = ?";
        try {
            conn = new com.cellphonestore.context.DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, pid);
            ps.executeUpdate();
        } catch (Exception e) {
            System.out.println("Error: " + e);
        }
    }

    public void deleteColorDetailByPid(String pid) {
        String query = "Delete from ProductDetails where pid = ?";
        try {
            conn = new com.cellphonestore.context.DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, pid);
            ps.executeUpdate();
        } catch (Exception e) {
            System.out.println("Error: " + e);
        }
    }

    public void deleteStorageDetailByPid(String pid) {
        String query = "Delete from StorageDetails where pid = ?";
        try {
            conn = new com.cellphonestore.context.DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, pid);
            ps.executeUpdate();
        } catch (Exception e) {
            System.out.println("Error: " + e);
        }
    }

    public void deleteColorById(int id) {
        String query = "Delete from ColorDetails where id = ?";
        try {
            conn = new com.cellphonestore.context.DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setInt(1, id);
            ps.executeUpdate();
        } catch (Exception e) {
            System.out.println("Error: " + e);
        }
    }

    public void deleteStorageById(int id) {
        String query = "Delete from StorageDetails where id = ?";
        try {
            conn = new com.cellphonestore.context.DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setInt(1, id);
            ps.executeUpdate();
        } catch (Exception e) {
            System.out.println("Error: " + e);
        }
    }

//Update function
    public void updateStatus(String status, int id) {
        String query = "Update OrderDetails set status = ? where oid = ?";
        try {
            conn = new com.cellphonestore.context.DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, status);
            ps.setInt(2, id);
            ps.executeUpdate();
        } catch (Exception e) {
            System.out.println("Error: " + e);
        }
    }

    public void updateProduct(Products p) {
        String query = "update Products set cid = ?, name = ? , image = ?, price = ?, description = ?, amount = ? where pid = ?";
        try {
            conn = new com.cellphonestore.context.DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setInt(1, p.getCid());
            ps.setString(2, p.getName());
            ps.setString(3, p.getImage());
            ps.setInt(4, p.getPrice());
            ps.setString(5, p.getDescription());
            ps.setInt(6, p.getAmount());
            ps.setString(7, p.getPid());
            ps.executeUpdate();
        } catch (Exception e) {
            System.out.println("Error: " + e);
        }
    }

    public void updateProductDetails(ProductDetails pd) {
        String query = "update ProductDetails set screen = ?, os = ?, rearcam = ?, frontcam = ?, soc = ?, ram = ?, sim = ?, battery = ? where pid = ?";
        try {
            conn = new com.cellphonestore.context.DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setNString(1, pd.getScreen());
            ps.setNString(2, pd.getOs());
            ps.setNString(3, pd.getRearcam());
            ps.setNString(4, pd.getFrontcam());
            ps.setNString(5, pd.getSoc());
            ps.setNString(6, pd.getRam());
            ps.setNString(7, pd.getSim());
            ps.setNString(8, pd.getBattery());
            ps.setNString(9, pd.getPid());
            ps.executeUpdate();
        } catch (Exception e) {
            System.out.println("Error: " + e);
        }
    }

    public void updateColor(Color c) {
        String query = "update ColorDetails set color = ? where id = ? and pid = ?";
        try {
            conn = new com.cellphonestore.context.DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setNString(1, c.getColor());
            ps.setInt(2, c.getId());
            ps.setString(3, c.getPid());
            ps.executeUpdate();
        } catch (Exception e) {
            System.out.println("Error: " + e);
        }
    }

    public void updateStorage(Storage s) {
        String query = "update StorageDetails set storage = ? where id = ? and pid = ?";
        try {
            conn = new com.cellphonestore.context.DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setNString(1, s.getStorage());
            ps.setInt(2, s.getId());
            ps.setString(3, s.getPid());
            ps.executeUpdate();
        } catch (Exception e) {
            System.out.println("Error: " + e);
        }
    }

    public static void main(String[] args) {
        com.cellphonestore.dao.ProductDAO dao = new ProductDAO();
//        Products a = dao.getProductById("OP_FIND3PRO");
        int id = 18;
        List<Products> st = dao.bestSellTop4();
//        for (Orders orders : st) {
//            System.out.println(orders.getUname());
//        }
//        List<Products> pd = dao.paging(1);
//        System.out.println(dao.getProductById("AP_13PRO"));
//        System.out.println(st.size());
//        for (Products or : st) {
//            System.out.println(or.getName());
//        }

//        for (Products products : pd) {
//            System.out.println(products.getName());
//        }
//        System.out.println(a.getName());
    }
}
