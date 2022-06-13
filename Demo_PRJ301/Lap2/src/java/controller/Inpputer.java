package controller;


import java.util.Scanner;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
/**
 *
 * @author BachDuc
 */
public class Inpputer {

    public static boolean InputRegex(String mess, String regex, String text) {
        System.out.println(mess);
        if (text.matches(regex)) {
            System.out.println("Valid Inpputer");
            return true;
        } else {
            System.out.println("Invalid Inpputer");
            return false;
        }

    }
//    public static String InputString(String mess){
//        System.out.println(mess);
//        Scanner sc= new Scanner(System.in);
//        return sc.nextLine();
//    }
}
