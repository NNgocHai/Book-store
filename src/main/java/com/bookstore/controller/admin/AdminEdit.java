package com.bookstore.controller.admin;

import com.bookstore.entity.AdminsEntity;
import com.bookstore.service.AdminService;
import com.bookstore.service_impl.AdminService_impl;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet("/admin/admin/edit")
public class AdminEdit extends HttpServlet {
    public AdminEdit() {
        super();
    }

    AdminService adminService = new AdminService_impl();
    //AdminDao adminDao = new AdminDao_impl();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        int admin_id= Integer.parseInt(request.getParameter("admin-id"));
        int admin_idd = Integer.parseInt(Integer.valueOf(request.getParameter("admin-id")).toString());
//        Admin admin = adminService.get(admin_id);
        AdminsEntity adminsEntity = adminService.findById(admin_id);
        request.setAttribute("admin", adminsEntity);
        RequestDispatcher dispatcher = request.getRequestDispatcher("/views/admin/editadmin.jsp");
        dispatcher.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setContentType("text/html;charset=UTF-8");
        int admin_id = Integer.parseInt(request.getParameter("admin-id"));
        String admin_tk= request.getParameter("admin-username");
        String admin_password = request.getParameter("admin-password");
        String admin_name = request.getParameter("admin-name");
        String admin_email = request.getParameter("admin-email");
        try {
            AdminsEntity adminsEntity = new AdminsEntity();
            adminsEntity.setMa_Admin(admin_id);
            adminsEntity.setTaikhoan_Admin(admin_tk);
            adminsEntity.setMatkhau_Admin(admin_password);
            adminsEntity.setHoten_Admin(admin_name);
            adminsEntity.setGmail_Admin(admin_email);
            adminService.update(adminsEntity);
            response.sendRedirect(request.getContextPath() + "/admin/admin/list");
        }
        catch (Exception e)
        {
            PrintWriter out = response.getWriter();
            out.print("<%@ page contentType=\"text/html;charset=UTF-8\" language=\"java\" %>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Loi</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<script>");
            out.println("alert('Trung tai khoan hoac gmail')");
            out.println("location.href = './edit?admin-id="+admin_id+"';");
            out.println("</script>");
            out.println("</body>");
            out.println("</html>");
            out.close();
        }
    }
}

