package ua.com.iweb.dao;

import ua.com.iweb.enteties.SliderEntity;

import java.sql.SQLException;
import java.util.List;

/**
 * Created by vanya on 25.03.15.
 */
public interface SliderDAOInterface {
    public void addPhoto(SliderEntity entity) throws SQLException;
    public List<SliderEntity> getPhotos() throws SQLException;
}
