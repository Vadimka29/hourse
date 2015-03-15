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
            String hql = "FROM HourseOrderEntity";
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
}
