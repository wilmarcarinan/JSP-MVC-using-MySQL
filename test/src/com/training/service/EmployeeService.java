package com.training.service;

import com.training.dao.EmployeeDao;
import com.training.model.Employee;
import com.training.util.Constants;
import com.training.util.Conversion;
import com.training.util.Validation;

import java.util.ArrayList;
import java.util.List;

public class EmployeeService {
  private EmployeeDao empDao = new EmployeeDao();
  private Validation validate = new Validation();
  private JobService jobService = new JobService();
  private Conversion convert = new Conversion();

  public List<Employee> listEmployees(String pageNumber) {
    return empDao.getAllEmployeeQuery(pageNumber);
  }

  /** Search the employees in the database within a certain condition
   *  entered by the user.
   */
  public List<Employee> searchEmployees(String pageNumber, String[] searchParams) {
    return empDao.searchEmployee(pageNumber, searchParams);
  }

  /** Interact with the DAO Layer to
   *  get all the departments with their
   *  corresponding managers.
   */
  public List<Employee> getDepartments() {
    return empDao.getDepartmentsQuery();
  }

  /** Add an employee to the database
   *  with the details entered by the user.
   */
  public void addEmployee(String[] params) {
    double commission = 0.0;
    Employee employee = new Employee();

    if (params[8] != "") {
      commission = Double.parseDouble(params[8]);
    }

    employee.setfirstName(params[1]);
    employee.setlastName(params[2]);
    employee.setEmail(params[3]);
    employee.setPhone(params[4]);
    employee.sethireDate(params[5]);
    employee.setjobTitle(params[6]);
    employee.setSalary(params[7]);
    employee.setCommission(commission);
    employee.setDepartment(params[9]);
    employee.setManagerId(Integer.parseInt(params[10]));
    employee.setManager(params[11]);

    empDao.addEmployeeQuery(employee);
  }

  /** Update the employee in the database.
   *
   */
  public void updateEmployee(String[] params) {
    double commission = 0.0;
    Employee employee = new Employee();

    if (params[8] != "") {
      commission = Double.parseDouble(params[8]);
    }

    employee.setEmpId(Integer.parseInt(params[0]));
    employee.setfirstName(params[1]);
    employee.setlastName(params[2]);
    employee.setEmail(params[3]);
    employee.setPhone(params[4]);
    employee.sethireDate(params[5]);
    employee.setjobTitle(params[6]);
    employee.setSalary(params[7]);
    employee.setCommission(commission);
    employee.setDepartment(params[9]);
    employee.setManagerId(Integer.parseInt(params[10]));

    empDao.updateEmployee(employee);
  }

  /** Interact with the DAO layer and
   *  return true if email exist.
   */
  public Boolean isEmailExist(String email) {
    if (empDao.emailExist(email).getEmail().equals(email)) {
      return true;
    } else {
      return false;
    }
  }

  public Employee getEmpById(int empid) {
    return empDao.getEmpByIdQuery(empid);
  }

  /** Returns the old input of the user.
   *
   */
  public String[] old(String[] params) {
    String[] callBackParams = new String[params.length];

    for (int i = 0; i < callBackParams.length; i++) {
      callBackParams[i] = params[i];
    }

    return callBackParams;
  }

  /** Returns an integer array representing the
   *  status of the error list.
   */
  public int[] errorStatus(List<String> errors) {
    int[] numErrors = {0,0,0,0,0};
    if (errors.contains(Constants.ALPHANUM_FIRSTNAME)
        || errors.contains(Constants.STRINGLENGTH_FIRSTNAME)
        || errors.contains(Constants.FIRSTNAME_HALFWIDTH)) {
      numErrors[0] = 1;
    }

    if (errors.contains(Constants.ALPHANUM_LASTNAME)
        || errors.contains(Constants.STRINGLENGTH_LASTNAME)
        || errors.contains(Constants.LASTNAME_HALFWIDTH)) {
      numErrors[1] = 1;
    }

    if (errors.contains(Constants.FORMAT_EMAIL)
        || errors.contains(Constants.STRINGLENGTH_EMAIL)) {
      numErrors[2] = 1;
    }

    if (errors.contains(Constants.FORMAT_STARTDATE)
        || errors.contains(Constants.COMPAREDATE_ERROR)) {
      numErrors[3] = 1;
    }

    if (errors.contains(Constants.FORMAT_ENDDATE)
        || errors.contains(Constants.COMPAREDATE_ERROR)) {
      numErrors[4] = 1;
    }
    return numErrors;
  }

