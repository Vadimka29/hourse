package ua.com.iweb.dao;

import ua.com.iweb.enteties.BlogEntity;
import ua.com.iweb.enteties.EventsEntity;
import ua.com.iweb.enteties.GalleryEntity;

import java.sql.SQLException;
import java.util.List;

/**
 * Created by vanya on 24.03.15.
 */
public interface GalleryDAOInterface {
    void addPhoto(GalleryEntity entity) throws SQLException;
    List<GalleryEntity> getPhotos(int countIndex) throws SQLException;
    int getCount() throws SQLException;
    List<GalleryEntity> getAllPhotos() throws SQLException;
    void deletePhoto(String name) throws SQLException;
    void updatePhoto(GalleryEntity gallery) throws SQLException;
}
