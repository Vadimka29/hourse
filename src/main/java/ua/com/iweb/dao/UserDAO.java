package ua.com.iweb.dao;

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
            user = (UserEntity) session.get(UserEntity.class, login );
            if(passHash.equals(user.getUserPass())){
                return true;
            }
        } finally {
            if(session != null && session.isOpen()){
                session.close();
                return false;
            }
        }
        return false;
    }
}