  /** Returns the list of errors found in search.
   *
   */
  public List<String> searchErrors(String[] searchParams) {
    List<String> errors = new ArrayList<String>();

    if (searchParams[0] != "") {
      if (!validate.checkIfNotAlphaNum(searchParams[0])) {
        errors.add(Constants.ALPHANUM_FIRSTNAME);
      }

      if (!validate.checkIf20Chars(searchParams[0])) {
        errors.add(Constants.STRINGLENGTH_FIRSTNAME);
      }

      if (!validate.isHalfWidth(searchParams[0])) {
        errors.add(Constants.FIRSTNAME_HALFWIDTH);
      }
    }

    if (searchParams[1] != "") {
      if (!validate.checkIfNotAlphaNum(searchParams[1])) {
        errors.add(Constants.ALPHANUM_LASTNAME);
      }

      if (!validate.checkIf25Chars(searchParams[1])) {
        errors.add(Constants.STRINGLENGTH_LASTNAME);
      }

      if (!validate.isHalfWidth(searchParams[1])) {
        errors.add(Constants.LASTNAME_HALFWIDTH);
      }
    }

    if (searchParams[2] != "") {
      if (!validate.checkIfEmail(searchParams[2])) {
        errors.add(Constants.FORMAT_EMAIL);
      }

      if (!validate.checkIf25Chars(searchParams[2])) {
        errors.add(Constants.STRINGLENGTH_EMAIL);
      }
    }

    if (searchParams[3] != "") {
      if (!validate.checkIfDate(searchParams[3])) {
        errors.add(Constants.FORMAT_STARTDATE);
      }
    }

    if (searchParams[4] != "") {
      if (!validate.checkIfDate(searchParams[4])) {
        errors.add(Constants.FORMAT_ENDDATE);
      }
    }

    if (searchParams[3] != "" && searchParams[4] != "") {
      if (!validate.compareDate(searchParams[3], searchParams[4])) {
        errors.add(Constants.COMPAREDATE_ERROR);
      }
    }

    return errors;
  }

  /** Returns the array of error status that will determine
   *  if a text field must be bordered by red color.
   */
  public int[] addErrStatus(List<String> errors, String jobTitle) {
    int[] numErrors = new int[10];

    for (int i = 0; i < numErrors.length; i++) {
      numErrors[i] = 0;
    }

    if (errors.contains(Constants.ALPHANUM_FIRSTNAME)
        || errors.contains(Constants.STRINGLENGTH_FIRSTNAME)
        || errors.contains(Constants.FIRSTNAME_REQUIRED)
        || errors.contains(Constants.FIRSTNAME_HALFWIDTH)) {
      numErrors[0] = 1;
    }

    if (errors.contains(Constants.ALPHANUM_LASTNAME)
        || errors.contains(Constants.STRINGLENGTH_LASTNAME)
        || errors.contains(Constants.LASTNAME_HALFWIDTH)
        || errors.contains(Constants.LASTNAME_REQUIRED)) {
      numErrors[1] = 1;
    }

    if (errors.contains(Constants.FORMAT_EMAIL)
        || errors.contains(Constants.EMAIL_REQUIRED)
        || errors.contains(Constants.EMAIL_EXIST)
        || errors.contains(Constants.STRINGLENGTH_EMAIL)) {
      numErrors[2] = 1;
    }

    if (errors.contains(Constants.PHONE_HALFWIDTH)
        || errors.contains(Constants.STRINGLENGTH_PHONE)
        || errors.contains(Constants.PHONE_NOTVALID)) {
      numErrors[3] = 1;
    }

    if (errors.contains(Constants.HIREDATE_REQUIRED)
        || errors.contains(Constants.FORMAT_HIREDATE)
        || errors.contains(Constants.FORMAT_VALIDDATE)) {
      numErrors[4] = 1;
    }

    if (errors.contains(Constants.JOBNOT_INLIST)
        || errors.contains(Constants.JOBTITLE_REQUIRED)) {
      numErrors[5] = 1;
    }

    if (errors.contains(Constants.SALARY_REQUIRED)
        || errors.contains(Constants.FORMAT_SALARY)
        || errors.contains("Enter SALARY from " + convert.formatDecimal(jobService.getJob(jobTitle)
                .getminSalary()) + " to " + convert.formatDecimal(jobService.getJob(jobTitle)
                        .getmaxSalary()))) {
      numErrors[6] = 1;
    }

    if (errors.contains(Constants.COMMISSION_ERROR)
        || errors.contains(Constants.COMMISSION_OUTOFRANGE)) {
      numErrors[7] = 1;
    }

    if (errors.contains(Constants.DEPARTMENT_REQUIRED)
        || errors.contains(Constants.DEPT_NOT_INLIST)) {
      numErrors[8] = 1;
    }

    if (errors.contains(Constants.MANAGER_REQUIRED)) {
      numErrors[9] = 1;
    }
    return numErrors;
  }

