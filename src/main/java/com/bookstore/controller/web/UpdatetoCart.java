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

@WebServlet("/web/product/UpdatetoCart")

public class UpdatetoCart extends HttpServlet {
    public UpdatetoCart() {
        super();
    }

    int tongtien = 0;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        RequestDispatcher dispatcher = request.getRequestDispatcher(request.getContextPath() + "/views/web/CartDetail.jsp");
        dispatcher.forward(request, response);

    }

    @Override
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        List<GioHangEntity> Orders = (List<GioHangEntity>) session.getAttribute("Orders");
        for (GioHangEntity Order : Orders) {
            Order.setSoluong(Integer.valueOf(request.getParameter(String.valueOf(Order.getCuonSachEntity().getMa_CuonSach()))));
            tongtien = Order.getCuonSachEntity().getGiabia() * Order.getSoluong() + tongtien;
        }

        int n =Orders.size();
        session.setAttribute("length_orders", n);
        session.setAttribute("Orders", Orders);
        session.setAttribute("tongtien", tongtien);
        response.sendRedirect(request.getContextPath() + "/web/product/CartDetail");
    }


}
