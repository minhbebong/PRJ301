/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.cellphonestore.model;

/**
 *
 * @author hongd
 */
public class Item {

    private Products products;
    private Color color;
    private Storage storage;
    private int quantity;

    public Item() {
    }

    public Item(Products products, Color color, Storage storage, int quantity) {
        this.products = products;
        this.color = color;
        this.storage = storage;
        this.quantity = quantity;
    }

    public Products getProducts() {
        return products;
    }

    public void setProducts(Products products) {
        this.products = products;
    }

    public Color getColor() {
        return color;
    }

    public void setColor(Color color) {
        this.color = color;
    }

    public Storage getStorage() {
        return storage;
    }

    public void setStorage(Storage storage) {
        this.storage = storage;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    @Override
    public String toString() {
        return "Item{" + "products=" + products + ", color=" + color + ", storage=" + storage + ", quantity=" + quantity + '}';
    }

    

    

    
    
}