  /** Returns true if the inputs are valid.
   *
   */
  public Boolean addValidateInputs(String[] addParams) {
    if (addParams[1] != "" && addParams[2] != "" && addParams[3] != "" && addParams[5] != ""
        && addParams[6] != "" && addParams[7] != "" && addParams[9] != ""
        && addParams[10] != "" && addParams[11] != "") {
      if ((validate.checkIf20Chars(addParams[1]) && validate.checkIfNotAlphaNum(addParams[1]))
            && (validate.checkIf25Chars(addParams[2]) && validate.checkIfNotAlphaNum(addParams[2]))
            && (validate.checkIfEmail(addParams[3]) && validate.checkIf25Chars(addParams[3]))
            && (((addParams[4] != "") && validate.checkIf20Chars(addParams[4])
                && validate.phoneIsHalfWidth(addParams[4]) && validate.phoneIsValid(addParams[4]))
                || (addParams[4] == ""))
            && (validate.checkIfDate(addParams[5]) && validate.validDate(addParams[5]))
            && validate.jobExist(addParams[6])
            && (validate.checkIfTwoDecimal(addParams[7])
            && validate.salaryInRange(addParams[7], addParams[6]))
            && ((addParams[9].equals("Sales") && validate.commissionInRange(addParams[8]))
            || ((!addParams[9].equals("Sales")) && (addParams[8] == "")))
            && validate.deptExist(addParams[9])) {
        return true;
      } else {
        return false;
      }
    }
    return false;
  }

