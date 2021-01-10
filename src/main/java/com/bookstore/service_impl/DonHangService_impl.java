package com.bookstore.service_impl;

import com.bookstore.dao.DonHangDao;
import com.bookstore.dao_impl.DonHangDao_impl;
import com.bookstore.entity.DonHangEntity;
import com.bookstore.service.DonHangService;

public class DonHangService_impl implements DonHangService {
    DonHangDao donHangDao = new DonHangDao_impl();
    @Override
    public DonHangEntity findById(int var1) {
        return donHangDao.findById(var1);
    }

    @Override
    public DonHangEntity update(DonHangEntity donHangEntity) {
        return donHangDao.update(donHangEntity);
    }
}
