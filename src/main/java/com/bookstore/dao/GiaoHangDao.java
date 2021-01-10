package com.bookstore.dao;

import com.bookstore.entity.GiaoHangEntity;

import java.util.List;

public interface GiaoHangDao extends GenericDao<Integer, GiaoHangEntity> {

    List<GiaoHangEntity> findID(Integer id);
    Object[] findd(Integer id);
}
