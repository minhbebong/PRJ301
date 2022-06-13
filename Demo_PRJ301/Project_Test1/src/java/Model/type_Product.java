/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

/**
 *
 * @author Lenovo
 */
public class type_Product {

    private int id;
    private String image;
    private String type_Name;

    public type_Product() {
    }

    public type_Product(int id, String image, String type_Name) {
        this.id = id;
        this.image = image;
        this.type_Name = type_Name;
    }
    
    

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public String getType_Name() {
        return type_Name;
    }

    public void setType_Name(String type_Name) {
        this.type_Name = type_Name;
    }

    @Override
    public String toString() {
        return "type_Product{" + "id=" + id + ", image=" + image + ", type_Name=" + type_Name + '}';
    }
    
    
    
    

}
