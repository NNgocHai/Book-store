package com.bookstore.controller.admin;


import com.bookstore.entity.CuonSachEntity;
import com.bookstore.service.CuonSachService;
import com.bookstore.service_impl.CuonSachService_impl;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;
@WebServlet("/admin/product/list")
public class CuonSachViewList extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        CuonSachService cuonSachService=new CuonSachService_impl();
        List<CuonSachEntity> cuonSachList = cuonSachService.findAll();
        request.setAttribute("cuonsachList", cuonSachList);
        RequestDispatcher dispatcher = request.getRequestDispatcher("/views/admin/viewlistcuonsach.jsp");
        dispatcher.forward(request, response);
    }
}
