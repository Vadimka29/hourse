package ua.com.iweb.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Scope;
import ua.com.iweb.dao.*;
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
    @Bean(name="galleryDAO")
    @Scope("singleton")
    public GalleryDAO getGalleryDAO(){
        GalleryDAO photo = new GalleryDAO();
        return photo;
    }
    @Bean(name="sliderDAO")
    @Scope("singleton")
    public SliderDAO getSliderDAO(){
        SliderDAO sliderDAO = new SliderDAO();
        return sliderDAO;
    }
    @Bean(name="eventDAO")
    @Scope("singleton")
    public EventDAO getEventDAO(){
        EventDAO eventDAO = new EventDAO();
        return eventDAO;
    }
}