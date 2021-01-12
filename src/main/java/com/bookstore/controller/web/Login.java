package com.bookstore.controller.web;

import com.bookstore.dao.CustomerDao;
import com.bookstore.dao_impl.CustomerDao_impl;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/web/login")
public class Login extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        RequestDispatcher dispatcher = this.getServletContext().getRequestDispatcher("/views/web/login.jsp");
        dispatcher.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");
        String user = request.getParameter("user");
        String password = request.getParameter("password");
        CustomerDao customerDao = new CustomerDao_impl();
        try {
            boolean a = customerDao.checkCustomerLogin(user,password);
            if (a) {
                HttpSession session = request.getSession();
                session.setAttribute("user", user);
                session.setAttribute("password", password);
                response.sendRedirect(request.getContextPath() + "/web/home");
            } else {
                request.setAttribute("errorMessage", "Tài khoản hoặc mật khẩu sai!");
                RequestDispatcher rd = request.getRequestDispatcher("/views/web/login.jsp");
                rd.forward(request, response);
            }
        }
        catch (Exception e)
        {e.printStackTrace();}

    }
}
