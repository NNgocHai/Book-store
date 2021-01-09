package com.bookstore.service_impl;

import com.bookstore.dao.CategoryDao;
import com.bookstore.dao.ChiTietDonHangDao;
import com.bookstore.dao_impl.CategoryDao_impl;
import com.bookstore.dao_impl.ChiTietDonHangDao_impl;
import com.bookstore.entity.ChiTietDonHangEntity;
import com.bookstore.service.ChiTietDonHangService;

import java.util.List;

public class ChiTietDonHangService_impl implements ChiTietDonHangService {
    public ChiTietDonHangDao chiTietDonHangDao_impl=new ChiTietDonHangDao_impl();

    @Override
    public List<ChiTietDonHangEntity> FindHot() {
        return chiTietDonHangDao_impl.FindHot();
    }

    @Override
    public ChiTietDonHangEntity findById(int var1) {
        return chiTietDonHangDao_impl.findById(var1);
    }
}
