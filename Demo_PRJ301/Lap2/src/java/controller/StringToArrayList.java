/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package controller;

import java.util.ArrayList;

/**
 *
 * @author BachDuc
 */
public class StringToArrayList {
    public static ArrayList<Object> ToArray(String str) {
        
        str=str.replaceAll("\\[", "");
        str=str.replaceAll("\\]", "");
        String strarr[]=str.split(",");
        
        ArrayList<Object> list = new ArrayList<>();
        
        for (int i = 0; i < strarr.length; i++) {
            list.add(strarr[i]);
        }
        
        return list;
    }
    
//    public static void main(String[] args) {
//        System.out.println(new StringToArrayList().ToArray("[1,2,3]"));
//    }
    
}
