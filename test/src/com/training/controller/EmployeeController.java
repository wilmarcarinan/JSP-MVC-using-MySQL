package com.training.controller;

import com.training.service.EmployeeService;
import com.training.service.JobService;
import com.training.util.Constants;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class EmployeeController extends HttpServlet {
  private EmployeeService service;
  private JobService jobService;
  private static final long serialVersionUID = 1L;

  /**
   * .
   */
  public EmployeeController() {
    super();
    service = new EmployeeService();
    jobService = new JobService();
  }

  protected void doGet(HttpServletRequest request, HttpServletResponse response)
      throws ServletException, IOException {

    HttpSession session = request.getSession();
    String forward = "";
    String action = request.getParameter("action");
    String page = request.getParameter("page");
    String[] searchParams = new String[5];

    if (action.equals("add")) {
      forward = Constants.INSERT_OR_EDIT;
      request.setAttribute("jobs", jobService.getJobs());
      request.setAttribute("departments", service.getDepartments());
    } else if (action.equals("edit")) {
      forward = Constants.INSERT_OR_EDIT;
      int empid = 0;
      try {
        empid = Integer.parseInt(request.getParameter("empid"));
      } catch (Exception e) {
        System.out.println(e);
      }

      request.setAttribute("jobs", jobService.getJobs());
      request.setAttribute("departments", service.getDepartments());
      request.setAttribute("employee", service.getEmpById(empid));
    } else if (action.equals("ListEmployee")) {
      forward = Constants.LIST_USER;
      session.removeAttribute("numErrors");
      session.removeAttribute("errors");
      session.removeAttribute("searchValues");
      request.setAttribute("employees", service.listEmployees(page));
    } else if (action.equals("search")) {
      forward = Constants.LIST_USER;
      searchParams[0] = request.getParameter("FirstName");
      searchParams[1] = request.getParameter("LastName");
      searchParams[2] = request.getParameter("Email");
      searchParams[3] = request.getParameter("HireDate");
      searchParams[4] = request.getParameter("HireDate2");

      if (searchParams[0] == "" && searchParams[1] == "" && searchParams[2] == ""
          && searchParams[3] == "" && searchParams[4] == "") {
        request.setAttribute("employees", service.listEmployees(page));
      }

      if (service.searchValidateInputs(searchParams)) {
        request.setAttribute("employees", service.searchEmployees(page, searchParams));
      } else {
        service.searchErrors(searchParams);
      }
      session.setAttribute("searchValues", service.old(searchParams));
      session.setAttribute("errors", service.searchErrors(searchParams));
      session.setAttribute("numErrors", service.errorStatus(service.searchErrors(searchParams)));
    }
    RequestDispatcher view = request.getRequestDispatcher(forward);
    view.forward(request, response);
  }

  protected void doPost(HttpServletRequest request, HttpServletResponse response)
      throws ServletException, IOException {
    String[] params = new String[12];
    String status = "";

    params[0] = request.getParameter("empid");
    params[1] = request.getParameter("FirstName");
    params[2] = request.getParameter("LastName");
    params[3] = request.getParameter("Email");
    params[4] = request.getParameter("Phone");
    params[5] = request.getParameter("HireDate");
    params[6] = request.getParameter("JobTitle");
    params[7] = request.getParameter("Salary");
    params[8] = request.getParameter("Commission");
    params[9] = request.getParameter("Department");
    params[10] = request.getParameter("Manager_ID");
    params[11] = request.getParameter("manager");

    String action = request.getParameter("action");
    String oldEmail = request.getParameter("oldEmail");
    HttpSession session = request.getSession();

    if (action.equals("add")) {
      if (service.addValidateInputs(params) && (!service.emailExist(params[3]))) {
        service.addEmployee(params);
        status = params[1] + " " + params[2] + " has been registered.";
        session.setAttribute("status", status);
        response.sendRedirect("index.jsp");
      } else {
        request.setAttribute("numErrors", service.addErrStatus(service.addErrorMsgs(params, "")));
        session.setAttribute("AddEditErrors", service.addErrorMsgs(params,""));
        session.setAttribute("old", service.old(params));
        response.sendRedirect("AddEdit?action=add");
      }
    } else if (action.equals("edit")) {
      if (service.addValidateInputs(params)) {
        service.updateEmployee(params);
        status = params[1] + " " + params[2] + " has been updated.";
        session.setAttribute("status", status);
        response.sendRedirect("index.jsp");
      } else {
        request.setAttribute("numErrors", service.addErrStatus(service
            .addErrorMsgs(params, oldEmail)));
        session.setAttribute("AddEditErrors", service.addErrorMsgs(params,oldEmail));
        session.setAttribute("old", service.old(params));
        response.sendRedirect("AddEdit?action=edit&empid=" + params[0] + "&oldEmail=" + oldEmail);
      }
    }

  }
}
