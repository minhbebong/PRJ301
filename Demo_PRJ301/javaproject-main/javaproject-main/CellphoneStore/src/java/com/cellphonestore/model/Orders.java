/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.cellphonestore.model;

import java.sql.Date;

/**
 *
 * @author hongd
 */
public class Orders {

    private int id;
    private String uname;
    private Date orderdate;
    private int total;

    public Orders() {
    }

    public Orders(int id, String uname, Date orderdate, int total) {
        this.id = id;
        this.uname = uname;
        this.orderdate = orderdate;
        this.total = total;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getUname() {
        return uname;
    }

    public void setUname(String uname) {
        this.uname = uname;
    }

    public Date getOrderdate() {
        return orderdate;
    }

    public void setOrderdate(Date orderdate) {
        this.orderdate = orderdate;
    }

    public int getTotal() {
        return total;
    }

    public void setTotal(int total) {
        this.total = total;
    }

    
}
