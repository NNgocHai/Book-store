package com.bookstore.controller.admin;

import com.bookstore.dao.DonHangDao;
import com.bookstore.dao.GiaoHangDao;
import com.bookstore.dao.ShipperDao;
import com.bookstore.dao_impl.DonHangDao_impl;
import com.bookstore.dao_impl.GiaoHangDao_impl;
import com.bookstore.dao_impl.ShipperDao_impl;
import com.bookstore.entity.DonHangEntity;
import com.bookstore.entity.GiaoHangEntity;
import com.bookstore.entity.GiaoHangIDKey;
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

@WebServlet("/admin/giaohang/phancong")
public class GiaoHangPhanCongNV extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        if (session.getAttribute("user") == null){
            response.sendRedirect(request.getContextPath() + "/admin/login");
        }
        else {
            ShipperDao shipperDao = new ShipperDao_impl();
            List<ShipperEntity> listSP = shipperDao.findID();
            request.setAttribute("listSP", listSP);
            DonHangDao donHangDao = new DonHangDao_impl();
            List<DonHangEntity> listDHCG = donHangDao.Find_DHCG();
            request.setAttribute("listDHCG", listDHCG);
            if (listDHCG.size() != 0) {
                RequestDispatcher dispatcher = request.getRequestDispatcher("/views/admin/phancongGH.jsp");
                dispatcher.forward(request, response);
            } else {
                response.sendRedirect(request.getContextPath() + "/admin/giaohang/empty");
            }
        }
    }
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setContentType("text/html;charset=UTF-8");
        int maSP =Integer.parseInt(request.getParameter("maSP"));
        int maDHCG = Integer.parseInt(request.getParameter("maDHCG"));
        GiaoHangIDKey giaoHangIDKey = new GiaoHangIDKey();
        giaoHangIDKey.setMa_DH(maDHCG);
        giaoHangIDKey.setMa_Shiper(maSP);
        GiaoHangEntity giaoHangEntity = new GiaoHangEntity();
        giaoHangEntity.setId(giaoHangIDKey);
        GiaoHangDao giaoHangDao = new GiaoHangDao_impl();
        giaoHangDao.save(giaoHangEntity);
        response.sendRedirect(request.getContextPath() + "/admin/giaohang/list");
    }
}
