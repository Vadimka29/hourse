package ua.com.iweb.dao;

import ua.com.iweb.enteties.EventsEntity;

import java.sql.SQLException;
import java.util.List;

/**
 * Created by vanya on 04.04.15.
 */
public interface EventDAOInterface {
    List<EventsEntity> getAllEvents() throws SQLException;
    void saveEvent(EventsEntity event) throws SQLException;
    void deleteEvent(Integer id) throws SQLException;
    void updateEvent(EventsEntity event) throws SQLException;
}
