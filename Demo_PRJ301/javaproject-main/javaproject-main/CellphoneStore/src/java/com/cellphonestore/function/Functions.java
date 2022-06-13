/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.cellphonestore.function;

import java.text.NumberFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Locale;

/**
 *
 * @author hongd
 */
public class Functions {

    //Convert int curency to string format curency ###.###.###
    public String Currency(int currencyAmount) {
        Locale locale = new Locale("vn", "VN");
        NumberFormat numberFormat = NumberFormat.getCurrencyInstance(locale);
        String resultRaw = numberFormat.format(currencyAmount);
        String resultChangeChar = resultRaw.substring(3, resultRaw.length());
        String result = resultChangeChar.replace(",", ".");
        return result;
    }

    public List<String> splitString(String input) {
        List<String> list = new ArrayList<>();
        String stringraw[] = input.trim().split(",");
        for (int i = 0; i < stringraw.length; i++) {
            if (!stringraw[i].trim().isEmpty()) {
                list.add(stringraw[i].trim());
            }
        }
        return list;
    }

    public String myDateFormat(String input) {
        SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
        String output="";
        try {
            Date dates = sdf.parse(input);
            sdf.applyPattern("yyyy-MM-dd");
            output = sdf.format(dates);
        } catch (ParseException e) {
            System.out.println("Error: "+e);
        }
        return output;
    }
}
