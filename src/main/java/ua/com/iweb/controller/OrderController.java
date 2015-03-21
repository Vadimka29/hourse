package ua.com.iweb.controller;

import org.codehaus.jackson.map.ObjectMapper;
import org.springframework.context.ApplicationContext;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import ua.com.iweb.config.DaoBeanConfig;
import ua.com.iweb.dao.OrderDAO;
import ua.com.iweb.enteties.HourseOrderEntity;

import java.io.IOException;
import java.net.URLDecoder;
import java.sql.SQLException;

/**
 * Created by root on 15.03.15.
 */
@Controller
public class OrderController {

    @RequestMapping(value = "/order/new", method = RequestMethod.POST)
    public void makeOrder(@RequestBody final String json) throws IOException{
        String data = URLDecoder.decode(json.substring(0, json.length()), "utf-8");
        ObjectMapper mapper = new ObjectMapper();
        HourseOrderEntity order = mapper.readValue(data.getBytes(), HourseOrderEntity.class);
        ApplicationContext context = new AnnotationConfigApplicationContext(DaoBeanConfig.class);
        OrderDAO orderDAO = (OrderDAO) context.getBean("orderDAO");
        try {
            orderDAO.addOrder(order);
        } catch (SQLException e) {
            //add some logging
            System.out.println("Can't add order!");
        }
    }
}
