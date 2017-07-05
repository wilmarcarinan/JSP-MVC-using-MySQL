package com.training.model;

public class Employee {
  private int empid;
  private int totalRows;
  private int managerId;
  private double commission;
  private String firstName;
  private String lastName;
  private String email;
  private String phone;
  private String hireDate;
  private String jobTitle;
  private String salary;
  private String department;
  private String manager;

  public int getEmpid() {
    return empid;
  }

  public void setEmpId(int empid) {
    this.empid = empid;
  }

  public int getTotal() {
    return totalRows;
  }

  public void setTotal(int totalRows) {
    this.totalRows = totalRows;
  }

  public double getCommission() {
    return commission;
  }

  public void setCommission(double commission) {
    this.commission = commission;
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

  public String gethireDate() {
    return hireDate;
  }

  public void sethireDate(String hireDate) {
    this.hireDate = hireDate;
  }

  public String getjobTitle() {
    return jobTitle;
  }

  public void setjobTitle(String jobTitle) {
    this.jobTitle = jobTitle;
  }

  public String getSalary() {
    return salary;
  }

  public void setSalary(String salary) {
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

  public int getManagerId() {
    return managerId;
  }

  public void setManagerId(int managerId) {
    this.managerId = managerId;
  }

  @Override

  public String toString() {

    return "Employee [empid=" + empid + ", firstName=" + firstName

              + ", lastName=" + lastName + ", email=" + email + ", phone="

              + phone + ", hireDate=" + hireDate + ", jobTitle=" + jobTitle + ", salary="

              + salary + ",commission=" + commission + ", manager=" + manager + ", department="

              + department + ", totalRows=" + totalRows + "]";

  }
}
