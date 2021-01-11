package com.bookstore.controller.web;

import com.bookstore.entity.CuonSachEntity;
import com.bookstore.entity.GioHangEntity;
import com.bookstore.service.GioHangService;
import com.bookstore.service.ProductService;
import com.bookstore.service_impl.GioHangService_impl;
import com.bookstore.service_impl.ProductService_impl;

import java.text.DecimalFormat;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;


@WebServlet("/web/product/AddtoCart")
public class AddtoCart extends HttpServlet {
    public AddtoCart() {
        super();
    }

    ProductService productService = new ProductService_impl();

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int n = 0;
        int soluong = 1;
        int tongtien = 0;


        GioHangService gioHangService = new GioHangService_impl();
        ProductService productService = new ProductService_impl();
        if (request.getParameter("product-id") != null) {
            String id = request.getParameter("product-id");
            CuonSachEntity product = productService.findById(Integer.parseInt(id));

            if (product != null) {
                if (request.getParameter("soluong") != null) {
                    soluong = Integer.parseInt(request.getParameter("soluong"));
                }

                HttpSession session = request.getSession();
                if (session.getAttribute("Orders") == null) {
                    List<GioHangEntity> Orders = new ArrayList<GioHangEntity>();
                    GioHangEntity Order = new GioHangEntity();
                    Order = gioHangService.GetOrder(productService.findById(Integer.parseInt(id)));
                    double db = (Double.parseDouble(String.valueOf(product.getGiabia())) * (1 - (Double.parseDouble(String.valueOf(product.getDiscount())) / 100)));
                    Order.getCuonSachEntity().setGiabia((int) db);
                    Order.setSoluong(soluong);
                    tongtien = Order.getCuonSachEntity().getGiabia();
                    Orders.add(Order);
                    n = Orders.size();
                    session.setAttribute("length_orders", n);
                    session.setAttribute("Orders", Orders);
                    session.setAttribute("tongtien", tongtien);
                } else {
                    List<GioHangEntity> Orders = (List<GioHangEntity>) session.getAttribute("Orders");
                    boolean check = false;
                    for (GioHangEntity Order : Orders) {
                        if (Order.getCuonSachEntity().getMa_CuonSach() == Integer.parseInt(id)) {
                            Order.setSoluong(Order.getSoluong() + soluong);
                            double db = (Double.parseDouble(String.valueOf(product.getGiabia())) * (1 - (Double.parseDouble(String.valueOf(product.getDiscount())) / 100)));
                            Order.getCuonSachEntity().setGiabia((int) db);
                            check = true;
                        }
                        tongtien = Order.getCuonSachEntity().getGiabia() * Order.getSoluong()+tongtien;

                    }
                    if (check == false) {
                        GioHangEntity Order = new GioHangEntity();
                        Order = gioHangService.GetOrder(productService.findById(Integer.parseInt(id)));
                        double db = (Double.parseDouble(String.valueOf(product.getGiabia())) * (1 - (Double.parseDouble(String.valueOf(product.getDiscount())) / 100)));
                        Order.getCuonSachEntity().setGiabia((int) db);
                        Order.setSoluong(soluong);
                        tongtien = Order.getCuonSachEntity().getGiabia() + tongtien;
                        Orders.add(Order);
                    }
                    n = Orders.size();
                    session.setAttribute("length_orders", n);
                    session.setAttribute("Orders", Orders);
                    session.setAttribute("tongtien", tongtien);
                }
            }
            response.sendRedirect(request.getContextPath() + "/web/product");
        } else {
            response.sendRedirect(request.getContextPath() + "/");
        }

    }

}
