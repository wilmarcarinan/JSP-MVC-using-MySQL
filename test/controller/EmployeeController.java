package com.training.controller;

import com.training.service.EmployeeService;
import com.training.util.Constants;
import com.training.util.Validation;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.swing.JOptionPane;


public class EmployeeController extends HttpServlet {
  private EmployeeService service;
  private Validation validate;
  private static final long serialVersionUID = 1L;

  /**
   * .
   */
  public EmployeeController() {
    super();
    service = new EmployeeService();
    validate = new Validation();
  }

  protected void doGet(HttpServletRequest request, HttpServletResponse response)
      throws ServletException, IOException {
    String forward = "";
    String action = request.getParameter("action");
    String page = request.getParameter("page");
    String[] searchParams = new String[5];

    if (action.equalsIgnoreCase("edit")) {
      forward = Constants.INSERT_OR_EDIT;
      //int empid = Integer.parseInt(request.getParameter("empid"));
      //Employee employee = dao.getEmployeeById(empid);
      //request.setAttribute("employees", employee);
    } else if (action.equals("ListEmployee")) {
      forward = Constants.LIST_USER;
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
      } else {
        if (searchParams[0] != "" && searchParams[1] != "" && searchParams[2] != ""
              && searchParams[3] != "" && searchParams[4] != "") {
          if (validate.checkIfNotAlphaNum(searchParams[0])
                && validate.checkIfNotAlphaNum(searchParams[1])
                && validate.checkIfEmail(searchParams[2])
                && validate.checkIfDate(searchParams[3])
                && validate.checkIfDate(searchParams[4])) {
            //          JOptionPane.showMessageDialog(null, "Valid FirstName");
            request.setAttribute("employees", service.searchEmployees(page, searchParams));
          } else {
            JOptionPane.showMessageDialog(null, "Error");
          }
          request.setAttribute("employees", service.searchEmployees(page, searchParams));
        }
      }
    }
    RequestDispatcher view = request.getRequestDispatcher(forward);
    view.forward(request, response);
  }
}
