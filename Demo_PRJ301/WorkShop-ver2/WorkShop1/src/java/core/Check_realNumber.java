/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package core;

/**
 *
 * @author BachDuc
 */
public class Check_realNumber {
     public int check_real_integer_number(double n){
       // so nguyen n < 2 khong phai la so nguyen to
        if (n < 2) {
            return 0;
        }
        // check so nguyen to khi n >= 2
        int squareRoot = (int) Math.sqrt(n);
        for (int i = 2; i <= squareRoot; i++) {
            if (n % i == 0) {
                return 0;
            }
        }
        return 1;
    }
}
