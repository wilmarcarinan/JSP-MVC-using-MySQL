package com.training.model;

public class Department {
  private int departmentId;
  private String departmentName;
  private int managerId;

  public int getdepartmentId() {
    return departmentId;
  }

  public void setdepartmentId(int departmentId) {
    this.departmentId = departmentId;
  }

  public String getdepartmentName() {
    return departmentName;
  }

  public void setdepartmentName(String departmentName) {
    this.departmentName = departmentName;
  }

  public int getmanagerId() {
    return managerId;
  }

  public void setmanagerId(int managerId) {
    this.managerId = managerId;
  }

  @Override
  public String toString() {
    return "Departments [departmentId=" + departmentId + ", departmentName="
        + departmentName + ", managerId=" + managerId + "]";
  }
}
