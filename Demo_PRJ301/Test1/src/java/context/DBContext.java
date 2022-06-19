package context;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBContext {
    protected Connection connection;
    public DBContext()
    {
        try {
            // Edit URL , username, password to authenticate with your MS SQL Server
            String username = "sa";
            String password = "123";
            String serverName = "DESKTOP-PRU915R\\DBI";
            String dbName = "Test";
            String portNumber = "1433";
            String url = "jdbc:sqlserver://"+serverName+":"+portNumber +";databaseName="+dbName;
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            connection = DriverManager.getConnection(url, username, password);
        } catch (ClassNotFoundException | SQLException ex) {
            System.out.println(ex);
        }
    }
}
