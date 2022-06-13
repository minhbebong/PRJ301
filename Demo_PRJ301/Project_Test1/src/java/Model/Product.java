/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

/**
 *
 * @author Lenovo
 */
public class Product {

    private int id;
    private String image;
    private int id_Type;
    private double price;
    private int quantity;
    private String original;
    private float discount;

    public Product() {
    }

    public Product(int id, String image, int id_Type, double price, int quantity, String original, float discount) {
        this.id = id;
        this.image = image;
        this.id_Type = id_Type;
        this.price = price;
        this.quantity = quantity;
        this.original = original;
        this.discount = discount;
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

    public int getId_Type() {
        return id_Type;
    }

    public void setId_Type(int id_Type) {
        this.id_Type = id_Type;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public String getOriginal() {
        return original;
    }

    public void setOriginal(String original) {
        this.original = original;
    }

    public float getDiscount() {
        return discount;
    }

    public void setDiscount(float discount) {
        this.discount = discount;
    }

    @Override
    public String toString() {
        return "Product{" + "id=" + id + ", image=" + image + ", id_Type=" + id_Type + ", price=" + price + ", quantity=" + quantity + ", original=" + original + ", discount=" + discount + '}';
    }
    
    
}
