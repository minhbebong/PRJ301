/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.cellphonestore.model;

import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author hongd
 */
public final class Cart {

    private List<Item> items = new ArrayList<>();
    private int total = 0;

    public Cart() {
    }

    public Cart(int total) {
        this.total = total;
    }

    public List<Item> getItems() {
        return items;
    }

    public void setItems(List<Item> items) {
        this.items = items;
    }

    public int getTotal() {
        return total;
    }

    public void setTotal(int total) {
        this.total = total;
    }

    public Item getItemById(int id, int cid, int sid){
        for (Item item : items) {
            if (item.getProducts().getId() == id && item.getColor().getId() == cid && item.getStorage().getId() == sid) {
                return item;
            }
        }
        return null;
    }
    
    public Products getProductsById(int id, List<Products> list){
        for (Products products : list) {
            if (products.getId() == id) {
                return products;
            }
        }
        return null;
    }
    
    public Color getColorsById(int cid, List<Color> list){
        for (Color color : list) {
            if (color.getId() == cid) {
                return color;
            }
        }
        return null;
    }
    
    public Storage getStorageById(int sid, List<Storage> list){
        for (Storage storage : list) {
            if (storage.getId() == sid) {
                return storage;
            }
        }
        return  null;
    }
    
    public void removeItem(int id, int cid, int sid){
        if (getItemById(id,cid,sid)!=null) {
            items.remove(getItemById(id,cid,sid));
        }
    }
    
    public void addItem(Item item){
//        System.out.println(item.getProducts().getId()+" "+item.getColor().getId()+" "+item.getStorage().getId());
        if (getItemById(item.getProducts().getId(), item.getColor().getId(), item.getStorage().getId())!=null  ) {
            Item itemInList = getItemById(item.getProducts().getId(), item.getColor().getId(), item.getStorage().getId());
            itemInList.setQuantity(itemInList.getQuantity()+item.getQuantity());
        } else {
            items.add(item);
        }
    }
    
    public int getQuantityById(int id, int cid, int sid){
//        System.out.println(getItemById(id,cid,sid).getQuantity());
        return getItemById(id,cid,sid).getQuantity();
    }
    
    public int getTotalMoney(){
        for (Item item : items) {
            total+=(item.getQuantity()*item.getProducts().getPrice());
        }
        return total;
    }
    
    
    public Cart(String txt, List<Products> list, List<Color> listc, List<Storage> lists){
        try {
            if (txt != null && !txt.isEmpty()) {
                String s[] = txt.split(",");
                for (String string : s) {
                    String split[] =string.split(":");
                    int id = Integer.parseInt(split[0]);
                    int cid = Integer.parseInt(split[2]);
                    int sid = Integer.parseInt(split[3]);
                    int quantity = Integer.parseInt(split[1]);
                    Products pdt = getProductsById(id, list);
                    Color cl = getColorsById(cid, listc);
                    Storage sl = getStorageById(sid, lists);
                    Item item = new Item(pdt, cl, sl, quantity);
                    addItem(item);
                }
            }
        } catch (NumberFormatException e) {
            System.out.println("Cart_Error: "+e);
        }
    }
    
}
