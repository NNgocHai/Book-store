package com.bookstore.controller.shipper;

import com.bookstore.dao.DonHangDao;
import com.bookstore.dao_impl.DonHangDao_impl;
import com.bookstore.entity.DonHangEntity;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/shipper/editDH")
public class ShipperEditDH extends HttpServlet {
    public ShipperEditDH() {
        super();
    }

    DonHangDao donHangDao = new DonHangDao_impl();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        int dh_id= Integer.parseInt(request.getParameter("DH-id"));
        DonHangEntity donHangEntity = donHangDao.findById(dh_id);
        try {
            donHangEntity.setMa_DH(dh_id);
            donHangEntity.setActiveDH("Yes");
            donHangDao.update(donHangEntity);
            response.sendRedirect(request.getContextPath() + "/shipper/home");
        }
        catch (Exception e)
        {
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setContentType("text/html;charset=UTF-8");
        DonHangEntity donHangEntity = new DonHangEntity();
        donHangEntity.setActiveDH("Yes");
        donHangDao.update(donHangEntity);
        response.sendRedirect(request.getContextPath() + "/shipper/home");
    }
}
