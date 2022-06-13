/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package controller;

import java.util.ArrayList;
import java.util.Collections;

/**
 *
 * @author BachDuc
 */
public class Divisor {

    public static ArrayList<Integer> DiArr(int n) {
        ArrayList<Integer> mylist = new ArrayList<>();
        for (int i = 1; i < n; i++) {
            if (n % i == 0) {
             if( new IsPrime().PrimeCheck(i)==true){
                mylist.add(i);
             }
            }
        }
        return mylist;
    }

    public static void main(String[] args) {
        System.out.println(new Divisor().DiArr(1000).toString());
    }
}
