/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.time.LocalDate;

/**
 *
 * @author Lenovo
 */
public class Employee {

    private int employeeId;
    private String employeeName;
    private LocalDate dob;
    private boolean gender;
    private String createby;

    public Employee() {
    }

    public Employee(int employeeId, String employeeName, LocalDate dob, boolean gender, String createby) {
        this.employeeId = employeeId;
        this.employeeName = employeeName;
        this.dob = dob;
        this.gender = gender;
        this.createby = createby;
    }

    public int getEmployeeId() {
        return employeeId;
    }

    public void setEmployeeId(int employeeId) {
        this.employeeId = employeeId;
    }

    public String getEmployeeName() {
        return employeeName;
    }

    public void setEmployeeName(String employeeName) {
        this.employeeName = employeeName;
    }

    public LocalDate getDob() {
        return dob;
    }

    public void setDob(LocalDate dob) {
        this.dob = dob;
    }

    public String getGender() {
        return gender ? "Male" : "Female";
    }

    public void setGender(boolean gender) {
        this.gender = gender;
    }

    public String getCreateby() {
        return createby;
    }

    public void setCreateby(String createby) {
        this.createby = createby;
    }

}
