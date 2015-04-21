package ua.com.iweb.controller;

import org.codehaus.jackson.map.ObjectMapper;
import org.springframework.context.ApplicationContext;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseStatus;
import ua.com.iweb.config.DaoBeanConfig;
import ua.com.iweb.dao.BlogDAO;
import ua.com.iweb.dao.GalleryDAO;
import ua.com.iweb.dao.OrderDAO;
import ua.com.iweb.enteties.BlogEntity;
import ua.com.iweb.enteties.HourseOrderEntity;

import java.io.IOException;
import java.net.URLDecoder;
import java.sql.Date;
import java.sql.SQLException;
import java.util.GregorianCalendar;

/**
 * Created by vanya on 23.03.15.
 */
@Controller
public class BlogController {
    @RequestMapping(value = "/add_post_to_blog", method = RequestMethod.POST)
    @ResponseStatus(HttpStatus.OK)
    public void makeOrder(@RequestBody final String json) throws IOException {
        String data = URLDecoder.decode(json.substring(0, json.length()), "utf-8");
        ObjectMapper mapper = new ObjectMapper();
        BlogEntity post = mapper.readValue(data.getBytes("UTF-8"), BlogEntity.class);
        post.setMessageDate(new Date(new GregorianCalendar().getTimeInMillis()));
        ApplicationContext context = new AnnotationConfigApplicationContext(DaoBeanConfig.class);
        BlogDAO blogDAO = (BlogDAO) context.getBean("blogDAO");
        try {
            blogDAO.addPost(post);
        } catch (SQLException e) {
            //add some logging
            System.out.println("Can't add post to blog!");
        }
    }
}
