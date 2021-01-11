package com.bookstore.dao;

import com.bookstore.entity.CustomerEntity;

public interface CustomerDao extends GenericDao<Integer, CustomerEntity> {
    boolean checkCustomerLogin(String username, String password);
}
