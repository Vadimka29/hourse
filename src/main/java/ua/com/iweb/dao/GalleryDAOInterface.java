package ua.com.iweb.dao;

import ua.com.iweb.enteties.BlogEntity;
import ua.com.iweb.enteties.GalleryEntity;

import java.sql.SQLException;
import java.util.List;

/**
 * Created by vanya on 24.03.15.
 */
public interface GalleryDAOInterface {
    public void addPhoto(GalleryEntity entity) throws SQLException;
    public List<GalleryEntity> getPhotos(int countIndex) throws SQLException;
    public int getCount() throws SQLException;
    public List<GalleryEntity> getAllPhotos() throws SQLException;
    public void deletePhoto(String name) throws SQLException;
}
