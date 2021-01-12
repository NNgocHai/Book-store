package com.bookstore.dao;

import com.bookstore.entity.CustomerEntity;

import java.util.List;

public interface CustomerDao extends GenericDao<Integer, CustomerEntity> {
    boolean checkCustomerLogin(String username, String password);
    List<CustomerEntity> findByUser(String user );
}
