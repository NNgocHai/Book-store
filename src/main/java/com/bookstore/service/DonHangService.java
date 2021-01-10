package com.bookstore.service;

import com.bookstore.entity.CustomerEntity;
import com.bookstore.entity.DonHangEntity;

import java.util.List;

public interface DonHangService {
    List<DonHangEntity> findAll();
    Integer deleteList(List<Integer> ids);
    DonHangEntity findById(int var1);
    DonHangEntity update(DonHangEntity donHangEntity);
}
