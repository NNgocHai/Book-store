package com.bookstore.dao;

import java.util.List;

public interface GenericDao<ID extends  String, T> {
    List<T> findAll();
    T update(T entity);
    void save(T entity);
    T findById(ID var1);
    Object[] findByProperty(String property, Object value, String sortExpression, String sortDirection);
    Integer deleteList(List<ID> ids);
}
