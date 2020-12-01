package com.bookstore.dao;

import com.bookstore.model.Admin;
public interface AdminDao {
    Admin get(int id);


    Admin get(String name);


}
