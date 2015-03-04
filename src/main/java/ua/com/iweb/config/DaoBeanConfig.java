package ua.com.iweb.config;

import org.springframework.aop.scope.DefaultScopedObject;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Scope;
import org.springframework.web.servlet.ViewResolver;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurerAdapter;
import org.springframework.web.servlet.view.InternalResourceViewResolver;
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