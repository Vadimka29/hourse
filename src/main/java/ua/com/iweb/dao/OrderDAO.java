package ua.com.iweb.dao;

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
        return null;
    }
}
