package com.bookstore.controller.shipper;

import com.bookstore.dao.GiaoHangDao;
import com.bookstore.dao.ShipperDao;
import com.bookstore.dao_impl.GiaoHangDao_impl;
import com.bookstore.dao_impl.ShipperDao_impl;
import com.bookstore.entity.AdminsEntity;
import com.bookstore.entity.GiaoHangEntity;
import com.bookstore.entity.ShipperEntity;
import com.bookstore.service.AdminService;
import com.bookstore.service_impl.AdminService_impl;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

@WebServlet("/shipper/home")
public class ShipperViewListDH extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

//        AdminService admin = new AdminService_impl();
//        List<AdminsEntity> adminList = admin.findAll();
        HttpSession session = request.getSession();
        String user = (String) session.getAttribute("user");
        ShipperDao shipperDao = new ShipperDao_impl();
        ShipperEntity shipperEntity = new ShipperEntity();
        try {
            List<ShipperEntity> listShipper = shipperDao.findByUser(user);
            shipperEntity = listShipper.get(0);
            int id = shipperEntity.getMa_Shipper();
            GiaoHangDao giaoHangDao = new GiaoHangDao_impl();
            GiaoHangEntity giaoHangEntity = new GiaoHangEntity();
            List<GiaoHangEntity> list = giaoHangDao.findID(id);
            if(!(list.size() == 0)){
                request.setAttribute("list", list);
                RequestDispatcher dispatcher = request.getRequestDispatcher("/views/shipper/viewlistdonhang.jsp");
                dispatcher.forward(request, response);
            } else {
//            RequestDispatcher dispatcher = request.getRequestDispatcher("/views/shipper/finished.jsp");
//            dispatcher.forward(request, response);
                response.sendRedirect(request.getContextPath() + "/shipper/finish");
            }
        }
        catch(Exception e)
        {
            response.sendRedirect(request.getContextPath() + "/shipper/login");
        }
    }
}
