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
public class Storage {
    private int id;
    private String pid;
    private String storage;

    public Storage() {
    }

    public Storage(int id, String pid, String storage) {
        this.id = id;
        this.pid = pid;
        this.storage = storage;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getPid() {
        return pid;
    }

    public void setPid(String pid) {
        this.pid = pid;
    }

    public String getStorage() {
        return storage;
    }

    public void setStorage(String storage) {
        this.storage = storage;
    }
    
    
}
