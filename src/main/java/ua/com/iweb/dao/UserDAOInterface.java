package ua.com.iweb.dao;

import ua.com.iweb.enteties.UserEntity;
import ua.com.iweb.helpfull.Login;

import java.sql.SQLException;
import java.util.List;

/**
 * Created by Vadym on 03.03.15.
 */
public interface UserDAOInterface {
    List<UserEntity> getAllUsers() throws SQLException;
    boolean authorizationCheck(Login login) throws SQLException;
    boolean registerUser(UserEntity user) throws  SQLException;
    int getCountWithSuchLogin(String login) throws  SQLException;
    UserEntity getUserByLogin(String login) throws SQLException;
}
