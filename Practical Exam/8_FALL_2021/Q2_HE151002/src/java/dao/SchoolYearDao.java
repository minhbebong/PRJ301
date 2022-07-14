/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import dal.DBContext;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import model.SchoolYear;

/**
 *
 * @author Lenovo
 */
public class SchoolYearDao extends DBContext {

    public void save(String title, Date startDate, Date endDate) {
        try {
            //mo ket noi
            String sql = "INSERT INTO [dbo].[SchoolYear]\n"
                    + "           ([title]\n"
                    + "           ,[startdate]\n"
                    + "           ,[enddate])\n"
                    + "     VALUES\n"
                    + "           (?,?,?)";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, title);
            ps.setDate(2, startDate);
            ps.setDate(3, endDate);
            ps.executeUpdate();

        } catch (Exception ex) {
            ex.printStackTrace(System.out);
        }
    }

}
