package com.bookstore.controller.web;

import com.bookstore.entity.CategoryEntity;
import com.bookstore.entity.CuonSachEntity;
import com.bookstore.service_impl.CategoryService_impl;
import com.bookstore.service_impl.ProductService_impl;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

public class WebHome extends HttpServlet {
    public WebHome(){
        super();
    }
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {


        String Cate= request.getParameter("Cate");
        if (Cate == null)
            Cate= "";

        CategoryService_impl categoryService =new CategoryService_impl();
        ProductService_impl productService =new ProductService_impl();
        List<CategoryEntity> categoryList = categoryService.findAll();
        List<CuonSachEntity> productList = productService.FindByCate(Integer.parseInt(Cate));
        int size =categoryService.findAll().size();

        ProductService_impl productService_impl = new ProductService_impl();
        List<CuonSachEntity> productList_km = new ArrayList<CuonSachEntity>();


        for(CuonSachEntity product: productList)
        {
            CuonSachEntity product_km = new CuonSachEntity();
            product_km = productService_impl.findById(product.getMa_CuonSach());
            double db =(Double.parseDouble(String.valueOf(product.getGiaban())) * (1 - (Double.parseDouble(String.valueOf(product.getDiscount()))/100)));
            product_km.setGiaban((int)db);
            productList_km.add(product_km);

        }

        request.setAttribute("productList", productList);
        request.setAttribute("categoryList", categoryList);
        request.setAttribute("productList_km", productList_km);


        RequestDispatcher rd = request.getRequestDispatcher("/views/web/productlist.jsp");
        rd.forward(request, response);
    }
}
