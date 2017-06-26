/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package org.avid.util;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import javax.swing.JOptionPane;

/**
 *
 * @author Wilmar Paul
 */
public class Conversion {
    public String formatDateString(String stringDate) {
        SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
        Date date = null;
        try {
            date = new SimpleDateFormat("MM/dd/yyyy").parse(stringDate);
            stringDate = format.format(date);
        } catch (ParseException e) {
            e.printStackTrace();
        }
     
        return stringDate;
    }
}
