/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.sql.Date;

/**
 *
 * @author Admin
 */
public class Member {
    int id;
    String name;
    Date dob;
    boolean isGold;
    Account createBy;

    public Member(int id, String name, Date dob, boolean isGold, Account createBy) {
        this.id = id;
        this.name = name;
        this.dob = dob;
        this.isGold = isGold;
        this.createBy = createBy;
    }

    public Member(int id, String name, Date dob, boolean isGold) {
        this.id = id;
        this.name = name;
        this.dob = dob;
        this.isGold = isGold;
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

    public Date getDob() {
        return dob;
    }

    public void setDob(Date dob) {
        this.dob = dob;
    }

    public boolean isIsGold() {
        return isGold;
    }

    public void setIsGold(boolean isGold) {
        this.isGold = isGold;
    }

    public Account getCreateBy() {
        return createBy;
    }

    public void setCreateBy(Account createBy) {
        this.createBy = createBy;
    }
    
}
