package com.bookstore.controller.shipper;

import com.bookstore.service.ShipperService;
import com.bookstore.service_impl.ShipperService_impl;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/shipper/login")
public class ShipperLogin extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        RequestDispatcher dispatcher = this.getServletContext().getRequestDispatcher("/views/shipper/login.jsp");
        dispatcher.forward(request, response);
    }
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");
        String user = request.getParameter("user");
        String password = request.getParameter("password");
        ShipperService shipper = new ShipperService_impl();
        if (shipper.checkShipperLogin(user,password)) {
            HttpSession session = request.getSession();
            session.setAttribute("user", user);
            session.setAttribute("password", password);
            response.sendRedirect(request.getContextPath() + "/shipper/home");
        } else {
            request.setAttribute("errorMessage", "Tài khoản hoặc mật khẩu sai!");
            RequestDispatcher rd = request.getRequestDispatcher("/views/shipper/login.jsp");
            rd.forward(request, response);
        }
    }
}