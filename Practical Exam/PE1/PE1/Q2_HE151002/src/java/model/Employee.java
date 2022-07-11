/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.sql.Date;

/**
 *
 * @author Lenovo
 */
public class Employee {
    private int id;
    private String name;
    private Date date;
    private boolean gender;
    private String mra;

    public Employee(int id, String name, Date date, boolean gender, String mra) {
        this.id = id;
        this.name = name;
        this.date = date;
        this.gender = gender;
        this.mra = mra;
    }

    
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public boolean isGender() {
        return gender;
    }

    public void setGender(boolean gender) {
        this.gender = gender;
    }

    public String getMra() {
        return mra;
    }

    public void setMra(String mra) {
        this.mra = mra;
    }
    
    
}
