package context;

import controller.StringToArrayList;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

public class DBContext {

    /*USE BELOW METHOD FOR YOUR DATABASE CONNECTION FOR BOTH SINGLE AND MULTILPE SQL SERVER INSTANCE(s)*/
 /*DO NOT EDIT THE BELOW METHOD, YOU MUST USE ONLY THIS ONE FOR YOUR DATABASE CONNECTION*/
    public Connection DBContext() throws ClassNotFoundException {
        Connection connection;
        try {
            //Change the username password and url to connect your own database
            String username = "sa";
            String password = "123";
            String serverName = "DESKTOP-PRU915R\\DBI";
            String dbName = "Test";
            String portNumber = "1433";
            String url = "jdbc:sqlserver://"+serverName+":"+portNumber +";databaseName="+dbName;
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            connection = DriverManager.getConnection(url, username, password);
            return connection;
        } catch (SQLException ex) {
            Logger.getLogger(DBContext.class.getName()).log(Level.SEVERE, null, ex);
            return null;
        }
    }

    public ArrayList<String> AllNum() throws ClassNotFoundException {
        Connection connection = DBContext();
        ArrayList<String> list = new ArrayList<String>();
        try {
            PreparedStatement pr = null;
            ResultSet rs = null;
            pr = connection.prepareStatement("select * from tblNumber");
            rs = pr.executeQuery();
            while (rs.next()) {
                list.add(rs.getString(1) + " " + rs.getString(2));
            }
            return list;
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    public boolean AddNum(int num, ArrayList<Integer> list) throws ClassNotFoundException {
        Connection connection = DBContext();
        try {
            PreparedStatement pr = null;
            pr = connection.prepareStatement("insert into tblNumber(iNum,sResult) values(?,?)");
            pr.setString(1, String.valueOf(num));
            pr.setString(2, String.valueOf(list.toString()));
            pr.executeUpdate();
            return true;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    public ArrayList<Object> GetNum(int num) throws ClassNotFoundException {
        Connection connection = DBContext();
        try {
            PreparedStatement pr = null;
            ResultSet rs = null;
            pr = connection.prepareStatement("select * from tblNumber where iNum=?");
            pr.setString(1, String.valueOf(num));
            rs = pr.executeQuery();
            rs.next();
            return new StringToArrayList().ToArray(rs.getString(2));
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    public static void main(String[] args) throws ClassNotFoundException {
//        System.out.println(new DBContext().GetNum(4));

//         ArrayList<Integer> list = new ArrayList<>();
//              for (int i = 0; i < Integer.parseInt("5"); i++) {
//                 if(new isEvent().isEven(i)){
//                     list.add(i);
//                 }
//              }
//                  new DBContext().AddNum(Integer.parseInt("5"), list);
        System.out.println(new DBContext().GetNum(3).toString());

    }
}
