/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import model.Department;
import model.Employee;
/**
 *
 * @author Lenovo
 */
public class EmployeeDAO extends DBContext{
    public List<Employee> getAll(){
        List<Employee> list=new ArrayList<>();
        String sql="select e.id,e.name,e.dob,e.gender,e.did,d.name \n" +
                 "from Employee e inner join Department d on (e.did=d.id)";
        try{
            PreparedStatement st=connection.prepareStatement(sql);
            ResultSet rs=st.executeQuery();
            while(rs.next()){
                Employee e=new Employee();
                e.setId(rs.getInt(1));
                e.setName(rs.getString(2));
                e.setGender(rs.getBoolean(3));
                
                Department d=new Department(rs.getInt(4),
                                rs.getString(5));
                
                e.setDepartment(d);
                list.add(e);
            }
        }catch(SQLException e){
            System.out.println(e);
        }
        
        return list;
    }
    public void delete(int id){
        String sql="delete from employee where id=?";
        try{
            PreparedStatement st=connection.prepareStatement(sql);
            st.setInt(1, id);
           st.executeUpdate();
        }catch(SQLException e){
            System.out.println(e);
        }
        
    }
    
    public List<Employee> getEmployeeByDeptID(int did){
        ArrayList<Employee> list=new ArrayList<>();
        String sql="select e.id,e.name,e.dob,e.gender,e.id,"
                + "d.name from Employee e "
                + "inner join Department d " 
                +  "on e.did=d.id where d.id=?";
        try{
           PreparedStatement st=connection.prepareStatement(sql);
           st.setInt(1, did);
           ResultSet rs=st.executeQuery();
           while(rs.next()){
               Employee e=new Employee();
                e.setId(rs.getInt(1));
                e.setName(rs.getString(2));
                e.setGender(rs.getBoolean(3));
                Department d=new Department(rs.getInt(4),rs.getString(5));
                e.setDepartment(d);
               list.add(e);
           }
        }catch(SQLException e){
            System.out.println(e);
        }
        
        return list;
    }
    public Employee getEmpByID(int id){
        String sql="select * from Employee where id=?";
        try{
            PreparedStatement st=connection.prepareStatement(sql);
            st.setInt(1, id);
            ResultSet rs=st.executeQuery();
            DepartmentDAO db=new DepartmentDAO();
            if(rs.next()){
                Employee e=new Employee();
                e.setId(rs.getInt("id"));
                e.setName(rs.getString("name"));
                e.setDob(rs.getString("dob"));
                e.setGender(rs.getBoolean("gender"));
                int did=rs.getInt("did");
                
                Department d=db.getDepByID(did);
                e.setDepartment(d);
                return e;
            }
                
        }catch(SQLException e){
            System.out.println(e);
        }
        return null;
    }
    public void update(Employee e){
        String sql="update Employee set name=?,dob=?,"
                + "gender=?,did=? "
                + "where id=?";
        try{
            PreparedStatement st=connection.prepareStatement(sql);
            st.setString(1, e.getName());
            st.setBoolean(2, e.isGender());
            st.setInt(3, e.getDepartment().getId());
            st.setInt(4, e.getId());
            st.executeUpdate();
            
        }catch(SQLException ex){
            System.out.println(ex);
        }
        
    }
        public void add(Employee e) throws Exception {

        try {
            String sql = "INSERT INTO [dbo].[Employee]\n" +
"           ([id]\n" +
"           ,[name]\n" +
"           ,[dob]\n" +
"           ,[gender]\n" +
"           ,[did])\n" +
"     VALUES\n" +
"           (?\n" +
"           ,?,>\n" +
"           ,?\n" +
"           ,?\n" +
"           ,?)";
                PreparedStatement st=connection.prepareStatement(sql);
                st.setInt(1, e.getId());
            st.setString(2, e.getName());
            st.setBoolean(3, e.isGender());
            st.setInt(4, e.getDepartment().getId());
            st.executeUpdate();

        } catch (SQLException ex) {
        }

    }
//        public static void main(String[] args) throws Exception {
//        EmployeeDAO daoe = new EmployeeDAO();
//        daoe.add(new Employee(0, "7", "12/04/2012", true, new Department().getId()));
//    }
}
