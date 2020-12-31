package com.bookstore.dao;

import com.bookstore.entity.AdminsEntity;
import com.bookstore.model.Admin;
public interface AdminDao extends GenericDao<String, AdminsEntity>{
    boolean checkAdminLogin (String username, String password);
}
