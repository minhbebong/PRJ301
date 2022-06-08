package context;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBContext1 {

    public Connection cnn;

    /*USE BELOW METHOD FOR YOUR DATABASE CONNECTION FOR BOTH SINGLE AND MULTILPE SQL SERVER INSTANCE(s)*/
 /*DO NOT EDIT THE BELOW METHOD, YOU MUST USE ONLY THIS ONE FOR YOUR DATABASE CONNECTION*/
    public DBContext1(){

            try {
                String url = "jdbc:sqlserver://" + serverName + ":" + portNumber + ";databaseName=" + dbName;
                Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
                cnn = DriverManager.getConnection(url, userID, password);
            } catch (Exception e) {
                System.out.println("Connect error: " + e.getMessage());
            }
 }

        /*Insert your other code right after this comment*/
 /*Change/update information of your database connection, DO NOT change name of instance variables in this class*/
        private final String serverName = "DESKTOP-PRU915R\\DBI";
        private final String dbName = "ProductOrder";
        private final String portNumber = "1433";
        private final String userID = "sa";
        private final String password = "123";
    
}