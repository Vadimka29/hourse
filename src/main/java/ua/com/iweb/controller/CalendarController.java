package ua.com.iweb.controller;

import org.codehaus.jackson.map.ObjectMapper;
import org.springframework.context.ApplicationContext;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import ua.com.iweb.config.DaoBeanConfig;
import ua.com.iweb.dao.EventDAO;
import ua.com.iweb.enteties.EventsEntity;

import java.io.IOException;
import java.net.URLDecoder;
import java.sql.SQLException;

/**
 * Created by vanya on 06.04.15.
 */
@Controller
public class CalendarController {
    @RequestMapping(value="/calendar/{param}", method = RequestMethod.POST)
    @ResponseStatus(HttpStatus.OK)
    public void editCalendar(@RequestBody String json, @PathVariable("param") String type) throws IOException{
        ObjectMapper mapper = new ObjectMapper();
        String data = URLDecoder.decode(json.substring(0, json.length()), "utf-8");
        EventsEntity event = mapper.readValue(data.getBytes("UTF-8"), EventsEntity.class);
        ApplicationContext context = new AnnotationConfigApplicationContext(DaoBeanConfig.class);
        EventDAO eventDAO = (EventDAO) context.getBean("eventDAO");
        switch (type){
            case "add":
                try {
                    eventDAO.saveEvent(event);
                } catch (SQLException e) {
                    System.out.println("Cannot save event!!!");
                }
                break;
            case "delete":
                try {
                    eventDAO.deleteEvent(event.getId());
                } catch (SQLException e) {
                    System.out.println("Cannot delete event!");
                }
                break;
            case "update":
                try {
                    eventDAO.updateEvent(event);
                } catch (SQLException e) {
                    System.out.println("Cannot update event");
                }
                break;
        }
    }
}
