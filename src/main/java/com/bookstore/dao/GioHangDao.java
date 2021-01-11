package com.bookstore.dao;

import com.bookstore.entity.CuonSachEntity;
import com.bookstore.entity.GioHangEntity;

public interface GioHangDao extends GenericDao<Integer, GioHangEntity>{
    GioHangEntity GetOrder(CuonSachEntity C);
}
