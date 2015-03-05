package ua.com.iweb.dao;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;
import org.springframework.orm.hibernate4.LocalSessionFactoryBuilder;
import ua.com.iweb.config.MvcConfiguration;
import ua.com.iweb.enteties.UserEntity;
import ua.com.iweb.helpfull.Login;
import ua.com.iweb.service.HibernateService;

import javax.servlet.http.HttpSession;
import javax.sql.DataSource;
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
            if(user == null)
                return false;
            System.out.println("Proverka: " + formData.getPassword().equals(user.getUserPass()));
            if(formData.getPassword().equals(user.getUserPass()) && res.size() == 1){
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
