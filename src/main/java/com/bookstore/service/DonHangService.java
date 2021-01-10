package com.bookstore.service;

import com.bookstore.entity.DonHangEntity;

public interface DonHangService {
    DonHangEntity findById(int var1);
    DonHangEntity update(DonHangEntity donHangEntity);
}
