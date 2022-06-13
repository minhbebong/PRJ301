/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package controller;

/**
 *
 * @author BachDuc
 */
public class IsPrime {

    public static boolean PrimeCheck(int n) {
        int num = n;
        boolean flag = false;
        for (int i = 2; i <= num / 2; ++i) {
            // condition for nonprime number
            if (num % i == 0) {
                flag = true;
                break;
            }
        }

        if (!flag) {
            System.out.println(num + " is a prime number.");
            return true;
        } else {
            System.out.println(num + " is not a prime number.");
            return false;
        }
    }
    
    public static void main(String[] args) {
        System.out.println(new IsPrime().PrimeCheck(22));
    }

}
