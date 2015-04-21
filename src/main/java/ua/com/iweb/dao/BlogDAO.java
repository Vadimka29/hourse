package ua.com.iweb.dao;

import org.hibernate.Query;
import org.hibernate.Session;
import ua.com.iweb.enteties.BlogEntity;
import ua.com.iweb.enteties.HourseOrderEntity;
import ua.com.iweb.service.HibernateService;

import java.sql.SQLException;
import java.util.List;

/**
 * Created by vanya on 18.03.15.
 */
public class BlogDAO implements BlogDAOInterface {

    @Override
    public void addPost(BlogEntity entity) throws SQLException {
        if(entity == null)
            return;
        Session session = null;
        try {
            session = HibernateService.getSession();
            session.getTransaction().begin();
            session.save(entity);
            session.getTransaction().commit();
        } finally {
            if(session != null && session.isOpen()){
                session.close();
            }
        }
    }

    @Override
    public int getCount() throws SQLException {
        Session session = null;
        try {
            session = HibernateService.getSession();
            Query q = session.createQuery("select count(*) from BlogEntity ");
            return ((Long) q.uniqueResult()).intValue();
        } finally {
            if(session != null && session.isOpen()){
                session.close();
            }
        }

    }

    @Override
    public int getCount(String type) throws SQLException {
        Session session = null;
        try {
            session = HibernateService.getSession();
            Query q = session.createQuery("select count(*) from BlogEntity where messageType =:type");
            q.setParameter("type", type);
            return ((Long) q.uniqueResult()).intValue();
        } finally {
            if(session != null && session.isOpen()){
                session.close();
            }
        }
    }

    @Override
    public BlogEntity getBlogById(int id) throws SQLException {
        Session session = null;
        BlogEntity entity = null;
        try {
            session = HibernateService.getSession();
            entity = (BlogEntity) session.get(BlogEntity.class, id);
            return entity;
        } finally {
            if (session != null && session.isOpen()) {
                session.close();
            }
        }
    }

    @Override
    public List<BlogEntity> getPosts(int countIndex, String type) throws SQLException {
        Session session = null;
        try {
            session = HibernateService.getSession();
            int startFrom = 10*countIndex - 10;
            Query q = session.createQuery("From BlogEntity where messageType =:type order by messageId desc");
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
}
