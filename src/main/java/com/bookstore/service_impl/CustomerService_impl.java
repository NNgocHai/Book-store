package com.bookstore.service_impl;


import com.bookstore.dao.AdminDao;
import com.bookstore.dao.CustomerDao;
import com.bookstore.dao_impl.AdminDao_impl;
import com.bookstore.dao_impl.CustomerDao_impl;
import com.bookstore.entity.AdminsEntity;
import com.bookstore.entity.CustomerEntity;
import com.bookstore.service.AdminService;
import com.bookstore.service.CustomerService;

import java.util.List;

public class CustomerService_impl implements CustomerService {

    public CustomerDao_impl customerDao = new CustomerDao_impl();
    public List<CustomerEntity> findAll() {
        return customerDao.findAll();
    }

    public Integer deleteList(List<Integer> ids) {
        return customerDao.deleteList(ids);
    }




    public CustomerEntity save(CustomerEntity T) {
        return  customerDao.save(T);
    }

    public CustomerEntity update(CustomerEntity T) {
        return customerDao.update(T);

    }

    public CustomerEntity findById(int var1) {
        return customerDao.findById(var1);
    }

}

