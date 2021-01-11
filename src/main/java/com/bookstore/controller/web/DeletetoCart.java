package com.bookstore.controller.web;

import com.bookstore.entity.GioHangEntity;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

@WebServlet("/web/product/DeletetoCart")
public class DeletetoCart extends HttpServlet {
    public DeletetoCart() {
        super();
    }


    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int index = Integer.parseInt(request.getParameter("index"));
        int tongtien =0;
        HttpSession session = request.getSession();
        List<GioHangEntity> Orders = (List<GioHangEntity>) session.getAttribute("Orders");
        Orders.remove(index);
        for (GioHangEntity Order : Orders) {
            tongtien = Order.getCuonSachEntity().getGiabia() * Order.getSoluong() + tongtien;
        }

        int n =Orders.size();
        session.setAttribute("length_orders", n);
        session.setAttribute("Orders", Orders);
        session.setAttribute("tongtien", tongtien);
        response.sendRedirect(request.getContextPath() + "/web/product/CartDetail");

    }

}