  /** Returns the list of errors of Add Form.
   *
   */
  public List<String> addErrorMsgs(String[] params, String oldEmail) {
    List<String> errors = new ArrayList<String>();

    if (params[1].equals("")) {
      errors.add(Constants.FIRSTNAME_REQUIRED);
    } else if (!validate.checkIf20Chars(params[1])) {
      errors.add(Constants.STRINGLENGTH_FIRSTNAME);
    }

    if (!validate.checkIfNotAlphaNum(params[1])) {
      errors.add(Constants.ALPHANUM_FIRSTNAME);
    }

    if (!validate.isHalfWidth(params[1])) {
      errors.add(Constants.FIRSTNAME_HALFWIDTH);
    }

    if (params[2].equals("")) {
      errors.add(Constants.LASTNAME_REQUIRED);
    } else if (!validate.checkIf25Chars(params[2])) {
      errors.add(Constants.STRINGLENGTH_LASTNAME);
    }

    if (!validate.checkIfNotAlphaNum(params[2])) {
      errors.add(Constants.ALPHANUM_LASTNAME);
    }

    if (!validate.isHalfWidth(params[2])) {
      errors.add(Constants.LASTNAME_HALFWIDTH);
    }

    if (params[3].equals("")) {
      errors.add(Constants.EMAIL_REQUIRED);
    } else if (!validate.checkIfEmail(params[3])) {
      errors.add(Constants.FORMAT_EMAIL);
    }

    if (!validate.checkIf25Chars(params[3])) {
      errors.add(Constants.STRINGLENGTH_EMAIL);
    } else if (!params[3].equals(oldEmail)) {
      if (isEmailExist(params[3])) {
        errors.add(Constants.EMAIL_EXIST);
      }
    }

    if (!validate.checkIf20Chars(params[4])) {
      errors.add(Constants.STRINGLENGTH_PHONE);
    }

    if (!validate.phoneIsHalfWidth(params[4])) {
      errors.add(Constants.PHONE_HALFWIDTH);
    }

    if (!validate.phoneIsValid(params[4])) {
      errors.add(Constants.PHONE_NOTVALID);
    }

    if (params[5].equals("")) {
      errors.add(Constants.HIREDATE_REQUIRED);
    } else if (!validate.checkIfDate(params[5])) {
      errors.add(Constants.FORMAT_HIREDATE);
    } else if (!validate.validDate(params[5])) {
      errors.add(Constants.FORMAT_VALIDDATE);
    }

    if (params[6].equals("")) {
      errors.add(Constants.JOBTITLE_REQUIRED);
    } else if (!validate.jobExist(params[6])) {
      errors.add(Constants.JOBNOT_INLIST);
    }

    if (params[7].equals("")) {
      errors.add(Constants.SALARY_REQUIRED);
    } else if (!validate.checkIfTwoDecimal(params[7])) {
      errors.add(Constants.FORMAT_SALARY);
    } else if (!validate.salaryInRange(params[7], params[6]) && validate.jobExist(params[6])) {
      errors.add("Enter SALARY from " + convert.formatDecimal(jobService.getJob(params[6])
          .getminSalary()) + " to " + convert.formatDecimal(jobService.getJob(params[6])
          .getmaxSalary()));
    }

    if ((!params[9].equals("Sales")) && (!params[8].equals(""))) {
      errors.add(Constants.COMMISSION_ERROR);
    } else if (params[9].equals("Sales") && !validate.commissionInRange(params[8])
          && params[8] != "") {
      errors.add(Constants.COMMISSION_OUTOFRANGE);
    }

    if (params[9].equals("")) {
      errors.add(Constants.DEPARTMENT_REQUIRED);
    } else if (!validate.deptExist(params[9])) {
      errors.add(Constants.DEPT_NOT_INLIST);
    }

    if (params[10].equals("") || params[11].equals("")) {
      errors.add(Constants.MANAGER_REQUIRED);
    }

    //if (!deptService.isManagerOfDepartment(params[10], params[9])) {
    //  errors.add(Constants.NOTMANAGER_OFDEPT);
    //}
    return errors;
  }

