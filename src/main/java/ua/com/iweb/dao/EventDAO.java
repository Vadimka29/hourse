package ua.com.iweb.dao;

import org.hibernate.Query;
import org.hibernate.Session;
import ua.com.iweb.enteties.EventsEntity;
import ua.com.iweb.service.HibernateService;

import java.sql.SQLException;
import java.util.List;

/**
 * Created by vanya on 04.04.15.
 */
public class EventDAO implements EventDAOInterface {

    @Override
    public List<EventsEntity> getAllEvents() throws SQLException {
        Session session = null;
        try {
            session = HibernateService.getSession();
            String hql = "FROM EventsEntity";
            Query q = session.createQuery(hql);
            return q.list();
        } finally {
            if(session != null && session.isOpen()){
                session.close();
            }
        }
    }

    @Override
    public void saveEvent(EventsEntity event) throws SQLException {
        Session session = null;
        try {
            session = HibernateService.getSession();
            session.getTransaction().begin();
            session.save(event);
            session.getTransaction().commit();
        } finally {
            if(session != null && session.isOpen()){
                session.close();
            }
        }
    }

    @Override
    public void deleteEvent(Integer id) throws SQLException {
        Session session = null;
        try {
            session = HibernateService.getSession();
            session.getTransaction().begin();
            String hql = "DELETE EventsEntity where id = :id";
            Query q = session.createQuery(hql);
            q.setParameter("id", id);
            q.executeUpdate();
            session.getTransaction().commit();
        } finally {
            if(session != null && session.isOpen()){
                session.close();
            }
        }
    }

    @Override
    public void updateEvent(EventsEntity event) throws SQLException {
        Session session = null;
        try {
            session = HibernateService.getSession();
            session.getTransaction().begin();
            session.update(event);
            session.getTransaction().commit();
        } finally {
            if(session != null && session.isOpen()){
                session.close();
            }
        }
    }
}
