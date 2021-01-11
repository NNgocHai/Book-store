package com.bookstore.dao_impl;

import com.bookstore.dao.GioHangDao;
import com.bookstore.dao.ReviewDao;
import com.bookstore.entity.CuonSachEntity;
import com.bookstore.entity.GioHangEntity;
import com.bookstore.entity.ReviewEntity;

public class GioHangDao_impl extends GenericDao_impl<Integer, GioHangEntity> implements GioHangDao {
    @Override
    public GioHangEntity GetOrder(CuonSachEntity C) {
        GioHangEntity gioHangEntity = new GioHangEntity();
        gioHangEntity.setCuonSachEntity(C);
        return gioHangEntity;
    }
}
