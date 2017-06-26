/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package org.avid.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import org.avid.model.Employee;
import org.avid.util.Conversion;
import org.avid.util.DbUtil;

/**
 *
 * @author Wilmar Paul
 */
public class EmployeeDao {
    private Connection connection;

    public EmployeeDao() {
        connection = DbUtil.getConnection();
    }
    
    /*
    Get all users from the database.
    */
    public List<Employee> getAllUsers() {
        ResultSet rs = null;
        List<Employee> employees = new ArrayList<Employee>();
        StringBuilder query = new StringBuilder();
        
        query.append("SELECT ");
        query.append("    EMPLOYEE_ID, ");
        query.append("    FIRST_NAME, ");
        query.append("    LAST_NAME, ");
        query.append("    EMAIL, ");
        query.append("    PHONE_NUMBER, ");
        query.append("    HIRE_DATE, ");
        query.append("    JOB_ID, ");
        query.append("    SALARY, ");
        query.append("    DEPARTMENT_ID ");
        query.append("FROM ");
        query.append("    EMPLOYEES ");
//        query.append("WHERE ");
//        query.append("    FIRST_NAME = ");
//        query.append("    Chris ");
        try {
          PreparedStatement preparedStatement = connection.prepareStatement(query.toString());
          rs = preparedStatement.executeQuery();
          
          while (rs.next()) {
              Employee employee = new Employee();
              employee.setEmpId(rs.getInt("EMPLOYEE_ID"));
              employee.setfirstName(rs.getString("FIRST_NAME"));
              employee.setlastName(rs.getString("LAST_NAME"));
              employee.sethireDate(rs.getDate("HIRE_DATE"));
              employee.setEmail(rs.getString("EMAIL"));
              employee.setManager("");
              employee.setPhone(rs.getString("PHONE_NUMBER"));
              employee.setSalary(rs.getInt("SALARY"));
              employee.setDepartment("");
              employee.setjobTitle("");
              employees.add(employee);
          }
          preparedStatement.close();
          rs.close();
        } catch (SQLException e) {
           e.printStackTrace();
        }
        return employees;
    }
    
    public List<Employee> searchEmployee(String[] searchParams) {
        Conversion convert = new Conversion();
        ResultSet rs = null;
        List<Employee> employees = new ArrayList<Employee>();
        StringBuilder query = new StringBuilder();
        
        query.append("SELECT ");
        query.append("    EMPLOYEE_ID, ");
        query.append("    FIRST_NAME, ");
        query.append("    LAST_NAME, ");
        query.append("    EMAIL, ");
        query.append("    PHONE_NUMBER, ");
        query.append("    HIRE_DATE, ");
        query.append("    JOB_ID, ");
        query.append("    SALARY, ");
        query.append("    DEPARTMENT_ID ");
        query.append("FROM ");
        query.append("    EMPLOYEES ");
        query.append("WHERE ");
        query.append("    FIRST_NAME = ");
        query.append("    ? ");
        query.append("AND ");
        query.append("    LAST_NAME = ");
        query.append("    ? ");
        query.append("AND ");
        query.append("    EMAIL = ");
        query.append("    ? ");
        query.append("AND ");
        query.append("    HIRE_DATE >= ");
        query.append("    ? ");
        query.append("AND ");
        query.append("    HIRE_DATE <= ");
        query.append("    ?");
        
        try {
          PreparedStatement preparedStatement = connection.prepareStatement(query.toString());
          preparedStatement.setString(1, searchParams[0]);
          preparedStatement.setString(2, searchParams[1]);
          preparedStatement.setString(3, searchParams[2]);
          preparedStatement.setString(4, convert.formatDateString(searchParams[3]));
          preparedStatement.setString(5, convert.formatDateString(searchParams[4]));
          rs = preparedStatement.executeQuery();
          
          while (rs.next()) {
              Employee employee = new Employee();
              employee.setEmpId(rs.getInt("EMPLOYEE_ID"));
              employee.setfirstName(rs.getString("FIRST_NAME"));
              employee.setlastName(rs.getString("LAST_NAME"));
              employee.sethireDate(rs.getDate("HIRE_DATE"));
              employee.setEmail(rs.getString("EMAIL"));
              employee.setManager("");
              employee.setPhone(rs.getString("PHONE_NUMBER"));
              employee.setSalary(rs.getInt("SALARY"));
              employee.setDepartment("");
              employee.setjobTitle("");
              employees.add(employee);
          }
          preparedStatement.close();
          rs.close();
        } catch(SQLException e) {
            e.printStackTrace();
        }
        return employees;
    }
    