  /** Returns true if the search parameters
   *  are valid.
   */
  public Boolean searchValidateInputs(String[] searchParams) {
    if (searchParams[0] != "" && searchParams[1] != "" && searchParams[2] != ""
            && searchParams[3] != "" && searchParams[4] != "") {
      if (validate.checkIfNotAlphaNum(searchParams[0])
            && validate.checkIfNotAlphaNum(searchParams[1])
            && validate.checkIf20Chars(searchParams[0])
            && validate.checkIf25Chars(searchParams[1])
            && validate.checkIf25Chars(searchParams[2])
            && validate.checkIfEmail(searchParams[2])
            && validate.checkIfDate(searchParams[3])
            && validate.checkIfDate(searchParams[4])
            && validate.compareDate(searchParams[3], searchParams[4])) {
        return true;
      } else {
        return false;
      }
    } else if (searchParams[0] != "" && searchParams[1] == "" && searchParams[2] == ""
            && searchParams[3] == "" && searchParams[4] == "") {
      if (validate.checkIf20Chars(searchParams[0])
            && validate.checkIfNotAlphaNum(searchParams[0])) {
        return true;
      } else {
        return false;
      }
    } else if (searchParams[0] == "" && searchParams[1] != "" && searchParams[2] == ""
            && searchParams[3] == "" && searchParams[4] == "") {
      if (validate.checkIfNotAlphaNum(searchParams[1])
            && validate.checkIf25Chars(searchParams[1])) {
        return true;
      } else {
        return false;
      }
    } else if (searchParams[0] == "" && searchParams[1] == "" && searchParams[2] != ""
            && searchParams[3] == "" && searchParams[4] == "") {
      if (validate.checkIf25Chars(searchParams[2]) && validate.checkIfEmail(searchParams[2])) {
        return true;
      } else {
        return false;
      }
    } else if (searchParams[0] == "" && searchParams[1] == "" && searchParams[2] == ""
            && searchParams[3] != "" && searchParams[4] == "") {
      if (validate.checkIfDate(searchParams[3])) {
        return true;
      } else {
        return false;
      }
    } else if (searchParams[0] == "" && searchParams[1] == "" && searchParams[2] == ""
            && searchParams[3] == "" && searchParams[4] != "") {
      if (validate.checkIfDate(searchParams[4])) {
        return true;
      } else {
        return false;
      }
    } else if (searchParams[0] != "" && searchParams[1] != "" && searchParams[2] == ""
            && searchParams[3] == "" && searchParams[4] == "") {
      if (validate.checkIfNotAlphaNum(searchParams[0])
            && validate.checkIfNotAlphaNum(searchParams[1])
            && validate.checkIf20Chars(searchParams[0])
            && validate.checkIf25Chars(searchParams[1])) {
        return true;
      } else {
        return false;
      }
    } else if (searchParams[0] != "" && searchParams[1] == "" && searchParams[2] != ""
            && searchParams[3] == "" && searchParams[4] == "") {
      if (validate.checkIfNotAlphaNum(searchParams[0])
            && validate.checkIfEmail(searchParams[2])
            && validate.checkIf20Chars(searchParams[0])
            && validate.checkIf25Chars(searchParams[2])) {
        return true;
      } else {
        return false;
      }
    } else if (searchParams[0] != "" && searchParams[1] == "" && searchParams[2] == ""
            && searchParams[3] != "" && searchParams[4] == "") {
      if (validate.checkIfNotAlphaNum(searchParams[0])
            && validate.checkIf20Chars(searchParams[0])
            && validate.checkIfDate(searchParams[3])) {
        return true;
      } else {
        return false;
      }
    } else if (searchParams[0] != "" && searchParams[1] == "" && searchParams[2] == ""
            && searchParams[3] == "" && searchParams[4] != "") {
      if (validate.checkIfNotAlphaNum(searchParams[0])
            && validate.checkIf20Chars(searchParams[0])
            && validate.checkIfDate(searchParams[4])) {
        return true;
      } else {
        return false;
      }
    } else if (searchParams[0] == "" && searchParams[1] != "" && searchParams[2] != ""
            && searchParams[3] == "" && searchParams[4] == "") {
      if (validate.checkIfNotAlphaNum(searchParams[1])
            && validate.checkIf25Chars(searchParams[1])
            && validate.checkIfEmail(searchParams[2])
            && validate.checkIf25Chars(searchParams[2])) {
        return true;
      } else {
        return false;
      }
    } else if (searchParams[0] == "" && searchParams[1] != "" && searchParams[2] == ""
            && searchParams[3] != "" && searchParams[4] == "") {
      if (validate.checkIfNotAlphaNum(searchParams[1])
            && validate.checkIf25Chars(searchParams[0])
            && validate.checkIfDate(searchParams[3])) {
        return true;
      } else {
        return false;
      }
    } else if (searchParams[0] == "" && searchParams[1] != "" && searchParams[2] == ""
            && searchParams[3] == "" && searchParams[4] != "") {
      if (validate.checkIfNotAlphaNum(searchParams[1])
            && validate.checkIf25Chars(searchParams[0])
            && validate.checkIfDate(searchParams[4])) {
        return true;
      } else {
        return false;
      }
    } else if (searchParams[0] == "" && searchParams[1] == "" && searchParams[2] != ""
            && searchParams[3] != "" && searchParams[4] == "") {
      if (validate.checkIfEmail(searchParams[2])
            && validate.checkIf25Chars(searchParams[2])
            && validate.checkIfDate(searchParams[3])) {
        return true;
      } else {
        return false;
      }
    } else if (searchParams[0] == "" && searchParams[1] == "" && searchParams[2] != ""
            && searchParams[3] == "" && searchParams[4] != "") {
      if (validate.checkIfEmail(searchParams[2])
            && validate.checkIf25Chars(searchParams[2])
            && validate.checkIfDate(searchParams[4])) {
        return true;
      } else {
        return false;
      }
    } else if (searchParams[0] == "" && searchParams[1] == "" && searchParams[2] == ""
            && searchParams[3] != "" && searchParams[4] != "") {
      if (validate.checkIfDate(searchParams[3]) && validate.checkIfDate(searchParams[4])
          && validate.compareDate(searchParams[3], searchParams[4])) {
        return true;
      } else {
        return false;
      }
    } else if (searchParams[0] != "" && searchParams[1] != "" && searchParams[2] != ""
            && searchParams[3] == "" && searchParams[4] == "") {
      if (validate.checkIfNotAlphaNum(searchParams[0])
            && validate.checkIfNotAlphaNum(searchParams[1])
            && validate.checkIf20Chars(searchParams[0])
            && validate.checkIf25Chars(searchParams[1])
            && validate.checkIf25Chars(searchParams[2])
            && validate.checkIfEmail(searchParams[2])) {
        return true;
      } else {
        return false;
      }
    } else if (searchParams[0] != "" && searchParams[1] != "" && searchParams[2] == ""
            && searchParams[3] != "" && searchParams[4] == "") {
      if (validate.checkIfNotAlphaNum(searchParams[0])
            && validate.checkIfNotAlphaNum(searchParams[1])
            && validate.checkIf20Chars(searchParams[0])
            && validate.checkIf25Chars(searchParams[1])
            && validate.checkIfDate(searchParams[3])) {
        return true;
      } else {
        return false;
      }
    } else if (searchParams[0] != "" && searchParams[1] != "" && searchParams[2] == ""
            && searchParams[3] == "" && searchParams[4] != "") {
      if (validate.checkIfNotAlphaNum(searchParams[0])
            && validate.checkIfNotAlphaNum(searchParams[1])
            && validate.checkIf20Chars(searchParams[0])
            && validate.checkIf25Chars(searchParams[1])
            && validate.checkIfDate(searchParams[4])) {
        return true;
      } else {
        return false;
      }
    } else if (searchParams[0] != "" && searchParams[1] == "" && searchParams[2] != ""
            && searchParams[3] != "" && searchParams[4] == "") {
      if (validate.checkIfNotAlphaNum(searchParams[0])
            && validate.checkIf20Chars(searchParams[0])
            && validate.checkIfEmail(searchParams[2])
            && validate.checkIf25Chars(searchParams[2])
            && validate.checkIfDate(searchParams[3])) {
        return true;
      } else {
        return false;
      }
    } else if (searchParams[0] != "" && searchParams[1] == "" && searchParams[2] != ""
            && searchParams[3] == "" && searchParams[4] != "") {
      if (validate.checkIfNotAlphaNum(searchParams[0])
            && validate.checkIf20Chars(searchParams[0])
            && validate.checkIfEmail(searchParams[2])
            && validate.checkIf25Chars(searchParams[2])
            && validate.checkIfDate(searchParams[4])) {
        return true;
      } else {
        return false;
      }
    } else if (searchParams[0] != "" && searchParams[1] == "" && searchParams[2] == ""
            && searchParams[3] != "" && searchParams[4] != "") {
      if (validate.checkIfNotAlphaNum(searchParams[0])
                && validate.checkIf20Chars(searchParams[0])
                && validate.checkIfDate(searchParams[3])
                && validate.checkIfDate(searchParams[4])
                && validate.compareDate(searchParams[3], searchParams[4])) {
        return true;
      } else {
        return false;
      }
    } else if (searchParams[0] == "" && searchParams[1] != "" && searchParams[2] != ""
            && searchParams[3] != "" && searchParams[4] == "") {
      if (validate.checkIfNotAlphaNum(searchParams[1])
            && validate.checkIf25Chars(searchParams[1])
            && validate.checkIfEmail(searchParams[2])
            && validate.checkIf25Chars(searchParams[2])
            && validate.checkIfDate(searchParams[3])) {
        return true;
      } else {
        return false;
      }
    } else if (searchParams[0] == "" && searchParams[1] != "" && searchParams[2] != ""
            && searchParams[3] == "" && searchParams[4] != "") {
      if (validate.checkIfNotAlphaNum(searchParams[1])
            && validate.checkIf25Chars(searchParams[1])
            && validate.checkIfEmail(searchParams[2])
            && validate.checkIf25Chars(searchParams[2])
            && validate.checkIfDate(searchParams[4])) {
        return true;
      } else {
        return false;
      }
    } else if (searchParams[0] == "" && searchParams[1] != "" && searchParams[2] == ""
            && searchParams[3] != "" && searchParams[4] != "") {
      if (validate.checkIfNotAlphaNum(searchParams[1])
          && validate.checkIf25Chars(searchParams[1])
          && validate.checkIfDate(searchParams[3])
          && validate.checkIfDate(searchParams[4])
          && validate.compareDate(searchParams[3], searchParams[4])) {
        return true;
      } else {
        return false;
      }
    } else if (searchParams[0] == "" && searchParams[1] == "" && searchParams[2] != ""
            && searchParams[3] != "" && searchParams[4] != "") {
      if (validate.checkIfEmail(searchParams[2])
                && validate.checkIf25Chars(searchParams[2])
                && validate.checkIfDate(searchParams[3])
                && validate.checkIfDate(searchParams[4])
                && validate.compareDate(searchParams[3], searchParams[4])) {
        return true;
      } else {
        return false;
      }
    } else if (searchParams[0] != "" && searchParams[1] != "" && searchParams[2] != ""
            && searchParams[3] != "" && searchParams[4] == "") {
      if (validate.checkIfNotAlphaNum(searchParams[0])
                && validate.checkIfNotAlphaNum(searchParams[1])
                && validate.checkIf20Chars(searchParams[0])
                && validate.checkIf25Chars(searchParams[1])
                && validate.checkIfEmail(searchParams[2])
                && validate.checkIf25Chars(searchParams[2])
                && validate.checkIfDate(searchParams[3])) {
        return true;
      } else {
        return false;
      }
    } else if (searchParams[0] != "" && searchParams[1] != "" && searchParams[2] != ""
            && searchParams[3] == "" && searchParams[4] != "") {
      if (validate.checkIfNotAlphaNum(searchParams[0])
                && validate.checkIfNotAlphaNum(searchParams[1])
                && validate.checkIf20Chars(searchParams[0])
                && validate.checkIf25Chars(searchParams[1])
                && validate.checkIfEmail(searchParams[2])
                && validate.checkIf25Chars(searchParams[2])
                && validate.checkIfDate(searchParams[4])) {
        return true;
      } else {
        return false;
      }
    } else if (searchParams[0] != "" && searchParams[1] != "" && searchParams[2] == ""
            && searchParams[3] != "" && searchParams[4] != "") {
      if (validate.checkIfNotAlphaNum(searchParams[0])
                && validate.checkIfNotAlphaNum(searchParams[1])
                && validate.checkIf20Chars(searchParams[0])
                && validate.checkIf25Chars(searchParams[1])
                && validate.checkIfDate(searchParams[3])
                && validate.checkIfDate(searchParams[4])
                && validate.compareDate(searchParams[3], searchParams[4])) {
        return true;
      } else {
        return false;
      }
    } else if (searchParams[0] != "" && searchParams[1] == "" && searchParams[2] != ""
           && searchParams[3] != "" && searchParams[4] != "") {
      if (validate.checkIfNotAlphaNum(searchParams[0])
                && validate.checkIf20Chars(searchParams[0])
                && validate.checkIfEmail(searchParams[2])
                && validate.checkIf25Chars(searchParams[2])
                && validate.checkIfDate(searchParams[3])
                && validate.checkIfDate(searchParams[4])
                && validate.compareDate(searchParams[3],searchParams[4])) {
        return true;
      } else {
        return false;
      }
    } else if (searchParams[0] == "" && searchParams[1] != "" && searchParams[2] != ""
            && searchParams[3] != "" && searchParams[4] != "") {
      if (validate.checkIfNotAlphaNum(searchParams[1])
                && validate.checkIf25Chars(searchParams[1])
                && validate.checkIfEmail(searchParams[2])
                && validate.checkIf25Chars(searchParams[2])
                && validate.checkIfDate(searchParams[3])
                && validate.checkIfDate(searchParams[4])
                && validate.compareDate(searchParams[3],searchParams[4])) {
        return true;
      } else {
        return false;
      }
    } else {
      return false;
    }
  }
}
