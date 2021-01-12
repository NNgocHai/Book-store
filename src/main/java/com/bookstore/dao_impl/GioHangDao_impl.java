package com.bookstore.dao_impl;

import com.bookstore.dao.GioHangDao;
import com.bookstore.dao.ReviewDao;
import com.bookstore.entity.CuonSachEntity;
import com.bookstore.entity.GioHangEntity;
import com.bookstore.entity.ReviewEntity;
import com.bookstore.utils.HibernateUtil;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.query.Query;

import java.util.ArrayList;
import java.util.List;

public class GioHangDao_impl extends GenericDao_impl<Integer, GioHangEntity> implements GioHangDao {
    @Override
    public GioHangEntity GetOrder(CuonSachEntity C) {
        GioHangEntity gioHangEntity = new GioHangEntity();
        gioHangEntity.setCuonSachEntity(C);
        return gioHangEntity;
    }

    @Override
    public List<GioHangEntity> FindByMaCustomer(int id) {
        List<GioHangEntity> results =new ArrayList<GioHangEntity>();
        Transaction transaction = null;
        Session session = HibernateUtil.getSessionFactory().openSession();
        try  {
            // start a transaction
            transaction = session.beginTransaction();

            // get an cuonSachEntity object
            StringBuilder sql = new StringBuilder("FROM GioHangEntity P WHERE P.customerEntity.ma_Customer = :id");
            Query query = session.createQuery(sql.toString());
            query.setParameter("id", id);
            results = query.getResultList();


            // commit transaction
            transaction.commit();
        } catch (Exception e) {
            if (transaction != null) {
                transaction.rollback();
            }
            e.printStackTrace();
        }
        finally {
            session.close();
        }
        return results;
    }

    @Override
    public Integer DeletebyCustomer_CuonSach(int ma_Customer, int ma_CuonSach) {
        int result =0;
        Transaction transaction = null;
        Session session = HibernateUtil.getSessionFactory().openSession();
        try  {
            // start a transaction
            transaction = session.beginTransaction();

            // get an cuonSachEntity object delete from Vote where uid= :uid AND pid= :pid
            StringBuilder sql = new StringBuilder("delete from GioHangEntity P WHERE P.customerEntity.ma_Customer = :ma_Customer AND P.cuonSachEntity.ma_CuonSach = :ma_CuonSach");
            Query query = session.createQuery(sql.toString());
            query.setParameter("ma_Customer", ma_Customer);
            query.setParameter("ma_CuonSach", ma_CuonSach);
            // commit transaction
            query.executeUpdate();
            transaction.commit();
        } catch (Exception e) {
            if (transaction != null) {
                transaction.rollback();
            }
            e.printStackTrace();
        }
        finally {
            session.close();
        }
        return result;
    }
}