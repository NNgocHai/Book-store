package com.bookstore.controller.web;

import java.sql.Timestamp;
import java.time.format.DateTimeFormatter;
import java.time.LocalDateTime;

import com.bookstore.entity.*;
import com.bookstore.service.ChiTietDonHangService;
import com.bookstore.service.DonHangService;
import com.bookstore.service.GioHangService;
import com.bookstore.service_impl.ChiTietDonHangService_impl;
import com.bookstore.service_impl.DonHangService_impl;
import com.bookstore.service_impl.GioHangService_impl;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

@WebServlet("/web/payment")

public class Payment extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String address = (request.getParameter("address"));
        String phone = (request.getParameter("phone"));



        GioHangService gioHangService = new GioHangService_impl();
        DonHangService donHangService =new DonHangService_impl();
        ChiTietDonHangService chiTietDonHangService= new ChiTietDonHangService_impl();
        DonHangEntity donHangEntity= new DonHangEntity();

        HttpSession session = request.getSession();
        CustomerEntity person= (CustomerEntity) session.getAttribute("person");
        int tongtien= (int) session.getAttribute("tongtien");
        List<GioHangEntity> Orders = (List<GioHangEntity>) session.getAttribute("Orders");

        LocalDateTime now = LocalDateTime.now();

        gioHangService.DeletebyCustomer(person.getMa_Customer());
        donHangEntity.setMa_Customer(person.getMa_Customer());
        donHangEntity.setDiachi(address);
        donHangEntity.setSdt(phone);
        donHangEntity.setNgaydat(Timestamp.valueOf((now)));
        donHangEntity.setTongtien(tongtien);
        donHangEntity.setActiveDH("Chưa giao");
        donHangService.save(donHangEntity);
        for (GioHangEntity Order : Orders) {
            ChiTietDonHangEntity chiTietDonHangEntity= new ChiTietDonHangEntity();
            ChiTietDonHangIDKey chiTietDonHangIDKey= new ChiTietDonHangIDKey();
            chiTietDonHangIDKey.setMa_CuonSach(Order.getCuonSachEntity().getMa_CuonSach());
            chiTietDonHangIDKey.setMa_DH(donHangService.findAll().size());
            chiTietDonHangEntity.setId(chiTietDonHangIDKey);
            chiTietDonHangEntity.setSoluong(Order.getSoluong());
            chiTietDonHangEntity.setGia(Order.getCuonSachEntity().getGiabia());
            chiTietDonHangService.save(chiTietDonHangEntity);
        }
        session.removeAttribute("length_orders");
        session.removeAttribute("tongtien");
        session.removeAttribute("Orders");
        RequestDispatcher dispatcher = request.getRequestDispatcher("/views/web/checkout.jsp");
        dispatcher.forward(request, response);
    }
}
