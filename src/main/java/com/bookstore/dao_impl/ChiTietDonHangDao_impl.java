package com.bookstore.dao_impl;

import com.bookstore.dao.ChiTietDonHangDao;
import com.bookstore.entity.ChiTietDonHangEntity;
import com.bookstore.utils.HibernateUtil;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.query.Query;

import java.util.ArrayList;
import java.util.List;

public class ChiTietDonHangDao_impl extends GenericDao_impl<Integer, ChiTietDonHangEntity> implements ChiTietDonHangDao {
    @Override
    public List<ChiTietDonHangEntity> FindHot() {
        List<ChiTietDonHangEntity> results =new ArrayList<ChiTietDonHangEntity>();
        Transaction transaction = null;
        Session session = HibernateUtil.getSessionFactory().openSession();
        try  {
            // start a transaction
            transaction = session.beginTransaction();

            // get an cuonSachEntity object
            StringBuilder sql = new StringBuilder("  FROM ChiTietDonHangEntity E  ORDER BY E.soluong desc");
            Query query = session.createQuery(sql.toString());
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
}
