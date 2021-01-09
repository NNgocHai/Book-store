package com.bookstore.controller.admin;

import com.bookstore.entity.AdminsEntity;
import com.bookstore.entity.CustomerEntity;
import com.bookstore.service.AdminService;
import com.bookstore.service_impl.AdminService_impl;
import com.bookstore.service_impl.CustomerService_impl;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet("/admin/user/edit")

public class CustomerEdit extends HttpServlet {
    public CustomerEdit() {
        super();
    }

    CustomerService_impl customer = new CustomerService_impl();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        int id= Integer.parseInt(request.getParameter("id"));
        CustomerEntity customerEntity = customer.findById(id);
        request.setAttribute("customer", customerEntity);
        RequestDispatcher dispatcher = request.getRequestDispatcher("/views/admin/edituser.jsp");
        dispatcher.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setContentType("text/html;charset=UTF-8");

        String id = (request.getParameter("id"));

        String customer_tk = request.getParameter("customer-username");
        String customer_password = request.getParameter("customer-password");
        String customer_name = request.getParameter("customer-name");
        String customer_gmail = request.getParameter("customer-email");
        String customer_sdt = request.getParameter("customer-sdt");
        String customer_vitien = request.getParameter("customer-vitien");
        try {
            if(!id.equals("")&&(!customer_tk.equals("")&&(!customer_password.equals(""))&&(!customer_name.equals(""))&&(!customer_gmail.equals(""))&&(!customer_sdt.equals(""))
            &&(!customer_vitien.equals(""))))
            {
                CustomerEntity customerEntity = new CustomerEntity();
                customerEntity.setMa_Customer(Integer.parseInt(id));
                customerEntity.setTaikhoan_Customer(customer_tk);
                customerEntity.setGmail_Customer(customer_gmail);
                customerEntity.setHoten_Customer(customer_name);
                customerEntity.setMatkhau_Customer(customer_password);
                customerEntity.setSdt_Customer(customer_sdt);
                customerEntity.setVitien(Integer.valueOf(customer_vitien));
                customer.update(customerEntity);
                response.sendRedirect(request.getContextPath() + "/admin/user/list");
            }
            else {
                request.setAttribute("errorMessage", "Vui lòng điền đầy đủ các thông tin");
                request.setAttribute("id",id);
                request.setAttribute("customer_tk",customer_tk);
                request.setAttribute("customer_password",customer_password);
                request.setAttribute("customer_name",customer_name);
                request.setAttribute("customer_gmail",customer_gmail);
                request.setAttribute("customer_sdt",customer_sdt);
                request.setAttribute("customer_vitien",customer_vitien);
                RequestDispatcher rd = request.getRequestDispatcher("/views/admin/edituser.jsp");
                rd.forward(request, response);
            }
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
            out.println("alert('Trung tai khoan hoac gmail hoac so dien thoai')");
            out.println("location.href = './edit?admin-id="+id+"';");
            out.println("</script>");
            out.println("</body>");
            out.println("</html>");
            out.close();
        }
    }
}
