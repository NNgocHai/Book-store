package com.bookstore.controller.web;

import com.bookstore.entity.CategoryEntity;
import com.bookstore.entity.ChiTietDonHangEntity;
import com.bookstore.entity.CuonSachEntity;
import com.bookstore.entity.ReviewEntity;
import com.bookstore.service.ReviewService;
import com.bookstore.service_impl.CategoryService_impl;
import com.bookstore.service_impl.ChiTietDonHangService_impl;
import com.bookstore.service_impl.ProductService_impl;
import com.bookstore.service_impl.ReviewService_impl;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;


@WebServlet("/web/home")

public class WebHome extends HttpServlet {
    public WebHome(){
        super();
    }
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {


        ProductService_impl productService_impl=new ProductService_impl();
        ChiTietDonHangService_impl chiTietDonHangService_impl=new ChiTietDonHangService_impl();
        ReviewService reviewService= new ReviewService_impl();
        List<ChiTietDonHangEntity> product_hotList = chiTietDonHangService_impl.FindHot();
        List<CuonSachEntity> productList_km = new ArrayList<CuonSachEntity>();
        List<ReviewEntity> reviewEntities = new ArrayList<ReviewEntity>();
       // List<CuonSachEntity> product_hotdiscount = new ArrayList<CuonSachEntity>();
        reviewEntities= reviewService.findAll();
        for(ChiTietDonHangEntity product_hot: product_hotList) {
            product_hot.getCuonSachEntity().getMa_CuonSach();
            CuonSachEntity product_hotkm = new CuonSachEntity();
            product_hotkm = productService_impl.findById(product_hot.getCuonSachEntity().getMa_CuonSach());
            double db = (Double.parseDouble(String.valueOf(product_hot.getCuonSachEntity().getGiabia())) * (1 - (Double.parseDouble(String.valueOf(product_hot.getCuonSachEntity().getDiscount())) / 100)));
            product_hotkm.setGiabia((int) db);
            productList_km.add(product_hotkm);
        }

        List<CuonSachEntity> cuon= productService_impl.FindHotDiscount();
        cuon.get(0).getDiscount();

        request.setAttribute("reviewEntities", reviewEntities);
        request.setAttribute("productList_km", productList_km);
        request.setAttribute("productListHotDiscount", productService_impl.FindHotDiscount());
        request.setAttribute("product_hotList", product_hotList);
        RequestDispatcher rd = request.getRequestDispatcher("/views/web/index.jsp");
        rd.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
