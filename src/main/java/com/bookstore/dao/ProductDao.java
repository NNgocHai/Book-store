package com.bookstore.dao;

import java.util.ArrayList;
import java.util.List;

import com.bookstore.entity.ChiTietDonHangEntity;
import org.hibernate.ScrollMode;
import org.hibernate.ScrollableResults;
import org.hibernate.query.Query;
import com.bookstore.entity.CuonSachEntity;

public interface ProductDao extends GenericDao<Integer, CuonSachEntity>{
    List<CuonSachEntity> FindHotDiscount();
    List<CuonSachEntity> FindByCate(int Cate);
    List<ChiTietDonHangEntity> FindHot();
}
