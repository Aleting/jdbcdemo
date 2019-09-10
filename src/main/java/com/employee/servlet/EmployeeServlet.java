package com.employee.servlet;

import com.employee.dao.EmployeeDao;

import javax.servlet.*;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class EmployeeServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;
    private EmployeeDao dao;
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        System.out.println("saughvgvd");
        RequestDispatcher view = request.getRequestDispatcher("/EmployeeList.jsp");
        request.setAttribute("users", dao.getAllEmployees());
        view.forward(request, response);
    }

    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    @Override
    public void init(ServletConfig servletConfig) throws ServletException {
        dao = new EmployeeDao();
        System.out.println("初始化成功！");
    }

    @Override
    public ServletConfig getServletConfig() {
        return null;
    }
    @Override
    public String getServletInfo() {
        return null;
    }

    @Override
    public void destroy() {

    }
}