    public Employee getUserById(int userId) {
        ResultSet rs = null;
        Employee employee = new Employee();
        StringBuilder query = new StringBuilder();
        
        query.append("Select ");
        query.append("    userid, ");
        query.append("    firstname, ");
        query.append("    lastname, ");
        query.append("    dob, ");
        query.append("    email ");
        query.append("From ");
        query.append("    Users ");
        query.append("Where ");
        query.append("    userid = ");
        query.append("    ?");
        try {
            PreparedStatement preparedStatement = connection.
                    prepareStatement(query.toString());
            preparedStatement.setInt(1, userId);
            rs = preparedStatement.executeQuery();
            
            if (rs.next()) {
                employee.setEmpId(rs.getInt("EMPLOYEE_ID"));
                employee.setfirstName(rs.getString("FIRST_NAME"));
                employee.setlastName(rs.getString("LAST_NAME"));
                employee.sethireDate(rs.getDate("HIRE_DATE"));
                employee.setEmail(rs.getString("EMAIL"));
                employee.setManager("");
                employee.setPhone(rs.getString("PHONE_NUMBER"));
                employee.setDepartment("");
                employee.setjobTitle("");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return employee;
    }
    
    public void addUser(Employee user) {
        ResultSet rs = null;
        StringBuilder query = new StringBuilder();
        
        query.append("Insert into ");
        query.append("    users(");
        query.append("        firstname, ");
        query.append("        lastname, ");
        query.append("        dob, ");
        query.append("        email) ");
        query.append("    Values(");
        query.append("        ?, ");
        query.append("        ?, ");
        query.append("        ?, ");
        query.append("        ?) ");
        try {
            PreparedStatement preparedStatement = connection
                    .prepareStatement("insert into users(firstname,lastname,dob,email) values (?, ?, ?, ? )");
            // Parameters start with 1
            preparedStatement.setString(1, user.getfirstName());
            preparedStatement.setString(2, user.getlastName());
            preparedStatement.setDate(3, new java.sql.Date(user.gethireDate().getTime()));
            preparedStatement.setString(4, user.getEmail());
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void deleteUser(int empid) {
        ResultSet rs = null;
        StringBuilder query = new StringBuilder();
        query.append("Delete ");
        query.append("From ");
        query.append("    users ");
        query.append("Where ");
        query.append("    userid = ");
        query.append("    ?");
        
        try {
            PreparedStatement preparedStatement = connection
                    .prepareStatement(query.toString());
            // Parameters start with 1
            preparedStatement.setInt(1, empid);
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    
    public void updateUser(Employee user) {
        ResultSet rs = null;
        StringBuilder query = new StringBuilder();
        query.append("Update ");
        query.append("    users ");
        query.append("Set ");
        query.append("    firstname = ");
        query.append("    ?, ");
        query.append("    lastname = ");
        query.append("    ?, ");
        query.append("    dob = ");
        query.append("    ?, ");
        query.append("    email = ");
        query.append("    ? ");
        query.append("Where ");
        query.append("    userid = ");
        query.append("    ?");
        try {
            PreparedStatement preparedStatement = connection
                    .prepareStatement(query.toString());
            // Parameters start with 1
            preparedStatement.setString(1, user.getfirstName());
            preparedStatement.setString(2, user.getlastName());
            preparedStatement.setDate(3, new java.sql.Date(user.gethireDate().getTime()));
            preparedStatement.setString(4, user.getEmail());
            preparedStatement.setInt(5, user.getEmpid());
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}