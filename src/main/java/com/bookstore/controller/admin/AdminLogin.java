package com.bookstore.controller.admin;

import com.bookstore.dao.AdminLoginDao;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;


@WebServlet("/admin/login")
public class AdminLogin extends HttpServlet {

    public AdminLogin() {
        super();
    }
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
        RequestDispatcher dispatcher = this.getServletContext().getRequestDispatcher("/views/admin/login.jsp");
        dispatcher.forward(request, response);
    }
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");
        String user = request.getParameter("user");
        String password = request.getParameter("password");
        if (AdminLoginDao.checkAdminLogin(user, password)) {
            HttpSession session = request.getSession();
            session.setAttribute("user", user);
            session.setAttribute("password", password);
            response.sendRedirect(request.getContextPath() + "/admin-home");
        } else {
            request.setAttribute("errorMessage", "Tài khoản hoặc mật khẩu sai!");
            RequestDispatcher rd = request.getRequestDispatcher("/views/admin/login.jsp");
            rd.forward(request, response);
        }
    }
}