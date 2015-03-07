package ua.com.iweb.dao;

import org.hibernate.Query;
import org.hibernate.Session;
import ua.com.iweb.enteties.UserEntity;
import ua.com.iweb.helpfull.Login;
import ua.com.iweb.service.HibernateService;

import java.sql.SQLException;
import java.util.List;

/**
 * Created by Vadym on 03.03.15.
 */
public class UserDAO implements UserDAOInterface {

    @Override
    public List<UserEntity> getAllUsers() throws SQLException {
        return null;
    }

    @Override
    public boolean authorizationCheck(Login formData) throws SQLException {
        if(formData == null)
            return false;
        Session session = null;
        UserEntity user = null;
        try {
            session = HibernateService.getSession();
            String hql = "FROM UserEntity u WHERE u.userLogin = :login";
            Query query = session.createQuery(hql);
            query.setParameter("login", formData.getLogin());
            List<UserEntity> res = query.list();
            user = (res.size() == 1) ? res.get(0) : null;
            if(user == null) {
                System.out.println("There is no such user!");
                return false;
            }
            System.out.println("Proverka: " + formData.getPassword().equals(user.getUserPass()));
            if(formData.getPassword().equals(user.getUserPass()) && res.size() == 1){
                System.out.println("Pass true!");
                return true;
            }
        } finally {
            if(session != null && session.isOpen()){
                session.close();
            }
        }
        return false;
    }

    @Override
    public boolean registerUser(UserEntity user) throws SQLException {
        if(user == null)
            return false;
        Session session = null;
        try {
            session = HibernateService.getSession();
            session.beginTransaction();
            session.save(user);
            session.getTransaction().commit();
            return true;
        } finally {
            if(session != null && session.isOpen()){
                session.close();
            }
        }
    }
}
