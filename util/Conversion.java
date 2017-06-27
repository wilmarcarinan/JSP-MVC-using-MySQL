package com.training.util;

import java.text.SimpleDateFormat;
import java.util.Date;

public class Conversion {
  /** Format the Salary with a comma separating value.
   *
   */
  public String convertSalary(int salary) {
    String convertedSalary = "";
    String salaryString;
    char[] salaryArr;

    salaryString = String.valueOf(salary);
    salaryArr = salaryString.toCharArray();
    for (int i = 0; i <= (salaryArr.length - 1); i++) {
      convertedSalary += salaryArr[i];
      if (((salaryArr.length) - (i + 1)) % 3 == 0 && i != (salaryArr.length - 1)) {
        convertedSalary += ",";
      }
    }
    convertedSalary += ".00";
    return convertedSalary;
  }

  /** Format Date to yyyy/MM/dd.
   *
   */
  public String formatDate(Date hireDate) {
    String date = new SimpleDateFormat("yyyy/MM/dd").format(hireDate);
    return date;
  }
}
