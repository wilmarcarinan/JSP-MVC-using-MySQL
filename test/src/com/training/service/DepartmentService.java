package com.training.service;

import com.training.dao.DepartmentDao;
import com.training.model.Department;

import java.util.List;

public class DepartmentService {
  private DepartmentDao depDao = new DepartmentDao();

  /** Return the list of departments existing
   *  in the database.
   */
  public List<Department> getDepartments() {
    return depDao.getDepartmentsQuery();
  }

  /** Returns true if the given Manager is really
   *  the manager of the department given.
   */
  public Boolean isManagerOfDepartment(String stringManagerId, String departmentName) {
    int managerId = 0;

    try {
      managerId = Integer.parseInt(stringManagerId);
      if (depDao.managerOfDepartment(managerId, departmentName).getdepartmentName()
          == departmentName) {
        return true;
      } else {
        return false;
      }
    } catch (Exception e) {
      e.printStackTrace();
      return false;
    }
  }
}
