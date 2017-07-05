package com.training.dao;

import com.training.model.Employee;
import com.training.util.Conversion;
import com.training.util.DbUtil;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class EmployeeDao {
  private Connection connection;
  private Conversion convert = new Conversion();
  ResultSet rs = null;

  public EmployeeDao() {
    connection = DbUtil.getConnection();
  }

  /** Return the employee that match the
   *  employee ID the user wants to edit.
   */
  public Employee getEmpByIdQuery(int empid) {
    ResultSet rs = null;
    Employee employee = new Employee();
    StringBuilder query = new StringBuilder();
    Conversion convert = new Conversion();

    query.append("SELECT ");
    query.append("    FIRST_NAME, ");
    query.append("    LAST_NAME, ");
    query.append("    EMAIL, ");
    query.append("    PHONE_NUMBER, ");
    query.append("    HIRE_DATE, ");
    query.append("    JOBS.JOB_TITLE, ");
    query.append("    SALARY, ");
    query.append("    COMMISSION_PCT, ");
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
    query.append("    EMPLOYEE_ID = ");
    query.append("    ?");

    try {
      PreparedStatement preparedStatement = connection.prepareStatement(query.toString());
      preparedStatement.setInt(1, empid);
      rs = preparedStatement.executeQuery();

      if (rs.next()) {
        employee.setfirstName(rs.getString("FIRST_NAME"));
        employee.setlastName(rs.getString("LAST_NAME"));
        employee.setEmail(rs.getString("EMAIL"));
        employee.setPhone(rs.getString("PHONE_NUMBER"));
        employee.sethireDate(convert .formatDate(rs.getDate("HIRE_DATE"),"MM/dd/yyyy"));
        employee.setjobTitle(rs.getString("JOB_TITLE"));
        employee.setSalary(convert.formatDecimal(rs.getDouble("SALARY")));
        employee.setCommission(rs.getDouble("COMMISSION_PCT"));
        employee.setManager(getManagerByIdQuery(rs.getInt("MANAGER_ID")));
        employee.setDepartment(rs.getString("DEPARTMENT_NAME"));
      }

      preparedStatement.close();
      rs.close();
    } catch (SQLException e) {
      e.printStackTrace();
    }
    return employee;
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
        employee.sethireDate(convert.formatDate(rs.getDate("HIRE_DATE"),"yyyy/MM/dd"));
        employee.setjobTitle(rs.getString("JOB_TITLE"));
        employee.setSalary(convert.convertSalary(convert.formatDecimal(rs.getDouble("SALARY"))));
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

  /** Return the list of the Managers and
   *  Departments.
   */
  public List<Employee> getDepartmentsQuery() {
    ResultSet rs = null;
    List<Employee> departments = new ArrayList<Employee>();
    StringBuilder query = new StringBuilder();

    query.append("SELECT ");
    query.append("    EMPLOYEE_ID, ");
    query.append("    DEPARTMENTS.DEPARTMENT_ID, ");
    query.append("    FIRST_NAME||' '||LAST_NAME ");
    query.append("    AS MANAGER_NAME, ");
    query.append("    DEPARTMENT_NAME ");
    query.append("FROM ");
    query.append("    EMPLOYEES ");
    query.append("INNER JOIN ");
    query.append("    DEPARTMENTS ");
    query.append("ON ");
    query.append("    DEPARTMENTS.MANAGER_ID = ");
    query.append("    EMPLOYEES.EMPLOYEE_ID ");
    query.append("ORDER BY ");
    query.append("    DEPARTMENTS.DEPARTMENT_ID");

    try {
      PreparedStatement preparedStatement = connection.prepareStatement(query.toString());
      rs = preparedStatement.executeQuery();

      while (rs.next()) {
        Employee employee = new Employee();
        employee.setEmpId(rs.getInt("EMPLOYEE_ID"));
        employee.setManager(rs.getString("MANAGER_NAME"));
        employee.setDepartment(rs.getString("DEPARTMENT_NAME"));
        departments.add(employee);
      }

      preparedStatement.close();
      rs.close();
    } catch (SQLException e) {
      e.printStackTrace();
    }
    return departments;
  }

  /** Return true if the email entered by the
   *  user already exist in the database.
   */
  public Boolean checkIfEmailExist(String email) {
    ResultSet rs = null;
    StringBuilder query = new StringBuilder();

    query.append("SELECT ");
    query.append("    EMAIL ");
    query.append("FROM ");
    query.append("    EMPLOYEES ");
    query.append("WHERE ");
    query.append("    EMAIL = ");
    query.append("    ?");

    try {
      PreparedStatement preparedStatement = connection.prepareStatement(query.toString());
      preparedStatement.setString(1, email);
      rs = preparedStatement.executeQuery();

      if (rs.next()) {
        return true;
      }

      preparedStatement.close();
      rs.close();
    } catch (SQLException e) {
      e.printStackTrace();
    }

    return false;
  }

  /** Performs a query that will add
  * an employee.
  */
  public void addEmployeeQuery(Employee employee) {
    StringBuilder query = new StringBuilder();
    Date hireDate = new Date();

    try {
      hireDate = new SimpleDateFormat("MM/dd/yyyy").parse(employee.gethireDate());
    } catch (ParseException e) {
      e.printStackTrace();
    }

    query.append("INSERT INTO ");
    query.append("    EMPLOYEES (");
    query.append("        EMPLOYEE_ID, ");
    query.append("        FIRST_NAME, ");
    query.append("        LAST_NAME, ");
    query.append("        EMAIL, ");
    query.append("        PHONE_NUMBER, ");
    query.append("        HIRE_DATE, ");
    query.append("        JOB_ID, ");
    query.append("        SALARY, ");
    query.append("        COMMISSION_PCT, ");
    query.append("        MANAGER_ID, ");
    query.append("        DEPARTMENT_ID) ");
    query.append("VALUES (");
    query.append("    EMPLOYEES_SEQ.NEXTVAL, ");
    query.append("    ?, ");
    query.append("    ?, ");
    query.append("    ?, ");
    query.append("    ?, ");
    query.append("    ?, ");
    query.append("    (SELECT ");
    query.append("         JOB_ID ");
    query.append("     FROM ");
    query.append("         JOBS ");
    query.append("     WHERE ");
    query.append("         JOB_TITLE = ");
    query.append("         ?), ");
    query.append("    ?, ");
    query.append("    ?, ");
    query.append("    ?, ");
    query.append("    (SELECT ");
    query.append("         DEPARTMENT_ID ");
    query.append("     FROM ");
    query.append("         DEPARTMENTS ");
    query.append("     WHERE ");
    query.append("         DEPARTMENT_NAME = ");
    query.append("         ?)) ");

    try {
      PreparedStatement preparedStatement = connection.prepareStatement(query.toString());
      preparedStatement.setString(1, employee.getfirstName());
      preparedStatement.setString(2, employee.getlastName());
      preparedStatement.setString(3, employee.getEmail());
      preparedStatement.setString(4, employee.getPhone());
      preparedStatement.setDate(5, new java.sql.Date(hireDate.getTime()));
      preparedStatement.setString(6, employee.getjobTitle());
      preparedStatement.setDouble(7, Double.parseDouble(employee.getSalary()));
      preparedStatement.setDouble(8, employee.getCommission());
      preparedStatement.setInt(9, employee.getManagerId());
      preparedStatement.setString(10, employee.getDepartment());

      preparedStatement.executeUpdate();
      preparedStatement.close();
    } catch (SQLException e) {
      e.printStackTrace();
    }
  }

  /***.
  *
  *
  */
  public void updateEmployee(Employee employee) {
    StringBuilder query = new StringBuilder();
    Date hireDate = new Date();

    try {
      hireDate = new SimpleDateFormat("MM/dd/yyyy").parse(employee.gethireDate());
    } catch (ParseException e) {
      e.printStackTrace();
    }

    query.append("UPDATE ");
    query.append("    EMPLOYEES ");
    query.append("SET ");
    query.append("    FIRST_NAME= ");
    query.append("    ?, ");
    query.append("    LAST_NAME= ");
    query.append("    ?, ");
    query.append("    EMAIL= ");
    query.append("    ?, ");
    query.append("    PHONE_NUMBER= ");
    query.append("    ?, ");
    query.append("    HIRE_DATE= ");
    query.append("    ?, ");
    query.append("    JOB_ID= ");
    query.append("    (SELECT ");
    query.append("         JOB_ID ");
    query.append("     FROM ");
    query.append("         JOBS ");
    query.append("     WHERE ");
    query.append("         JOB_TITLE = ");
    query.append("         ?), ");
    query.append("    SALARY= ");
    query.append("    ?, ");
    query.append("    COMMISSION_PCT= ");
    query.append("    ?, ");
    query.append("    MANAGER_ID= ");
    query.append("    ?, ");
    query.append("    DEPARTMENT_ID= ");
    query.append("    (SELECT ");
    query.append("         DEPARTMENT_ID ");
    query.append("     FROM ");
    query.append("         DEPARTMENTS ");
    query.append("     WHERE ");
    query.append("         DEPARTMENT_NAME = ");
    query.append("         ?) ");
    query.append("WHERE ");
    query.append("    EMPLOYEE_ID = ");
    query.append("    ?");

    try {
      PreparedStatement preparedStatement = connection.prepareStatement(query.toString());
      preparedStatement.setString(1, employee.getfirstName());
      preparedStatement.setString(2, employee.getlastName());
      preparedStatement.setString(3, employee.getEmail());
      preparedStatement.setString(4, employee.getPhone());
      preparedStatement.setDate(5, new java.sql.Date(hireDate.getTime()));
      preparedStatement.setString(6, employee.getjobTitle());
      preparedStatement.setDouble(7, Double.parseDouble(employee.getSalary()));
      preparedStatement.setDouble(8, employee.getCommission());
      preparedStatement.setInt(9, employee.getManagerId());
      preparedStatement.setString(10, employee.getDepartment());
      preparedStatement.setInt(11, employee.getEmpid());

      preparedStatement.executeUpdate();
      preparedStatement.close();
    } catch (SQLException e) {
      e.printStackTrace();
    }
  }

  /** Returns the list of the employees that
   *  are within the condition entered by the user.
   */
  public List<Employee> searchEmployee(String pageNumber, String[] searchParams) {
    ResultSet rs = null;
    String wildcard = "";
    int page = Integer.parseInt(pageNumber) * 10;
    List<Employee> employees = new ArrayList<Employee>();
    StringBuilder query = new StringBuilder();
    Conversion convert = new Conversion();

    if (searchParams[1] != "") {
      wildcard = "%";
    }

    query.append("SELECT ");
    query.append("    EMPLOYEE_ID, ");
    query.append("    (SELECT ");
    query.append("         COUNT(EMPLOYEE_ID) ");
    query.append("         FROM EMPLOYEES ");
    query.append("    WHERE ");
    if (searchParams[0] != "" && searchParams[1] != "" && searchParams[2] != ""
            && searchParams[3] != "" && searchParams[4] != "") {
      query.append("      FIRST_NAME = ");
      query.append("      ? ");
      query.append("  AND ");
      query.append("      LAST_NAME ");
      query.append("      LIKE ");
      query.append("      ? ");
      query.append("  AND ");
      query.append("      EMAIL = ");
      query.append("      ? ");
      query.append("  AND ");
      query.append("      HIRE_DATE >= ");
      query.append("      TO_DATE(");
      query.append("      ?, ");
      query.append("      'MM/DD/YYYY',");
      query.append("      'NLS_DATE_LANGUAGE = American') ");
      query.append("  AND ");
      query.append("      HIRE_DATE <= ");
      query.append("      TO_DATE(");
      query.append("      ?, ");
      query.append("      'MM/DD/YYYY',");
      query.append("      'NLS_DATE_LANGUAGE = American')");
    } else if (searchParams[0] != "" && searchParams[1] == "" && searchParams[2] == ""
            && searchParams[3] == "" && searchParams[4] == "") {
      query.append("      FIRST_NAME = ");
      query.append("      ?");
    } else if (searchParams[0] == "" && searchParams[1] != "" && searchParams[2] == ""
              && searchParams[3] == "" && searchParams[4] == "") {
      query.append("      LAST_NAME ");
      query.append("      LIKE ");
      query.append("      ? ");
    } else if (searchParams[0] == "" && searchParams[1] == "" && searchParams[2] != ""
            && searchParams[3] == "" && searchParams[4] == "") {
      query.append("      EMAIL = ");
      query.append("      ?");
    } else if (searchParams[0] != "" && searchParams[1] != "" && searchParams[2] == ""
            && searchParams[3] == "" && searchParams[4] == "") {
      query.append("      FIRST_NAME = ");
      query.append("      ?");
      query.append("  AND");
      query.append("      LAST_NAME ");
      query.append("      LIKE ");
      query.append("      ? ");
    } else if (searchParams[0] != "" && searchParams[1] == "" && searchParams[2] != ""
            && searchParams[3] == "" && searchParams[4] == "") {
      query.append("      FIRST_NAME = ");
      query.append("      ?");
      query.append("  AND");
      query.append("      EMAIL = ");
      query.append("      ? ");
    } else if (searchParams[0] == "" && searchParams[1] != "" && searchParams[2] != ""
            && searchParams[3] == "" && searchParams[4] == "") {
      query.append("      LAST_NAME ");
      query.append("      LIKE ");
      query.append("      ? ");
      query.append("  AND ");
      query.append("      EMAIL = ");
      query.append("      ?");
    } else if (searchParams[0] == "" && searchParams[1] == "" && searchParams[2] == ""
            && searchParams[3] != "" && searchParams[4] != "") {
      query.append("      HIRE_DATE >= ");
      query.append("      TO_DATE(");
      query.append("      ?, ");
      query.append("      'MM/DD/YYYY',");
      query.append("      'NLS_DATE_LANGUAGE = American') ");
      query.append("  AND ");
      query.append("      HIRE_DATE <= ");
      query.append("      TO_DATE(");
      query.append("      ?, ");
      query.append("      'MM/DD/YYYY',");
      query.append("      'NLS_DATE_LANGUAGE = American')");
    } else if (searchParams[0] != "" && searchParams[1] != "" && searchParams[2] != ""
            && searchParams[3] == "" && searchParams[4] == "") {
      query.append("      FIRST_NAME = ");
      query.append("      ?");
      query.append("  AND");
      query.append("      LAST_NAME ");
      query.append("      LIKE ");
      query.append("      ? ");
      query.append("  AND");
      query.append("      EMAIL = ");
      query.append("      ?");
    } else if (searchParams[0] != "" && searchParams[1] == "" && searchParams[2] == ""
            && searchParams[3] != "" && searchParams[4] != "") {
      query.append("      FIRST_NAME = ");
      query.append("      ?");
      query.append("  AND");
      query.append("      HIRE_DATE >= ");
      query.append("      TO_DATE(");
      query.append("      ?, ");
      query.append("      'MM/DD/YYYY',");
      query.append("      'NLS_DATE_LANGUAGE = American') ");
      query.append("  AND ");
      query.append("      HIRE_DATE <= ");
      query.append("      TO_DATE(");
      query.append("      ?, ");
      query.append("      'MM/DD/YYYY',");
      query.append("      'NLS_DATE_LANGUAGE = American')");
    } else if (searchParams[0] == "" && searchParams[1] != "" && searchParams[2] == ""
            && searchParams[3] != "" && searchParams[4] != "") {
      query.append("    LAST_NAME ");
      query.append("    LIKE ");
      query.append("    ? ");
      query.append("AND");
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
      query.append("    'NLS_DATE_LANGUAGE = American')");
    } else if (searchParams[0] == "" && searchParams[1] == "" && searchParams[2] != ""
            && searchParams[3] != "" && searchParams[4] != "") {
      query.append("    EMAIL = ");
      query.append("    ? ");
      query.append("AND");
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
      query.append("    'NLS_DATE_LANGUAGE = American')");
    } else if (searchParams[0] != "" && searchParams[1] != "" && searchParams[2] == ""
            && searchParams[3] != "" && searchParams[4] != "") {
      query.append("      FIRST_NAME = ");
      query.append("      ? ");
      query.append("  AND");
      query.append("      LAST_NAME ");
      query.append("      LIKE ");
      query.append("      ? ");
      query.append("  AND");
      query.append("      HIRE_DATE >= ");
      query.append("      TO_DATE(");
      query.append("      ?, ");
      query.append("      'MM/DD/YYYY',");
      query.append("      'NLS_DATE_LANGUAGE = American') ");
      query.append("  AND ");
      query.append("      HIRE_DATE <= ");
      query.append("      TO_DATE(");
      query.append("      ?, ");
      query.append("      'MM/DD/YYYY',");
      query.append("      'NLS_DATE_LANGUAGE = American')");
    } else if (searchParams[0] != "" && searchParams[1] == "" && searchParams[2] != ""
            && searchParams[3] != "" && searchParams[4] != "") {
      query.append("      FIRST_NAME = ");
      query.append("      ? ");
      query.append("  AND");
      query.append("      EMAIL = ");
      query.append("      ? ");
      query.append("  AND");
      query.append("      HIRE_DATE >= ");
      query.append("      TO_DATE(");
      query.append("      ?, ");
      query.append("      'MM/DD/YYYY',");
      query.append("      'NLS_DATE_LANGUAGE = American') ");
      query.append("  AND ");
      query.append("      HIRE_DATE <= ");
      query.append("      TO_DATE(");
      query.append("      ?, ");
      query.append("      'MM/DD/YYYY',");
      query.append("      'NLS_DATE_LANGUAGE = American')");
    }

    query.append(")");
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
    if (searchParams[0] != "" && searchParams[1] != "" && searchParams[2] != ""
            && searchParams[3] != "" && searchParams[4] != "") {
      query.append("  FIRST_NAME = ");
      query.append("    ? ");
      query.append("AND ");
      query.append("  LAST_NAME ");
      query.append("  LIKE ");
      query.append("  ? ");
      query.append("AND ");
      query.append("  EMAIL = ");
      query.append("  ? ");
      query.append("AND ");
      query.append("  HIRE_DATE >= ");
      query.append("  TO_DATE(");
      query.append("  ?, ");
      query.append("  'MM/DD/YYYY',");
      query.append("  'NLS_DATE_LANGUAGE = American') ");
      query.append("AND ");
      query.append("  HIRE_DATE <= ");
      query.append("  TO_DATE(");
      query.append("  ?, ");
      query.append("  'MM/DD/YYYY',");
      query.append("  'NLS_DATE_LANGUAGE = American') ");
    } else if (searchParams[0] != "" && searchParams[1] == "" && searchParams[2] == ""
            && searchParams[3] == "" && searchParams[4] == "") {
      query.append("    FIRST_NAME = ");
      query.append("    ? ");
    } else if (searchParams[0] == "" && searchParams[1] != "" && searchParams[2] == ""
              && searchParams[3] == "" && searchParams[4] == "") {
      query.append("    LAST_NAME ");
      query.append("    LIKE ");
      query.append("    ?");
    } else if (searchParams[0] == "" && searchParams[1] == "" && searchParams[2] != ""
            && searchParams[3] == "" && searchParams[4] == "") {
      query.append("    EMAIL = ");
      query.append("    ? ");
    } else if (searchParams[0] != "" && searchParams[1] != "" && searchParams[2] == ""
            && searchParams[3] == "" && searchParams[4] == "") {
      query.append("    FIRST_NAME = ");
      query.append("    ?");
      query.append("AND");
      query.append("    LAST_NAME ");
      query.append("    LIKE ");
      query.append("    ? ");
    } else if (searchParams[0] != "" && searchParams[1] == "" && searchParams[2] != ""
            && searchParams[3] == "" && searchParams[4] == "") {
      query.append("    FIRST_NAME = ");
      query.append("    ?");
      query.append("AND");
      query.append("    EMAIL = ");
      query.append("    ? ");
    } else if (searchParams[0] == "" && searchParams[1] != "" && searchParams[2] != ""
            && searchParams[3] == "" && searchParams[4] == "") {
      query.append("    LAST_NAME ");
      query.append("    LIKE ");
      query.append("    ? ");
      query.append("AND ");
      query.append("    EMAIL = ");
      query.append("    ?");
    } else if (searchParams[0] == "" && searchParams[1] == "" && searchParams[2] == ""
            && searchParams[3] != "" && searchParams[4] != "") {
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
    } else if (searchParams[0] != "" && searchParams[1] != "" && searchParams[2] != ""
            && searchParams[3] == "" && searchParams[4] == "") {
      query.append("    FIRST_NAME = ");
      query.append("    ?");
      query.append("AND");
      query.append("    LAST_NAME ");
      query.append("    LIKE ");
      query.append("    ? ");
      query.append("AND");
      query.append("    EMAIL = ");
      query.append("    ?");
    } else if (searchParams[0] != "" && searchParams[1] == "" && searchParams[2] == ""
            && searchParams[3] != "" && searchParams[4] != "") {
      query.append("    FIRST_NAME = ");
      query.append("    ?");
      query.append("AND");
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
      query.append("    'NLS_DATE_LANGUAGE = American')");
    } else if (searchParams[0] == "" && searchParams[1] != "" && searchParams[2] == ""
            && searchParams[3] != "" && searchParams[4] != "") {
      query.append("    LAST_NAME ");
      query.append("    LIKE ");
      query.append("    ? ");
      query.append("AND");
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
      query.append("    'NLS_DATE_LANGUAGE = American')");
    } else if (searchParams[0] == "" && searchParams[1] == "" && searchParams[2] != ""
            && searchParams[3] != "" && searchParams[4] != "") {
      query.append("    EMAIL = ");
      query.append("    ? ");
      query.append("AND");
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
      query.append("    'NLS_DATE_LANGUAGE = American')");
    } else if (searchParams[0] != "" && searchParams[1] != "" && searchParams[2] == ""
            && searchParams[3] != "" && searchParams[4] != "") {
      query.append("    FIRST_NAME = ");
      query.append("    ? ");
      query.append("AND");
      query.append("    LAST_NAME ");
      query.append("    LIKE ");
      query.append("    ? ");
      query.append("AND");
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
      query.append("    'NLS_DATE_LANGUAGE = American')");
    } else if (searchParams[0] != "" && searchParams[1] == "" && searchParams[2] != ""
            && searchParams[3] != "" && searchParams[4] != "") {
      query.append("    FIRST_NAME = ");
      query.append("    ? ");
      query.append("AND");
      query.append("    EMAIL = ");
      query.append("    ? ");
      query.append("AND");
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
      query.append("    'NLS_DATE_LANGUAGE = American')");
    }
    query.append("ORDER BY ");
    query.append("    EMPLOYEE_ID ");
    query.append("OFFSET ? ROWS ");
    query.append("FETCH NEXT 10 ROWS ONLY");

    try {
      PreparedStatement preparedStatement = connection
          .prepareStatement(query.toString());
      if (searchParams[0] != "" && searchParams[1] != "" && searchParams[2] != ""
              && searchParams[3] != "" && searchParams[4] != "") {
        preparedStatement.setString(1, searchParams[0]);
        preparedStatement.setString(2, searchParams[1] + wildcard);
        preparedStatement.setString(3, searchParams[2]);
        preparedStatement.setString(4, searchParams[3]);
        preparedStatement.setString(5, searchParams[4]);
        preparedStatement.setString(6, searchParams[0]);
        preparedStatement.setString(7, searchParams[1] + wildcard);
        preparedStatement.setString(8, searchParams[2]);
        preparedStatement.setString(9, searchParams[3]);
        preparedStatement.setString(10, searchParams[4]);
        preparedStatement.setInt(11, (page - 10));
      } else if (searchParams[0] != "" && searchParams[1] == "" && searchParams[2] == ""
              && searchParams[3] == "" && searchParams[4] == "") {
        preparedStatement.setString(1, searchParams[0]);
        preparedStatement.setString(2, searchParams[0]);
        preparedStatement.setInt(3, (page - 10));
      } else if (searchParams[0] == "" && searchParams[1] != "" && searchParams[2] == ""
              && searchParams[3] == "" && searchParams[4] == "") {
        preparedStatement.setString(1, searchParams[1] + wildcard);
        preparedStatement.setString(2, searchParams[1] + wildcard);
        preparedStatement.setInt(3, (page - 10));
      } else if (searchParams[0] == "" && searchParams[1] == "" && searchParams[2] != ""
              && searchParams[3] == "" && searchParams[4] == "") {
        preparedStatement.setString(1, searchParams[2]);
        preparedStatement.setString(2, searchParams[2]);
        preparedStatement.setInt(3, (page - 10));
      } else if (searchParams[0] == "" && searchParams[1] == "" && searchParams[2] == ""
              && searchParams[3] != "" && searchParams[4] != "") {
        preparedStatement.setString(1, searchParams[3]);
        preparedStatement.setString(2, searchParams[4]);
        preparedStatement.setString(3, searchParams[3]);
        preparedStatement.setString(4, searchParams[4]);
        preparedStatement.setInt(5, (page - 10));
      } else if (searchParams[0] != "" && searchParams[1] != "" && searchParams[2] == ""
              && searchParams[3] == "" && searchParams[4] == "") {
        preparedStatement.setString(1, searchParams[0]);
        preparedStatement.setString(2, searchParams[1] + wildcard);
        preparedStatement.setString(3, searchParams[0]);
        preparedStatement.setString(4, searchParams[1] + wildcard);
        preparedStatement.setInt(5, (page - 10));
      } else if (searchParams[0] != "" && searchParams[1] == "" && searchParams[2] != ""
              && searchParams[3] == "" && searchParams[4] == "") {
        preparedStatement.setString(1, searchParams[0]);
        preparedStatement.setString(2, searchParams[2]);
        preparedStatement.setString(3, searchParams[0]);
        preparedStatement.setString(4, searchParams[2]);
        preparedStatement.setInt(5, (page - 10));
      } else if (searchParams[0] == "" && searchParams[1] != "" && searchParams[2] != ""
              && searchParams[3] == "" && searchParams[4] == "") {
        preparedStatement.setString(1, searchParams[1] + wildcard);
        preparedStatement.setString(2, searchParams[2]);
        preparedStatement.setString(3, searchParams[1] + wildcard);
        preparedStatement.setString(4, searchParams[2]);
        preparedStatement.setInt(5, (page - 10));
      } else if (searchParams[0] != "" && searchParams[1] != "" && searchParams[2] != ""
              && searchParams[3] == "" && searchParams[4] == "") {
        preparedStatement.setString(1, searchParams[0]);
        preparedStatement.setString(2, searchParams[1] + wildcard);
        preparedStatement.setString(3, searchParams[2]);
        preparedStatement.setString(4, searchParams[0]);
        preparedStatement.setString(5, searchParams[1] + wildcard);
        preparedStatement.setString(6, searchParams[2]);
        preparedStatement.setInt(7, (page - 10));
      } else if (searchParams[0] != "" && searchParams[1] == "" && searchParams[2] == ""
              && searchParams[3] != "" && searchParams[4] != "") {
        preparedStatement.setString(1, searchParams[0]);
        preparedStatement.setString(2, searchParams[3]);
        preparedStatement.setString(3, searchParams[4]);
        preparedStatement.setString(4, searchParams[0]);
        preparedStatement.setString(5, searchParams[3]);
        preparedStatement.setString(6, searchParams[4]);
        preparedStatement.setInt(7, (page - 10));
      } else if (searchParams[0] == "" && searchParams[1] != "" && searchParams[2] == ""
              && searchParams[3] != "" && searchParams[4] != "") {
        preparedStatement.setString(1, searchParams[1] + wildcard);
        preparedStatement.setString(2, searchParams[3]);
        preparedStatement.setString(3, searchParams[4]);
        preparedStatement.setString(4, searchParams[1] + wildcard);
        preparedStatement.setString(5, searchParams[3]);
        preparedStatement.setString(6, searchParams[4]);
        preparedStatement.setInt(7, (page - 10));
      } else if (searchParams[0] == "" && searchParams[1] == "" && searchParams[2] != ""
              && searchParams[3] != "" && searchParams[4] != "") {
        preparedStatement.setString(1, searchParams[2]);
        preparedStatement.setString(2, searchParams[3]);
        preparedStatement.setString(3, searchParams[4]);
        preparedStatement.setString(4, searchParams[2]);
        preparedStatement.setString(5, searchParams[3]);
        preparedStatement.setString(6, searchParams[4]);
        preparedStatement.setInt(7, (page - 10));
      } else if (searchParams[0] != "" && searchParams[1] != "" && searchParams[2] == ""
              && searchParams[3] != "" && searchParams[4] != "") {
        preparedStatement.setString(1, searchParams[0]);
        preparedStatement.setString(2, searchParams[1] + wildcard);
        preparedStatement.setString(3, searchParams[3]);
        preparedStatement.setString(4, searchParams[4]);
        preparedStatement.setString(5, searchParams[0]);
        preparedStatement.setString(6, searchParams[1] + wildcard);
        preparedStatement.setString(7, searchParams[3]);
        preparedStatement.setString(8, searchParams[4]);
        preparedStatement.setInt(9, (page - 10));
      } else if (searchParams[0] != "" && searchParams[1] == "" && searchParams[2] != ""
              && searchParams[3] != "" && searchParams[4] != "") {
        preparedStatement.setString(1, searchParams[0]);
        preparedStatement.setString(2, searchParams[2]);
        preparedStatement.setString(3, searchParams[3]);
        preparedStatement.setString(4, searchParams[4]);
        preparedStatement.setString(5, searchParams[0]);
        preparedStatement.setString(6, searchParams[2]);
        preparedStatement.setString(7, searchParams[3]);
        preparedStatement.setString(8, searchParams[4]);
        preparedStatement.setInt(9, (page - 10));
      }
      rs = preparedStatement.executeQuery();
      while (rs.next()) {
        Employee employee = new Employee();
        employee.setEmpId(rs.getInt("EMPLOYEE_ID"));
        employee.setfirstName(rs.getString("FIRST_NAME"));
        employee.setlastName(rs.getString("LAST_NAME"));
        employee.setEmail(rs.getString("EMAIL"));
        employee.setPhone(rs.getString("PHONE_NUMBER"));
        employee.sethireDate(convert.formatDate(rs.getDate("HIRE_DATE"),"yyyy/MM/dd"));
        employee.setjobTitle(rs.getString("JOB_TITLE"));
        employee.setSalary(convert.convertSalary(convert.formatDecimal(rs.getDouble("SALARY"))));
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
}
