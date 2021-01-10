package com.bookstore.dao_impl;

import com.bookstore.dao.GiaoHangDao;
import com.bookstore.entity.GiaoHangEntity;
import com.bookstore.utils.HibernateUtil;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.query.Query;

import java.util.ArrayList;
import java.util.List;

public class GiaoHangDao_impl extends GenericDao_impl<Integer, GiaoHangEntity> implements GiaoHangDao {
    @Override
    public List<GiaoHangEntity> findID(Integer id) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction transaction = session.beginTransaction();
        //List<Object[]> listResult = new ArrayList<Object[]>();
        List<GiaoHangEntity> userEntities = new ArrayList<GiaoHangEntity>();
        String a = "No";
        try {
            StringBuilder sql = new StringBuilder("Select donHangEntity.ma_DH, donHangEntity.ma_Customer, ");
            sql.append("donHangEntity.diachi, donHangEntity.sdt, donHangEntity.tongtien, donHangEntity.activeDH");
            sql.append(" From GiaoHangEntity ");
            //sql.append(" where g.ma_DH = d.ma_DH ");
            sql.append(" where shipperEntity.ma_Shipper = :value");
            sql.append(" and donHangEntity.activeDH = :value1");
            Query query = session.createQuery(sql.toString());
            query.setParameter("value", id);
            query.setParameter("value1", a);
            userEntities = query.list();
        } catch (HibernateException e) {
            transaction.rollback();
            throw e;
        } finally {
            session.close();
        }

        return userEntities;
    }

//    public List<GiaoHangEntity> findID(Integer id) {
//        Session session = HibernateUtil.getSessionFactory().openSession();
//        Transaction transaction = session.beginTransaction();
//        //List<Object[]> listResult = new ArrayList<Object[]>();
//        List<GiaoHangEntity> userEntities = new ArrayList<GiaoHangEntity>();
//        try {
//            StringBuilder sql = new StringBuilder("Select shipperEntity.ma_Shipper");
//            //sql.append("donHangEntity.diachi, donHangEntity.sdt, donHangEntity.tongtien, tinhtrang");
//            sql.append(" From GiaoHangEntity ");
//            //sql.append(" where g.ma_DH = d.ma_DH ");
//            sql.append(" where shipperEntity.ma_Shipper = :value");
//            Query query = session.createQuery(sql.toString());
//            query.setParameter("value", id);
//            userEntities = query.list();
//        } catch (HibernateException e) {
//            transaction.rollback();
//            throw e;
//        } finally {
//            session.close();
//        }
//
//        return userEntities;
//    }

    @Override
    public Object[] findd(Integer id) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction transaction = session.beginTransaction();
        //List<Object[]> listResult = new ArrayList<Object[]>();
        List<GiaoHangEntity> userEntities = new ArrayList<GiaoHangEntity>();
        try {
            StringBuilder sql = new StringBuilder("Select donHangEntity ");
            //StringBuilder sql = new StringBuilder("Select donHangEntity.ma_DH, donHangEntity.ma_Customer, ");
            //sql.append("donHangEntity.diachi, donHangEntity.sdt, donHangEntity.tongtien, tinhtrang");
            sql.append(" From GiaoHangEntity ");
            //sql.append(" where g.ma_DH = d.ma_DH ");
            sql.append(" where shipperEntity.ma_Shipper = :value");
            Query query = session.createQuery(sql.toString());
            query.setParameter("value", id);
            userEntities = query.list();
        } catch (HibernateException e) {
            transaction.rollback();
            throw e;
        } finally {
            session.close();
        }

        return new Object[]{userEntities};
    }
}
