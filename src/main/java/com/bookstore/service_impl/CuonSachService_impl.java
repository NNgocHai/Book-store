package com.bookstore.service_impl;

import com.bookstore.dao.CuonSachDao;
import com.bookstore.dao_impl.CuonSachDao_impl;
import com.bookstore.entity.CuonSachEntity;
import com.bookstore.service.CuonSachService;

import java.util.List;

public class CuonSachService_impl implements CuonSachService {
    public CuonSachDao cuonSachDao=new CuonSachDao_impl();
    public List<CuonSachEntity> findAll(){
        return cuonSachDao.findAll();
    }
    public Integer deleteList(List<Integer> ids){
        return cuonSachDao.deleteList(ids);
    }
    public CuonSachEntity save(CuonSachEntity T)
    {
        return cuonSachDao.update(T);
    }
    public CuonSachEntity update(CuonSachEntity T)
    {
        return cuonSachDao.update(T);
    }
    public CuonSachEntity findById(int var1)
    {
        return cuonSachDao.findById(var1);
    }
}
