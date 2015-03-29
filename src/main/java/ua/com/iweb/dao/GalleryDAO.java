package ua.com.iweb.dao;

import org.hibernate.Query;
import org.hibernate.Session;
import ua.com.iweb.enteties.GalleryEntity;
import ua.com.iweb.service.HibernateService;

import java.sql.SQLException;
import java.util.List;

/**
 * Created by vanya on 24.03.15.
 */
public class GalleryDAO implements GalleryDAOInterface {
    @Override
    public void addPhoto(GalleryEntity photo) throws SQLException {
        if(photo == null)
            return;
        Session session = null;
        try {
            session = HibernateService.getSession();
            session.getTransaction().begin();
            session.save(photo);
            session.getTransaction().commit();
        } finally {
            if(session != null && session.isOpen()){
                session.close();
            }
        }
    }

    @Override
    public List<GalleryEntity> getPhotos(int countIndex) throws SQLException {
        Session session = null;
        try {
            session = HibernateService.getSession();
            int startFrom = 10*countIndex - 10;
            String hql = "FROM GalleryEntity order by id desc";
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
    public List<GalleryEntity> getAllPhotos() throws SQLException {
        Session session = null;
        try {
            session = HibernateService.getSession();
            String hql = "FROM GalleryEntity";
            Query q = session.createQuery(hql);
            return q.list();
        } finally {
            if(session != null && session.isOpen()){
                session.close();
            }
        }
    }

    @Override
    public void deletePhoto(String name) throws SQLException {
        Session session = null;
        try {
            session = HibernateService.getSession();
            session.getTransaction().begin();
            String hql = "DELETE GalleryEntity where description = :desc";
            Query q = session.createQuery(hql);
            q.setString("desc", name );
            System.out.println(hql);
            q.executeUpdate();
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
            Query q = session.createQuery("select count(*) from GalleryEntity");
            return ((Long) q.uniqueResult()).intValue();
        } finally {
            if(session != null && session.isOpen()){
                session.close();
            }
        }
    }
}
