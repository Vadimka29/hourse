package ua.com.iweb.dao;

import ua.com.iweb.enteties.UserEntity;

import java.sql.SQLException;
import java.util.List;

/**
 * Created by Vadym on 03.03.15.
 */
public interface UserDAOInterface {
    public List<UserEntity> getAllUsers() throws SQLException;
    public boolean authorizationCheck(String login, String passHash) throws SQLException;
}
