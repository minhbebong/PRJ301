/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author Admin
 */
public class iNumber {
    private int iNum;
    private String iResult;

    public iNumber() {
    }

    public iNumber(int iNum, String iResult) {
        this.iNum = iNum;
        this.iResult = iResult;
    }

    public int getiNum() {
        return iNum;
    }

    public void setiNum(int iNum) {
        this.iNum = iNum;
    }

    public String getiResult() {
        return iResult;
    }

    public void setiResult(String iResult) {
        this.iResult = iResult;
    }

    @Override
    public String toString() {
        return "Number{" + "iNum=" + iNum + ", iResult=" + iResult + '}';
    }
    
}
