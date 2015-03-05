package ua.com.iweb.dao;

import org.hibernate.Query;
import org.hibernate.Session;
import ua.com.iweb.enteties.UserEntity;
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
    public boolean authorizationCheck(String login, String passHash) throws SQLException {
        if(login == null || passHash == null)
            return false;
        Session session = null;
        UserEntity user = null;
        try {
            session = HibernateService.getSession();
            String hql = "FROM UserEntity u WHERE u.userLogin = :login";
            Query query = session.createQuery(hql);
            query.setParameter("login", login);
            List<UserEntity> res = query.list();
            user = (res.size() == 1) ? res.get(0) : null;
            System.out.println("Proverka: " + passHash.equals(user.getUserPass()));
            if(passHash.equals(user.getUserPass()) && res.size() == 1){
                return true;
            }
        } finally {
            if(session != null && session.isOpen()){
                session.close();
            }
        }
        return false;
    }
}
