package com.training.util;

public class Constants {
  public final static String DRIVER = "oracle.jdbc.driver.OracleDriver";
  public final static String URL = "jdbc:oracle:thin:@localhost:1521:gas";
  public final static String USERNAME = "gas";
  public final static String PASSWORD = "gaspc";
  public final static String INSERT_OR_EDIT = "/AddEdit.jsp";
  public final static String LIST_USER = "/ListEmployee.jsp";

  //Error Constants
  public final static String ALPHANUM_FIRSTNAME = "Invalid FIRST NAME. Letters only.";
  public final static String ALPHANUM_LASTNAME = "Invalid LAST NAME. Letters only.";
  public final static String STRINGLENGTH_FIRSTNAME = "Enter FIRST NAME in 20 characters or less";
  public final static String STRINGLENGTH_LASTNAME = "Enter LAST NAME in 25 characters or less";
  public final static String STRINGLENGTH_EMAIL = "Enter EMAIL in 25 characters or less";
  public final static String STRINGLENGTH_PHONE = "Enter PHONE in 20 characters or less";
  public final static String FORMAT_EMAIL = "Enter EMAIL in valid format";
  public final static String FORMAT_HIREDATE = "Enter HIRE DATE in valid format";
  public final static String FORMAT_VALIDDATE = "Enter HIRE DATE in valid date";
  public final static String FORMAT_STARTDATE = "Enter HIRE DATE (Start Date) in valid format "
      + "Date format must be 'yyyy/MM/dd'.";
  public final static String FORMAT_ENDDATE = "Enter HIRE DATE (End Date) in valid format "
      + "Date format must be 'yyyy/MM/dd'.";
  public final static String COMPAREDATE_ERROR = "Invalid HIRE DATE. "
      + "Start Date must be less than End Date.";
  public final static String FIRSTNAME_REQUIRED = "FIRST NAME is required";
  public final static String LASTNAME_REQUIRED = "LAST NAME is required";
  public final static String EMAIL_REQUIRED = "EMAIL is required";
  public final static String HIREDATE_REQUIRED = "HIRE DATE is required";
  public final static String JOBTITLE_REQUIRED = "JOB TITLE is required";
  public final static String SALARY_REQUIRED = "SALARY is required";
  public final static String COMMISSION_ERROR = "COMMISSION cannot be specified";
  public final static String DEPARTMENT_REQUIRED = "DEPARTMENT is required";
  public final static String MANAGER_REQUIRED = "MANAGER is required";
  public final static String EMAIL_EXIST = "Entered EMAIL already exists";
  public final static String JOBNOT_INLIST = "Select JOB TITLE in valid value";
  public final static String FORMAT_SALARY = "Enter SALARY in numeric to two places of decimals";
  public final static String COMMISSION_OUTOFRANGE = "Enter COMMISSION from 0.00 to 0.99";
  public final static String DEPT_NOT_INLIST = "Select DEPARTMENT in valid value";
  public final static String FIRSTNAME_HALFWIDTH = "Enter FIRST NAME in half-width alphanumeric";
  public final static String LASTNAME_HALFWIDTH = "Enter LAST NAME in half-width alphanumeric";
  public final static String PHONE_HALFWIDTH = "Enter PHONE in only \".\",\"-\" half-width alphanumeric";
  public final static String PHONE_NOTVALID = "Enter PHONE without letters.";
}