package com.bookstore.dao;

import com.bookstore.entity.CustomerEntity;

public interface CustomerDao extends GenericDao<Integer, CustomerEntity> {
    boolean checkCustomerLogin(String username, String password);
    boolean checkAddCustomer(String username,String gmail,String sdt);
    boolean checkUserName(String username);
    boolean checkGmail(String gmail);
    boolean checkSdt(String sdt);
}
