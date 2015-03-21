package ua.com.iweb.dao;

import org.hibernate.Query;
import org.hibernate.Session;
import ua.com.iweb.enteties.HourseOrderEntity;
import ua.com.iweb.service.HibernateService;

import java.sql.SQLException;
import java.util.List;

/**
 * Created by root on 15.03.15.
 */
public class OrderDAO implements OrderDAOInterface{
    @Override
    public boolean addOrder(HourseOrderEntity order) throws SQLException {
        if(order == null)
            return false;
        Session session = null;
        try {
            session = HibernateService.getSession();
            session.beginTransaction();
            session.save(order);
            session.getTransaction().commit();
            return true;
        } finally {
            if(session != null && session.isOpen()){
                session.close();
            }
        }
    }

    @Override
    public List<HourseOrderEntity> getOrders(int countIndex) throws SQLException {
        Session session = null;
        try {
            session = HibernateService.getSession();
            int startFrom = 10*countIndex - 10;
            String hql = "FROM HourseOrderEntity order by orderId desc";
            Query q = session.createQuery(hql);
            q.setFirstResult(startFrom);
            q.setMaxResults(10);
            return q.list();
        } finally {
            if(session != null && session.isOpen()){
                session.close();
            }
        }
    }

    @Override
    public List<HourseOrderEntity> getByType(String type, int countIndex) throws SQLException {
        Session session = null;
        if(type == null)
            return null;
        try {
            int startFrom = 10*countIndex - 10;
            session = HibernateService.getSession();
            Query q = session.createQuery("FROM HourseOrderEntity WHERE orderType = :type order by orderId desc");
            q.setParameter("type", type);
            q.setFirstResult(startFrom);
            q.setMaxResults(10);
            return q.list();
        } finally {
            if(session != null && session.isOpen()){
                session.close();
            }
        }
    }

    @Override
    public int getOrderCount() throws SQLException {
        Session session = null;
        try {
            session = HibernateService.getSession();
            Query q = session.createQuery("select count(*) from HourseOrderEntity ");
            return ((Long) q.uniqueResult()).intValue();
        } finally {
            if(session != null && session.isOpen()){
                session.close();
            }
        }
    }

    @Override
    public int getOrderCountByType(String type) throws SQLException {
        Session session = null;
        try {
            session = HibernateService.getSession();
            Query q = session.createQuery("select count(*) from HourseOrderEntity where " +
                    "orderType = :type");
            q.setParameter("type", type);
            return ((Long) q.uniqueResult()).intValue();
        } finally {
            if(session != null && session.isOpen()){
                session.close();
            }
        }
    }

    @Override
    public HourseOrderEntity getOrderById(int id) throws SQLException {
        Session session = null;
        HourseOrderEntity entity = null;
        try {
            session = HibernateService.getSession();
            entity = (HourseOrderEntity) session.get(HourseOrderEntity.class, id);
            return entity;
        } finally {
            if (session != null && session.isOpen()) {
                session.close();
            }
        }
    }
}
