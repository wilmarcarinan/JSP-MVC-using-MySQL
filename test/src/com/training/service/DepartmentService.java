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
}
