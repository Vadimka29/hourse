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
import ua.com.iweb.dao.OrderDAO;
import ua.com.iweb.enteties.HourseOrderEntity;

import java.io.IOException;
import java.net.URL;
import java.net.URLDecoder;
import java.sql.Date;
import java.sql.SQLException;
import java.util.GregorianCalendar;

/**
 * Created by root on 15.03.15.
 */
@Controller
public class OrderController {

    @RequestMapping(value = "/order/new", method = RequestMethod.POST)
    @ResponseStatus(HttpStatus.OK)
    public void makeOrder(@RequestBody final String json) throws IOException {
        String data = URLDecoder.decode(json.substring(0, json.length()), "utf-8");
        System.out.println("json data:" + data);
        ObjectMapper mapper = new ObjectMapper();
        HourseOrderEntity order = mapper.readValue(data.getBytes("UTF-8"), HourseOrderEntity.class);
        order.setOrderDate(new Date(new GregorianCalendar().getTimeInMillis()));
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
