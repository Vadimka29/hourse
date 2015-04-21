package ua.com.iweb.dao;

import ua.com.iweb.enteties.HourseOrderEntity;

import java.sql.SQLException;
import java.util.List;

/**
 * Created by root on 15.03.15.
 */
public interface OrderDAOInterface {
    boolean addOrder(HourseOrderEntity entity) throws SQLException;
    List<HourseOrderEntity> getOrders(int countIndex) throws SQLException;
    List<HourseOrderEntity> getByType(String type, int countIndex) throws SQLException;
    int getOrderCount() throws SQLException;
    int getOrderCountByType(String type) throws SQLException;
    HourseOrderEntity getOrderById(int id) throws SQLException;
}
