package ua.com.iweb.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Scope;
import ua.com.iweb.dao.BlogDAO;
import ua.com.iweb.dao.OrderDAO;
import ua.com.iweb.dao.UserDAO;
import ua.com.iweb.enteties.HourseOrderEntity;

public class DaoBeanConfig {

    //DAO beans
    @Bean(name = "userDAO")
    @Scope("singleton")
    public UserDAO getUserDAO(){
        UserDAO userDAO = new UserDAO();
        return userDAO;
    }
    @Bean(name="orderDAO")
    @Scope("singleton")
    public OrderDAO getOrderDAO(){
        OrderDAO orderDAO = new OrderDAO();
        return orderDAO;
    }
    @Bean(name="blogDAO")
    @Scope("singleton")
    public BlogDAO getBlogDAO(){
        BlogDAO blogDAO = new BlogDAO();
        return blogDAO;
    }
}