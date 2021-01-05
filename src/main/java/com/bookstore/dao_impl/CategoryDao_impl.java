package com.bookstore.dao_impl;

import com.bookstore.dao.CategoryDao;
import com.bookstore.entity.CategoryEntity;
import com.bookstore.utils.HibernateUtil;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.query.Query;

public class CategoryDao_impl extends GenericDao_impl<Integer, CategoryEntity> implements CategoryDao {

}
