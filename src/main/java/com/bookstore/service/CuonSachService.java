package com.bookstore.service;

import com.bookstore.entity.CuonSachEntity;

import java.util.List;

public interface CuonSachService  {
    List<CuonSachEntity> findAll();
    Integer deleteList(List<Integer> ids);
    CuonSachEntity save(CuonSachEntity T);
    CuonSachEntity update(CuonSachEntity T);
    CuonSachEntity findById(int var1);
}
