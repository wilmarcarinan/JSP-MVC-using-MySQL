package com.training.util;

import java.text.DecimalFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

public class Conversion {
  /** Format the Salary with a comma separating value.
   *
   */
  public String convertSalary(String salaryString) {
    String convertedSalary = "";
    char[] salaryArr;
    String[] salarySplit;

    if (salaryString.contains(".")) {
      salarySplit = salaryString.split("\\.");
      salaryArr = salarySplit[0].toCharArray();
      for (int i = 0; i <= (salaryArr.length - 1); i++) {
        convertedSalary += salaryArr[i];
        if (((salaryArr.length) - (i + 1)) % 3 == 0 && i != (salaryArr.length - 1)) {
          convertedSalary += ",";
        }
      }
      convertedSalary += ("." + salarySplit[1]);
    }

    return convertedSalary;
  }

  /** Format Date to yyyy/MM/dd.
   *
   */
  public String formatDate(Date hireDate, String format) {
    String date = new SimpleDateFormat(format).format(hireDate);
    return date;
  }

  /** Formats a decimal number to two decimal places.
   *
   */
  public String formatDecimal(double decimal) {
    String decimalFormated = "";

    if (decimal > 0) {
      DecimalFormat df = new DecimalFormat("#.00");
      decimalFormated = df.format(decimal);
    }

    return decimalFormated;
  }
}
