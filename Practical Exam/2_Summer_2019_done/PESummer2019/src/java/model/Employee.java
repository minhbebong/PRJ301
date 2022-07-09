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

    private int eid;
    private String ename;
    private Date edob;
    private boolean egender;
    private Department department;

    public Employee() {
    }

    public Employee(int eid, String ename, Date edob, boolean egender, Department department) {
        this.eid = eid;
        this.ename = ename;
        this.edob = edob;
        this.egender = egender;
        this.department = department;
    }

    public int getEid() {
        return eid;
    }

    public void setEid(int eid) {
        this.eid = eid;
    }

    public String getEname() {
        return ename;
    }

    public void setEname(String ename) {
        this.ename = ename;
    }

    public Date getEdob() {
        return edob;
    }

    public void setEdob(Date edob) {
        this.edob = edob;
    }

    public boolean isEgender() {
        return egender;
    }

    public void setEgender(boolean egender) {
        this.egender = egender;
    }

    public Department getDepartment() {
        return department;
    }

    public void setDepartment(Department department) {
        this.department = department;
    }
    
    
}
