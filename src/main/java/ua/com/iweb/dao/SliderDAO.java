package ua.com.iweb.dao;

import org.hibernate.Query;
import org.hibernate.Session;
import ua.com.iweb.enteties.SliderEntity;
import ua.com.iweb.service.HibernateService;

import java.sql.SQLException;
import java.util.List;

/**
 * Created by vanya on 25.03.15.
 */
public class SliderDAO implements SliderDAOInterface {
    @Override
    public void addPhoto(SliderEntity photo) throws SQLException {
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
    public List<SliderEntity> getPhotos() throws SQLException {
        Session session = null;
        try {
            session = HibernateService.getSession();
            final String hql = "FROM SliderEntity ";
            Query q = session.createQuery(hql);
            return q.list();
        } finally {
            if(session != null && session.isOpen()){
                session.close();
            }
        }
    }
}
