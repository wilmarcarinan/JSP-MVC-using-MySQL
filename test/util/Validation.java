package com.training.util;

import java.util.Calendar;

public class Validation {
  /** Returns true if the String
   *  is not Alphanumeric.
   */
  public Boolean checkIfNotAlphaNum(String name) {
    if (name.chars().allMatch(Character::isLetter)) {
      return true;
    } else {
      return false;
    }
  }

  /** Returns true if the email is in correct format.
   *
   */
  public Boolean checkIfEmail(String email) {
    if (email.matches("^.+@.+(\\.[^\\.]+)+$")) {
      return true;
    } else {
      return false;
    }
  }

  /** Returns true if the date is valid.
   *
   */
  public Boolean checkIfDate(String date) {
    if (date.length() >= 8 || date.length() <= 10) {
      String[] dateChar = date.split("/");
      if (dateChar.length == 3) {
        int month = Integer.parseInt(dateChar[0]);
        int year = Integer.parseInt(dateChar[2]);
        int day = Integer.parseInt(dateChar[1]);
        if (month <= 12) {
          if (year <= 9999 && year >= 1000) {
            if (day <= 31) {
              Calendar cal = Calendar.getInstance();
              cal.set(cal.MONTH, (month - 1));
              cal.set(cal.YEAR, year);
              int maxDays = cal.getActualMaximum(cal.DATE);
              if (day <= maxDays) {
                cal.set(cal.DATE,day);
                return true;
              } else {
                return false;
              }
            } else {
              return false;
            }
          } else {
            return false;
          }
        } else {
          return false;
        }
      } else {
        return false;
      }
    } else {
      return false;
    }
  }

  /** Returns true if date1 is higher than date2.
   *
   */
  public Boolean compareDate(String date1, String date2) {
    String[] dateArr1 = date1.split("/");
    String[] dateArr2 = date2.split("/");
    int month1 = Integer.parseInt(dateArr1[0]);
    int month2 = Integer.parseInt(dateArr2[0]);
    int day1 = Integer.parseInt(dateArr1[1]);
    int day2 = Integer.parseInt(dateArr2[1]);
    int year1 = Integer.parseInt(dateArr1[2]);
    int year2 = Integer.parseInt(dateArr2[2]);

    if (year2 > year1) {
      return true;
    } else if (year2 == year1) {
      if (month2 > month1) {
        return true;
      } else if (month2 == month1) {
        if (day2 >= day1) {
          return true;
        } else {
          return false;
        }
      } else {
        return false;
      }
    } else {
      return false;
}
  }
}
