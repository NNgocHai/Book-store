package com.bookstore.service_impl;

import com.bookstore.dao.CategoryDao;
import com.bookstore.dao.GioHangDao;
import com.bookstore.dao_impl.CategoryDao_impl;
import com.bookstore.dao_impl.GioHangDao_impl;
import com.bookstore.entity.CuonSachEntity;
import com.bookstore.entity.GioHangEntity;
import com.bookstore.service.GioHangService;

import java.util.List;

public class GioHangService_impl implements GioHangService {
    public GioHangDao gioHangDao=new GioHangDao_impl();
    @Override
    public List<GioHangEntity> findAll() {
        return gioHangDao.findAll();
    }

    @Override
    public Integer deleteList(List<Integer> ids) {
        return gioHangDao.deleteList(ids);
    }

    @Override
    public GioHangEntity save(GioHangEntity T) {
        return gioHangDao.save(T);

    }

    @Override
    public GioHangEntity update(GioHangEntity T) {
        return gioHangDao.update(T);
    }

    @Override
    public GioHangEntity findById(int var1) {
        return gioHangDao.findById(var1);
    }

    @Override
    public GioHangEntity GetOrder(CuonSachEntity C) {
        return gioHangDao.GetOrder(C);
    }

    @Override
    public List<GioHangEntity> FindByMaCustomer(int id) {
        return gioHangDao.FindByMaCustomer(id);
    }

    @Override
    public Integer DeletebyCustomer_CuonSach(int ma_Customer, int ma_CuonSach) {
        return gioHangDao.DeletebyCustomer_CuonSach(ma_Customer,ma_CuonSach);
    }

    @Override
    public Integer DeletebyCustomer(int ma_Customer) {
        return gioHangDao.DeletebyCustomer(ma_Customer);
    }
}
