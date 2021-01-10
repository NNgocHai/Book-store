package com.bookstore.controller.shipper;

import com.bookstore.dao.GiaoHangDao;
import com.bookstore.dao.ShipperDao;
import com.bookstore.dao_impl.GiaoHangDao_impl;
import com.bookstore.dao_impl.ShipperDao_impl;
import com.bookstore.entity.GiaoHangEntity;
import com.bookstore.entity.ShipperEntity;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

@WebServlet("/shipper/finish")
public class ShipperFinish extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        String user = (String) session.getAttribute("user");
        if (session.getAttribute("user") == null){
            response.sendRedirect(request.getContextPath() + "/shipper/login");
        }
        else {
            ShipperDao shipperDao = new ShipperDao_impl();
            ShipperEntity shipperEntity = new ShipperEntity();
            List<ShipperEntity> listShipper = shipperDao.findByUser(user);
            shipperEntity = listShipper.get(0);
            int id = shipperEntity.getMa_Shipper();
            GiaoHangDao giaoHangDao = new GiaoHangDao_impl();
            GiaoHangEntity giaoHangEntity = new GiaoHangEntity();
            List<GiaoHangEntity> list = giaoHangDao.findID(id);
            if (user != null && list.size() != 0) {
                response.sendRedirect(request.getContextPath() + "/shipper/home");
            } else {
                RequestDispatcher rd = request.getRequestDispatcher("/views/shipper/finished.jsp");
                rd.forward(request, response);
            }
        }

    }
}
