/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package org.avid.controller;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.swing.JOptionPane;
import org.avid.dao.EmployeeDao;
import org.avid.model.Employee;
import org.avid.util.Constants;
import org.avid.util.Conversion;

/**
 *
 * @author Wilmar Paul
 */
public class EmployeeController extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private final EmployeeDao dao;
    private final Conversion convert;

    public EmployeeController() {
        super();
        dao = new EmployeeDao();
        convert = new Conversion();
    }
    
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        String forward="";
        String action = request.getParameter("action");
        String[] searchParams = new String[5];
        
        if (action.equalsIgnoreCase("delete")){
            int userId = Integer.parseInt(request.getParameter("userId"));
            dao.deleteUser(userId);
            forward = Constants.LIST_USER;
            request.setAttribute("users", dao.getAllUsers());   
        } else if (action.equalsIgnoreCase("edit")){
            forward = Constants.INSERT_OR_EDIT;
            int userId = Integer.parseInt(request.getParameter("userId"));
            Employee user = dao.getUserById(userId);
            request.setAttribute("employee", user);
        } else if (action.equals("ListEmployee")){
            forward = Constants.LIST_USER;
            request.setAttribute("employees", dao.getAllUsers());
        } else if (action.equals("search")) {
            forward = Constants.LIST_USER;
            searchParams[0] = request.getParameter("FirstName");
            searchParams[1] = request.getParameter("LastName");
            searchParams[2] = request.getParameter("Email");
            searchParams[3] = request.getParameter("HireDate");
            searchParams[4] = request.getParameter("HireDate2");
//            JOptionPane.showMessageDialog(null, convert.formatDateString(searchParams[3]));
//            JOptionPane.showMessageDialog(null, searchParams[3]);
            request.setAttribute("employees",dao.searchEmployee(searchParams));
        } else {
            forward = Constants.INSERT_OR_EDIT;
        }
        RequestDispatcher view = request.getRequestDispatcher(forward);
        view.forward(request, response);
    }
    
     protected void doPost(HttpServletRequest request, HttpServletResponse response) 
             throws ServletException, IOException {
        Employee user = new Employee();
        user.setfirstName(request.getParameter("firstName"));
        user.setlastName(request.getParameter("lastName"));

        try {
            Date dob = new SimpleDateFormat("MM/dd/yyyy").parse(request.getParameter("dob"));
            user.sethireDate(dob);
        } catch (ParseException e) {
            e.printStackTrace();
        }
        user.setEmail(request.getParameter("email"));
        String userid = request.getParameter("userid");
        
        if(userid == null || userid.isEmpty())
        {
            dao.addUser(user);
        }
        else
        {
            user.setEmpId(Integer.parseInt(userid));
            dao.updateUser(user);
        }
        RequestDispatcher view = request.getRequestDispatcher(Constants.LIST_USER);
        request.setAttribute("users", dao.getAllUsers());
        view.forward(request, response);
    }
}
