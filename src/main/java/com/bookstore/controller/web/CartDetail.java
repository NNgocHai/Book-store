package com.bookstore.controller.web;

import com.bookstore.entity.CuonSachEntity;
import com.bookstore.service.ProductService;
import com.bookstore.service_impl.ProductService_impl;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet("/web/product/CartDetail")
public class CartDetail extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ProductService productService =new ProductService_impl();
        List<CuonSachEntity> cuonSachEntityList= new ArrayList<CuonSachEntity>();
        cuonSachEntityList=productService.findAll();
        request.setAttribute("cuonSachEntityList", cuonSachEntityList);

        RequestDispatcher dispatcher = request.getRequestDispatcher("/views/web/CartDetail.jsp");
        dispatcher.forward(request, response);
    }
}
