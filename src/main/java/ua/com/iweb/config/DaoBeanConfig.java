package ua.com.iweb.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Scope;
import ua.com.iweb.dao.UserDAO;

public class DaoBeanConfig {

    //DAO beans
    @Bean(name = "userDAO")
    @Scope("singleton")
    public UserDAO getUserDAO(){
        UserDAO userDAO = new UserDAO();
        return userDAO;
    }
}