package com.training.dao;

import com.training.model.Department;
import com.training.util.DbUtil;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class DepartmentDao {
  private Connection connection;

  public DepartmentDao() {
    connection = DbUtil.getConnection();
  }

  /** Return the list of departments existing in
   *  the database.
   */
  public List<Department> getDepartmentsQuery() {
    List<Department> departments = new ArrayList<Department>();
    ResultSet rs = null;
    StringBuilder query = new StringBuilder();

    query.append("SELECT ");
    query.append("    DEPARTMENT_NAME ");
    query.append("FROM ");
    query.append("    DEPARTMENTS");

    try {
      PreparedStatement preparedStatement = connection.prepareStatement(query.toString());
      rs = preparedStatement.executeQuery();

      while (rs.next()) {
        Department department = new Department();
        department.setdepartmentName(rs.getString("DEPARTMENT_NAME"));
        departments.add(department);
      }

      preparedStatement.close();
      rs.close();
    } catch (SQLException e) {
      e.printStackTrace();
    }
    return departments;
  }

  /** Returns the department given the manager id.
   *
   */
  public Department managerOfDepartment(int managerId, String departmentName) {
    ResultSet rs = null;
    StringBuilder query = new StringBuilder();
    Department department = new Department();

    query.append("SELECT ");
    query.append("    DEPARTMENT_NAME, ");
    query.append("    MANAGER_ID ");
    query.append("FROM ");
    query.append("    DEPARTMENTS ");
    query.append("WHERE ");
    query.append("    MANAGER_ID = ");
    query.append("    ?");

    try {
      PreparedStatement preparedStatement = connection.prepareStatement(query.toString());
      preparedStatement.setInt(1, managerId);
      rs = preparedStatement.executeQuery();

      if (rs.next()) {
        department.setdepartmentName(rs.getString("DEPARTMENT_NAME"));
      } else {
        department.setdepartmentName(" ");
      }

      preparedStatement.close();
      rs.close();
    } catch (SQLException e) {
      e.printStackTrace();
    }
    return department;
  }
}
