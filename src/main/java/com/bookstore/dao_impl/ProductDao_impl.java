package com.bookstore.dao_impl;

import com.bookstore.dao.CustomerDao;
import com.bookstore.dao.ProductDao;
import com.bookstore.entity.CuonSachEntity;
import com.bookstore.entity.CustomerEntity;
import java.util.ArrayList;
import java.util.List;

import com.bookstore.utils.HibernateUtil;
import org.hibernate.ScrollMode;
import org.hibernate.ScrollableResults;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.query.Query;



public class ProductDao_impl extends GenericDao_impl<Integer, CuonSachEntity> implements ProductDao {

    public List<CuonSachEntity> FindByCate(int Cate) {
        List<CuonSachEntity> results =new ArrayList<CuonSachEntity>();
        Transaction transaction = null;
        CuonSachEntity cuonSachEntity = null;
        Session session = HibernateUtil.getSessionFactory().openSession();
        try  {
            // start a transaction
            transaction = session.beginTransaction();

            // get an cuonSachEntity object
            StringBuilder sql = new StringBuilder("FROM CuonSachEntity P WHERE P.ma_DauSach = :Cate");
            Query query = session.createQuery(sql.toString());
            query.setParameter("Cate", Cate);
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
    public List<CuonSachEntity> FindHot(int Cate) {
        List<CuonSachEntity> results =new ArrayList<CuonSachEntity>();
        Transaction transaction = null;
        CuonSachEntity cuonSachEntity = null;
        Session session = HibernateUtil.getSessionFactory().openSession();
        try  {
            // start a transaction
            transaction = session.beginTransaction();

            // get an cuonSachEntity object
            StringBuilder sql = new StringBuilder("FROM CuonSachEntity P WHERE P.ma_DauSach = :Cate");
            Query query = session.createQuery(sql.toString());
            query.setParameter("Cate", Cate);
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
