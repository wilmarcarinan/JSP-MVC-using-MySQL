package com.training.dao;

import com.training.model.Job;
import com.training.util.DbUtil;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class JobDao {
  private Connection connection;

  public JobDao() {
    connection = DbUtil.getConnection();
  }

  /** Return all the job titles present
   *  in the database.
   */
  public List<Job> getJobsQuery() {
    ResultSet rs = null;
    List<Job> jobs = new ArrayList<Job>();
    StringBuilder query = new StringBuilder();

    query.append("SELECT ");
    query.append("    JOB_TITLE, ");
    query.append("    MIN_SALARY, ");
    query.append("    MAX_SALARY ");
    query.append("FROM ");
    query.append("    JOBS");

    try {
      PreparedStatement preparedStatement = connection.prepareStatement(query.toString());
      rs = preparedStatement.executeQuery();

      while (rs.next()) {
        Job job = new Job();
        job.setjobTitle(rs.getString("JOB_TITLE"));
        job.setminSalary(rs.getInt("MIN_SALARY"));
        job.setmaxSalary(rs.getInt("MAX_SALARY"));
        jobs.add(job);
      }

      preparedStatement.close();
      rs.close();
    } catch (SQLException e) {
      e.printStackTrace();
    }
    return jobs;
  }

  /** Return the job.
   *
   */
  public Job getJobQuery(String jobTitle) {
    ResultSet rs = null;
    StringBuilder query = new StringBuilder();

    query.append("SELECT ");
    query.append("    JOB_TITLE, ");
    query.append("    MIN_SALARY, ");
    query.append("    MAX_SALARY ");
    query.append("FROM ");
    query.append("    JOBS ");
    query.append("WHERE ");
    query.append("    JOB_TITLE = ");
    query.append("    ?");

    Job job = new Job();
    try {
      PreparedStatement preparedStatement = connection.prepareStatement(query.toString());
      preparedStatement.setString(1, jobTitle);
      rs = preparedStatement.executeQuery();
      if (rs.next()) {
        job.setjobTitle(rs.getString("JOB_TITLE"));
        job.setminSalary(rs.getDouble("MIN_SALARY"));
        job.setmaxSalary(rs.getDouble("MAX_SALARY"));
      }

      rs.close();
      preparedStatement.close();

    } catch (SQLException e) {
      e.printStackTrace();
    }
    return job;
  }
}
