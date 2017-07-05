package com.training.model;

public class Job {
  private String jobId;
  private String jobTitle;
  private double minSalary;
  private double maxSalary;

  public String getJjobId() {
    return jobId;
  }

  public void setjobId(String jobId) {
    this.jobId = jobId;
  }

  public String getjobTitle() {
    return jobTitle;
  }

  public void setjobTitle(String jobTitle) {
    this.jobTitle = jobTitle;
  }

  public double getminSalary() {
    return minSalary;
  }

  public void setminSalary(double minSalary) {
    this.minSalary = minSalary;
  }

  public double getmaxSalary() {
    return maxSalary;
  }

  public void setmaxSalary(double maxSalary) {
    this.maxSalary = maxSalary;
  }

  @Override
  public String toString() {
    return "Jobs [jobId=" + jobId + ", jobTitle=" + jobTitle
              + ", minSalary=" + minSalary + ", maxSalary=" + maxSalary + "]";
  }
}
