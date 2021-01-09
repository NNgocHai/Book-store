package com.bookstore.service;

import com.bookstore.entity.ChiTietDonHangEntity;

import java.util.List;

public interface ChiTietDonHangService {
    List<ChiTietDonHangEntity> FindHot();
    ChiTietDonHangEntity findById(int var1);
}
