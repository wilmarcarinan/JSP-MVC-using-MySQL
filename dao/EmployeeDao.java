package com.training.dao;

import com.training.model.Employee;
import com.training.util.Conversion;
import com.training.util.DbUtil;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class EmployeeDao {
  private Connection connection;
  ResultSet rs = null;

  public EmployeeDao() {
    connection = DbUtil.getConnection();
  }

  /** Get all the employees in the database.
   *
   */
  public List<Employee> getAllEmployeeQuery(String pageNumber) {
    ResultSet rs = null;

    List<Employee> employees = new ArrayList<Employee>();
    StringBuilder query = new StringBuilder();
    Conversion convert = new Conversion();
    int page = Integer.parseInt(pageNumber) * 10;

    query.append("SELECT ");
    query.append("    EMPLOYEE_ID, ");
    query.append("    (SELECT ");
    query.append("         COUNT(EMPLOYEE_ID) ");
    query.append("         FROM EMPLOYEES) ");
    query.append("    AS TOTAL_ROWS, ");
    query.append("    FIRST_NAME, ");
    query.append("    LAST_NAME, ");
    query.append("    EMAIL, ");
    query.append("    PHONE_NUMBER, ");
    query.append("    HIRE_DATE, ");
    query.append("    JOBS.JOB_TITLE, ");
    query.append("    SALARY, ");
    query.append("    EMPLOYEES.MANAGER_ID, ");
    query.append("    DEPARTMENTS.DEPARTMENT_NAME ");
    query.append("    FROM ");
    query.append("    EMPLOYEES ");
    query.append("INNER JOIN ");
    query.append("    JOBS ");
    query.append("ON ");
    query.append("    EMPLOYEES.JOB_ID = ");
    query.append("    JOBS.JOB_ID ");
    query.append("INNER JOIN ");
    query.append("    DEPARTMENTS ");
    query.append("ON ");
    query.append("    EMPLOYEES.DEPARTMENT_ID = ");
    query.append("    DEPARTMENTS.DEPARTMENT_ID ");
//    query.append("WHERE ");
//    query.append("    EMPLOYEES.EMPLOYEE_ID <= ");
//    query.append("9 ");
    query.append("ORDER BY ");
    query.append("    EMPLOYEE_ID ");
    query.append("OFFSET ? ROWS ");
    query.append("FETCH NEXT 10 ROWS ONLY");

    try {
      PreparedStatement preparedStatement = connection
          .prepareStatement(query.toString());
      preparedStatement.setInt(1, (page - 10));
      rs = preparedStatement.executeQuery();
      while (rs.next()) {
        Employee employee = new Employee();
        employee.setEmpId(rs.getInt("EMPLOYEE_ID"));
        employee.setfirstName(rs.getString("FIRST_NAME"));
        employee.setlastName(rs.getString("LAST_NAME"));
        employee.setEmail(rs.getString("EMAIL"));
        employee.setPhone(rs.getString("PHONE_NUMBER"));
        employee.sethireDate(convert.formatDate(rs.getDate("HIRE_DATE")));
        employee.setjobTitle(rs.getString("JOB_TITLE"));
        employee.setSalary(convert.convertSalary(rs.getInt("SALARY")));
        employee.setManager(getManagerByIdQuery(rs.getInt("MANAGER_ID")));
        employee.setDepartment(rs.getString("DEPARTMENT_NAME"));
        employee.setTotal(rs.getInt("TOTAL_ROWS"));
        employees.add(employee);
      }
      preparedStatement.close();
      rs.close();
    } catch (SQLException e) {
      e.printStackTrace();
    }
    return employees;
  }

  /**Get Manager Name of the
   * given Manager ID.
   */
  public String getManagerByIdQuery(int managerid) {
    ResultSet rs = null;
    String managerName = "";
    StringBuilder query = new StringBuilder();

    query.append("SELECT ");
    query.append("    FIRST_NAME, ");
    query.append("    LAST_NAME ");
    query.append("FROM ");
    query.append("    EMPLOYEES ");
    query.append("WHERE ");
    query.append("    EMPLOYEE_ID = ");
    query.append("    ?");

    try {
      PreparedStatement preparedStatement = connection.prepareStatement(query.toString());
      preparedStatement.setInt(1, managerid);
      rs = preparedStatement.executeQuery();
      if (rs.next()) {
        managerName = rs.getString("FIRST_NAME") + " " + rs.getString("LAST_NAME");
      }
      preparedStatement.close();
      rs.close();
    } catch (SQLException e) {
      e.printStackTrace();
    }
    return managerName;
  }

  /**
   *.
   */
  public List<Employee> searchEmployee(String pageNumber, String[] searchParams) {
    ResultSet rs = null;
    int page = Integer.parseInt(pageNumber) * 10;
    List<Employee> employees = new ArrayList<Employee>();
    StringBuilder query = new StringBuilder();
    Conversion convert = new Conversion();

    query.append("SELECT ");
    query.append("    EMPLOYEE_ID, ");
    query.append("    (SELECT ");
    query.append("         COUNT(EMPLOYEE_ID) ");
    query.append("         FROM EMPLOYEES ");
    query.append("    WHERE ");
    query.append("        FIRST_NAME = ");
    query.append("        ? ");
    query.append("    OR ");
    query.append("        LAST_NAME = ");
    query.append("        ? ");
    query.append("    OR ");
    query.append("        EMAIL = ");
    query.append("        ? ");
    query.append("    OR ");
    query.append("        HIRE_DATE >= ");
    query.append("        TO_DATE(");
    query.append("            ?, ");
    query.append("            'MM/DD/YYYY',");
    query.append("            'NLS_DATE_LANGUAGE = American') ");
    query.append("    AND ");
    query.append("        HIRE_DATE <= ");
    query.append("            TO_DATE(");
    query.append("            ?, ");
    query.append("            'MM/DD/YYYY',");
    query.append("            'NLS_DATE_LANGUAGE = American')) ");
    query.append("    AS TOTAL_ROWS, ");
    query.append("    FIRST_NAME, ");
    query.append("    LAST_NAME, ");
    query.append("    EMAIL, ");
    query.append("    PHONE_NUMBER, ");
    query.append("    HIRE_DATE, ");
    query.append("    JOBS.JOB_TITLE, ");
    query.append("    SALARY, ");
    query.append("    EMPLOYEES.MANAGER_ID, ");
    query.append("    DEPARTMENTS.DEPARTMENT_NAME ");
    query.append("FROM ");
    query.append("    EMPLOYEES ");
    query.append("INNER JOIN ");
    query.append("    JOBS ");
    query.append("ON ");
    query.append("    EMPLOYEES.JOB_ID = ");
    query.append("    JOBS.JOB_ID ");
    query.append("INNER JOIN ");
    query.append("    DEPARTMENTS ");
    query.append("ON ");
    query.append("    EMPLOYEES.DEPARTMENT_ID = ");
    query.append("    DEPARTMENTS.DEPARTMENT_ID ");
    query.append("WHERE ");
    query.append("    FIRST_NAME = ");
    query.append("    ? ");
    query.append("OR ");
    query.append("    LAST_NAME = ");
    query.append("    ? ");
    query.append("OR ");
    query.append("    EMAIL = ");
    query.append("    ? ");
    query.append("OR ");
    query.append("    HIRE_DATE >= ");
    query.append("    TO_DATE(");
    query.append("    ?, ");
    query.append("    'MM/DD/YYYY',");
    query.append("    'NLS_DATE_LANGUAGE = American') ");
    query.append("AND ");
    query.append("    HIRE_DATE <= ");
    query.append("    TO_DATE(");
    query.append("    ?, ");
    query.append("    'MM/DD/YYYY',");
    query.append("    'NLS_DATE_LANGUAGE = American') ");
    query.append("ORDER BY ");
    query.append("    EMPLOYEE_ID ");
    query.append("OFFSET ? ROWS ");
    query.append("FETCH NEXT 10 ROWS ONLY");

    try {
      PreparedStatement preparedStatement = connection
          .prepareStatement(query.toString());
      preparedStatement.setString(1, searchParams[0]);
      preparedStatement.setString(2, searchParams[1]);
      preparedStatement.setString(3, searchParams[2]);
      preparedStatement.setString(4, searchParams[3]);
      preparedStatement.setString(5, searchParams[4]);
      preparedStatement.setString(6, searchParams[0]);
      preparedStatement.setString(7, searchParams[1]);
      preparedStatement.setString(8, searchParams[2]);
      preparedStatement.setString(9, searchParams[3]);
      preparedStatement.setString(10, searchParams[4]);
      preparedStatement.setInt(11, (page - 10));
      rs = preparedStatement.executeQuery();
      while (rs.next()) {
        Employee employee = new Employee();
        employee.setEmpId(rs.getInt("EMPLOYEE_ID"));
        employee.setfirstName(rs.getString("FIRST_NAME"));
        employee.setlastName(rs.getString("LAST_NAME"));
        employee.setEmail(rs.getString("EMAIL"));
        employee.setPhone(rs.getString("PHONE_NUMBER"));
        employee.sethireDate(convert.formatDate(rs.getDate("HIRE_DATE")));
        employee.setjobTitle(rs.getString("JOB_TITLE"));
        employee.setSalary(convert.convertSalary(rs.getInt("SALARY")));
        employee.setManager(getManagerByIdQuery(rs.getInt("MANAGER_ID")));
        employee.setDepartment(rs.getString("DEPARTMENT_NAME"));
        employee.setTotal(rs.getInt("TOTAL_ROWS"));
        employees.add(employee);
      }

      preparedStatement.close();
      rs.close();
    } catch (SQLException e) {
      e.printStackTrace();
    }
    return employees;
  }

  /***.
   *
   *
   */
  public void addEmployee(Employee employee) {
    try {
      Statement statement = connection.createStatement();
      StringBuilder query = new StringBuilder();
      query.append("INSERT INTO ");
      query.append("EMPLOYEES (");
      query.append("FIRST_NAME, ");
      query.append("LAST_NAME, ");
      query.append("EMAIL, ");
      query.append("PHONE_NUMBER, ");
      query.append("HIRE_DATE, ");
      query.append("JOB_ID, ");
      query.append("SALARY, ");
      query.append("MANAGER_ID, ");
      query.append("DEPARTMENT_ID) ");
      query.append("VALUES (");
      query.append(employee.getfirstName() + ", ");
      query.append(employee.getlastName() + ", ");
      query.append(employee.getEmail() + ", ");
      query.append(employee.getPhone() + ", ");
      query.append(employee.gethireDate() + ", ");
      query.append(employee.getjobTitle() + ", ");
      query.append(employee.getSalary() + ", ");
      query.append(employee.getManager() + ", ");
      query.append(employee.getDepartment() + ")");
      statement.executeUpdate(query.toString());
    } catch (SQLException e) {
      e.printStackTrace();
    }
  }

  /***.
   *
   *
   */
  public void updateEmployee(Employee employee) {
    try {
      Statement statement = connection.createStatement();
      StringBuilder query = new StringBuilder();
      query.append("INSERT INTO ");
      query.append("EMPLOYEES (");
      query.append("FIRST_NAME, ");
      query.append("LAST_NAME, ");
      query.append("EMAIL, ");
      query.append("PHONE_NUMBER, ");
      query.append("HIRE_DATE, ");
      query.append("JOB_ID, ");
      query.append("SALARY, ");
      query.append("MANAGER_ID, ");
      query.append("DEPARTMENT_ID) ");
      query.append("VALUES (");
      query.append(employee.getfirstName() + ", ");
      query.append(employee.getlastName() + ", ");
      query.append(employee.getEmail() + ", ");
      query.append(employee.getPhone() + ", ");
      query.append(employee.gethireDate() + ", ");
      query.append(employee.getjobTitle() + ", ");
      query.append(employee.getSalary() + ", ");
      query.append(employee.getManager() + ", ");
      query.append(employee.getDepartment() + ")");
      statement.executeUpdate(query.toString());
    } catch (SQLException e) {
      e.printStackTrace();
    }
  }

  /**
   *.
   */
  public Employee getEmployeeById(int empid) {
    Employee employee = new Employee();

    try {
      Statement statement = connection.createStatement();
      StringBuilder query = new StringBuilder();
      query.append("SELECT ");
      query.append("* ");
      query.append("FROM ");
      query.append("EMPLOYEES ");
      query.append("WHERE ");
      query.append("EMPLOYEE_ID = ");
      query.append(empid);
      ResultSet rs = statement.executeQuery(query.toString());

      if (rs.next()) {
        employee.setfirstName(rs.getString("FIRST_NAME"));
        employee.setlastName(rs.getString("LAST_NAME"));
        employee.setEmail(rs.getString("EMAIL"));
        employee.setPhone(rs.getString("PHONE_NUMBER"));
        //employee.sethireDate(rs.getDate("HIRE_DATE"));
        employee.setSalary(rs.getString("FIRST_NAME"));
      }
    } catch (SQLException e) {
      e.printStackTrace();
    }
    return employee;
  }
}
