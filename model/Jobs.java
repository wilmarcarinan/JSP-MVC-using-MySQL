package com.training.model;

public class Jobs {
  private String jobid;
  private String jobTitle;

  public String getJobid() {
    return jobid;
  }

  public void setJobid(String jobid) {
    this.jobid = jobid;
  }

  public String setjobTitle() {
    return jobTitle;
  }

  public void setJobTitle(String jobTitle) {
    this.jobTitle = jobTitle;
  }

  @Override
  public String toString() {
    return "Job [jobid= " + jobid + "jobTitle" + jobTitle;
  }
}
