package com.training.util;

import com.training.service.DepartmentService;
import com.training.service.JobService;

import java.util.Calendar;

public class Validation {
  private JobService jobService = new JobService();
  private DepartmentService deptService = new DepartmentService();

  /** Returns true if the String
   *  is not Alphanumeric.
   */
  public Boolean checkIfNotAlphaNum(String name) throws NullPointerException {
    name = name.trim();
    name = name.replaceAll(" ", "");
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

  /** Returns true if string is a
   *  half width character.
   */
  public Boolean isHalfWidth(String chars) {
    if (chars.contains(";")) {
      String[] charsArr = chars.split(";");
      for (int i = 0; i < charsArr.length; i++) {
        charsArr[i] = charsArr[i].trim();
        if (charsArr[i].indexOf("&#") != -1) {
          charsArr[i] = charsArr[i].substring(charsArr[i].indexOf("&#"));
          charsArr[i] = charsArr[i].substring(2);
          return checkIfNotAlphaNum(charsArr[i]);
        }
      }
      return true;
    } else {
      return true;
    }
  }

  /** Returns true if phone input
   *  is in only ".", "-" half-width alphanumeric.
   */
  public Boolean phoneIsHalfWidth(String phone) {
    if (phone.contains(".")) {
      phone = phone.replaceAll("\\.", "");
      return isHalfWidth(phone);
    } else if (phone.contains("-")) {
      phone = phone.replaceAll("-", "");
      return isHalfWidth(phone);
    } else {
      return isHalfWidth(phone);
    }
  }

  /** Returns true if phone is numeric
   *  excluding the "." and "-" characters.
   */
  public Boolean phoneIsValid(String phone) {
    if (phone.contains(".")) {
      phone = phone.replaceAll("\\.", "");
      return isNumeric(phone);
    } else if (phone.contains("-")) {
      phone = phone.replaceAll("-", "");
      return isNumeric(phone);
    } else {
      return isNumeric(phone);
    }
  }

  /** Returns true if a string can be
   *  parse into integer.
   */
  public Boolean isNumeric(String isNumeric) {
    try {
      Long.parseLong(isNumeric);
      return true;
    } catch (Exception e) {
      return false;
    }
  }

  /** Returns true if the string is less than
   *  20 characters.
   */
  public Boolean checkIf20Chars(String word) {
    if (word.length() <= 20) {
      return true;
    } else {
      return false;
    }
  }

  /** Returns true if the string is less than
   *  25 characters.
   */
  public Boolean checkIf25Chars(String word) {
    if (word.length() <= 25) {
      return true;
    } else {
      return false;
    }
  }

  /** Returns true if the date is in valid format.
   *
   */
  public Boolean checkIfDate(String date) {
    if (date.length() >= 8 || date.length() <= 10) {
      String[] dateChar = date.split("/");
      if (dateChar.length == 3) {
        int year = Integer.parseInt(dateChar[0]);
        int day = Integer.parseInt(dateChar[2]);
        int month = Integer.parseInt(dateChar[1]);
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

  /** Returns true if the date is valid.
   *
   */
  public Boolean validDate(String date) {
    String[] dateChar = date.split("/");
    if (dateChar.length == 3) {
      int year = Integer.parseInt(dateChar[0]);
      int day = Integer.parseInt(dateChar[2]);
      int month = Integer.parseInt(dateChar[1]);
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
  }

  /** Returns true if date1 is higher than date2.
   *
   */
  public Boolean compareDate(String date1, String date2) {
    if (checkIfDate(date1) && checkIfDate(date2)) {
      String[] dateArr1 = date1.split("/");
      String[] dateArr2 = date2.split("/");
      int year1 = Integer.parseInt(dateArr1[0]);
      int year2 = Integer.parseInt(dateArr2[0]);
      int month1 = Integer.parseInt(dateArr1[1]);
      int month2 = Integer.parseInt(dateArr2[1]);
      int day1 = Integer.parseInt(dateArr1[2]);
      int day2 = Integer.parseInt(dateArr2[2]);

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
    } else {
      return false;
    }
  }

  /** Returns true if the number is
   *  in two decimal places.
   */
  public Boolean checkIfTwoDecimal(String salary) {
    if (salary.contains(".")) {
      String[] salaryArr = salary.split("\\.");
      if (salaryArr.length == 2) {
        try {
          Integer.parseInt(salaryArr[0]);
          Integer.parseInt(salaryArr[1]);
          if (salaryArr[1].length() == 2) {
            return true;
          } else {
            return false;
          }
        } catch (Exception e) {
          return false;
        }
      } else {
        return false;
      }
    } else {
      return false;
    }
  }

  /** Returns true if job exist in database.
  *
  */
  public Boolean jobExist(String jobTitle) {
    for (int i = 0; i < jobService.getJobs().size(); i++) {
      if (jobService.getJobs().get(i).getjobTitle().equals(jobTitle)) {
        return true;
      }
    }
    return false;
  }

  /** Returns true if department exist in database.
  *
  */
  public Boolean deptExist(String departmentName) {
    for (int i = 0; i < deptService.getDepartments().size(); i++) {
      if (deptService.getDepartments().get(i).getdepartmentName().equals(departmentName)) {
        return true;
      }
    }
    return false;
  }

  /** Returns true if salary is in range.
   *
   */
  public Boolean salaryInRange(String salary, String jobTitle) {
    try {
      double numSalary = Double.parseDouble(salary);
      for (int i = 0; i < jobService.getJobs().size(); i++) {
        if (jobService.getJobs().get(i).getjobTitle().equals(jobTitle)) {
          if (numSalary >= jobService.getJobs().get(i).getminSalary()
              && numSalary <= jobService.getJobs().get(i).getmaxSalary()) {
            return true;
          }
        }
      }
      return false;
    } catch (Exception e) {
      return false;
    }
  }

  /** Returns true if Commission entered is in range.
   *
   */
  public Boolean commissionInRange(String commission) {
    int intCommission1 = 0;
    if (commission == "") {
      return true;
    } else if (commission.contains(".")) {
      String[] commissionArr = commission.split("\\.");
      if (commissionArr.length == 2) {
        try {
          intCommission1 = Integer.parseInt(commissionArr[0]);
          Integer.parseInt(commissionArr[1]);
          if (intCommission1 == 0 && commissionArr[1].length() == 2) {
            return true;
          } else {
            return false;
          }
        } catch (Exception e) {
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
