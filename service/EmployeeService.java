package com.training.service;

import com.training.dao.EmployeeDao;
import com.training.model.Employee;

import java.util.List;

public class EmployeeService {
  private EmployeeDao empDao = new EmployeeDao();

  public List<Employee> listEmployees(String pageNumber) {
    return empDao.getAllEmployeeQuery(pageNumber);
  }

  /** Search the employees in the database within a certain condition
   *  entered by the user.
   */
  public List<Employee> searchEmployees(String pageNumber, String[] searchParams) {
    return empDao.searchEmployee(pageNumber, searchParams);
  }
}
