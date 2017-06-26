/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package org.avid.model;

import java.util.Date;

public class Employee {
  private int empid;
  private String firstName;
  private String lastName;
  private String email;
  private String phone;
  private Date hireDate;
  private String jobTitle;
  private int salary;
  private String department;
  private String manager;

  public int getEmpid() {
    return empid;
  }

  public void setEmpId(int empid) {
    this.empid = empid;
  }

  public String getfirstName() {
    return firstName;
  }

  public void setfirstName(String firstName) {
    this.firstName = firstName;
  }

  public String getlastName() {
    return lastName;
  }

  public void setlastName(String lastName) {
    this.lastName = lastName;
  }

  public String getEmail() {
    return email;
  }

  public void setEmail(String email) {
    this.email = email;
  }

  public String getPhone() {
    return phone;
  }

  public void setPhone(String phone) {
    this.phone = phone;
  }

  public Date gethireDate() {
    return hireDate;
  }

  public void sethireDate(Date hireDate) {
    this.hireDate = hireDate;
  }

  public String getjobTitle() {
    return jobTitle;
  }

  public void setjobTitle(String jobTitle) {
    this.jobTitle = jobTitle;
  }

  public int getSalary() {
    return salary;
  }

  public void setSalary(int salary) {
    this.salary = salary;
  }

  public String getDepartment() {
    return department;
  }

  public void setDepartment(String department) {
    this.department = department;
  }

  public String getManager() {
    return manager;
  }

  public void setManager(String manager) {
    this.manager = manager;
  }

  @Override

  public String toString() {

    return "Employee [empid=" + empid + ", firstName=" + firstName

              + ", lastName=" + lastName + ", email=" + email + ", phone="

              + phone + ", hireDate=" + hireDate + ", jobTitle=" + jobTitle + ", salary="

              + salary + ", manager=" + manager + ", department=" + department + "]";

  }
}