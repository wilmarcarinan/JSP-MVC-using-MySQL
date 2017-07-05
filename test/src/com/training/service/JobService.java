package com.training.service;

import com.training.dao.JobDao;
import com.training.model.Job;

import java.util.List;

public class JobService {
  private JobDao jobDao = new JobDao();

  /** Interact with the Dao Layer to get
   *  all the jobs in the database.
   */
  public List<Job> getJobs() {
    return jobDao.getJobsQuery();
  }

  /** Return the job where job title
   *  is the entered job title of the user.
   */
  public Job getJob(String jobTitle) {
    return jobDao.getJobQuery(jobTitle);
  }
}
