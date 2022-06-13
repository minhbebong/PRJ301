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
public class ProductDetails {
    private int id;
    private String pid;
    private String screen;
    private String os;
    private String rearcam;
    private String frontcam;
    private String soc;
    private String ram;
    private String sim;
    private String battery;

    public ProductDetails() {
    }

    public ProductDetails(int id, String pid, String screen, String os, String rearcam, String frontcam, String soc, String ram, String sim, String battery) {
        this.id = id;
        this.pid = pid;
        this.screen = screen;
        this.os = os;
        this.rearcam = rearcam;
        this.frontcam = frontcam;
        this.soc = soc;
        this.ram = ram;
        this.sim = sim;
        this.battery = battery;
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

    public String getScreen() {
        return screen;
    }

    public void setScreen(String screen) {
        this.screen = screen;
    }

    public String getOs() {
        return os;
    }

    public void setOs(String os) {
        this.os = os;
    }

    public String getRearcam() {
        return rearcam;
    }

    public void setRearcam(String rearcam) {
        this.rearcam = rearcam;
    }

    public String getFrontcam() {
        return frontcam;
    }

    public void setFrontcam(String frontcam) {
        this.frontcam = frontcam;
    }

    public String getSoc() {
        return soc;
    }

    public void setSoc(String soc) {
        this.soc = soc;
    }

    public String getRam() {
        return ram;
    }

    public void setRam(String ram) {
        this.ram = ram;
    }

    public String getSim() {
        return sim;
    }

    public void setSim(String sim) {
        this.sim = sim;
    }

    public String getBattery() {
        return battery;
    }

    public void setBattery(String battery) {
        this.battery = battery;
    }
    
    
}
