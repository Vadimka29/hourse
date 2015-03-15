package ua.com.iweb.dao;

import ua.com.iweb.enteties.HourseOrderEntity;

import java.sql.SQLException;
import java.util.List;

/**
 * Created by root on 15.03.15.
 */
public interface OrderDAOInterface {
    public boolean addOrder(HourseOrderEntity entity) throws SQLException;
    public List<HourseOrderEntity> getOrders(int countIndex) throws SQLException;
}
