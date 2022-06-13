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
public class NPrimeGreaterThanN {

    public static ArrayList<Integer> NPrime(int n) {
        int count = 0;
        int num = n;
        ArrayList<Integer> mylist =new ArrayList<>();
        while (count != n) {
            if (new IsPrime().PrimeCheck(num)) {
                mylist.add(num);
                count++;
            }
            num++;
        }
        return mylist;
    }
    public static void main(String[] args) {
        System.out.println(new NPrimeGreaterThanN().NPrime(13));
//        System.out.println(new NPrimeGreaterThanN().NPrime(10).size());
    }
}
