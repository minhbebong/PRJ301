/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;
import context.DBContext;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import model.CharacterModel;
import model.Skill;
/**
 *
 * @author Lenovo
 */
public class CharacterDAO {

    public List<CharacterModel> getAll() {
        try {
            List<CharacterModel> list = new ArrayList<>();
            //mo ket noi
            Connection conn = new DBContext().getConnection();
            String sql = "select * from Characters";
            PreparedStatement ps = conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                List<Skill> listSkills = new SkillDAO().getSkillsByCid(rs.getString(1));
                CharacterModel characterModel = new CharacterModel(rs.getString(1), rs.getString(2), rs.getBoolean(3), rs.getDate(4), listSkills);
                list.add(characterModel);
            }
            return list;
        } catch (Exception ex) {
            ex.printStackTrace(System.out);
        }
        return null;
    }
    
}

