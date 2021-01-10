package com.bookstore.service;

import com.bookstore.entity.GiaoHangEntity;

import java.util.List;

public interface GiaoHangService {
    List<GiaoHangEntity> findID(Integer id);
}
